class SearchIndex
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize
    @languages = []
    @titles = []
    @authors = []
    @publishers = []
    @groups = []
    @dates = []
    @categories = []
    @hits = {}
  end

  def hits
    @hits
  end

  def titles
    @titles
  end

  def authors
    @authors
  end

  def languages
    @languages
  end

  def publishers
    @publishers
  end

  def dates
    @dates
  end

  def categories
    @categories
  end

  def search_texts(title=nil, author=nil, language=nil, publisher=nil, group=nil, date=nil, text_category=nil, sorted=true)
    field_term_pairs = []

    if title
      new_title = {:title => title}
      field_term_pairs.push new_title
    end

    if author
      new_author = {:author => author}
      field_term_pairs.push new_author
    end

    if language
      new_language = {:language => language}
      field_term_pairs.push new_language
    end

    if publisher
      new_publisher = {:publisher => publisher}
      field_term_pairs.push new_publisher
    end

    if date
      new_date = {:date => date}
      field_term_pairs.push new_date
    end

    if text_category
      new_category = {:text_category => text_category}
      field_term_pairs.push new_category
    end

    search(field_term_pairs)

    if sorted
      @hits[:items].sort_by { |hit| hit['title'] }
    end
  end

  private
  def search(field_term_pairs=[])
    must_array = field_term_pairs.map { |pair| {match: pair} }

    @client ||= Elasticsearch::Client.new log: true
    response = @client.search index: 'grammars',
                              type: 'text',
                              size: 30,
                              fields: [:title, :author, :date, :text_category],
                              body: {
                                  query: {
                                      bool: {
                                          must: must_array
                                      }
                                  },
                                  aggregations: {
                                      titles: {terms: {field: 'title.raw', order: {_term: 'asc'}, size: 50}},
                                      languages: {terms: {field: 'language.raw', order: {_term: 'asc'}, size: 50}},
                                      authors: {terms: {field: 'author.raw', order: {_term: 'asc'}, size: 50}},
                                      publishers: {terms: {field: 'publisher.raw', order: {_term: 'asc'}, size: 50}},
                                      groups: {terms: {field: 'group.raw', order: {_term: 'asc'}, size: 50}},
                                      dates: {terms: {field: 'date', order: {_term: 'asc'}, size: 50}},
                                      categories: {terms: {field: 'text_category.raw', order: {_term: 'asc'}, size: 50}}
                                  }
                              }
    %w(titles authors languages publishers dates categories).each { |field| get_agg field, response }
    get_hits response
  end

  def get_agg(field, response)
    list = self.instance_variable_get("@#{field}")
    list.clear
    response['aggregations'][field]['buckets'].each do |item|
      list.push(item['key'])
    end
  end

  def get_hits(response)
    @hits = {}
    @hits[:hits] = response['hits']['total']
    @hits[:items] = response['hits']['hits'].map { |hit| {
        id: hit['_id'],
        title: hit['fields']['title'],
        author: hit['fields']['author'],
        date: hit['fields']['date']}
    }
  end


end