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
  end

  def titles
    @titles
  end

  def languages
    @languages
  end

  def publishers
    @publishers
  end

  def search_texts(title=nil, author=nil, language=nil, publisher=nil, group=nil)
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
      field_term_pairs.push  new_language
    end

    if publisher
      new_publisher = {:publisher => publisher}
      field_term_pairs[:publisher] = new_publisher
    end

    search(field_term_pairs)
  end

  def search_pages(text=nil, title=nil, authors=nil, languages=nil, publishers=nil, groups=nil)
    search([{'pages.text': 'dictionnaire'}])
  end

  private
  def search(field_term_pairs=[])
    must_array = field_term_pairs.map { |pair| {match: pair} }
    @client ||= Elasticsearch::Client.new log: true
    response = @client.search index: 'grammars',
                              type: 'text',
                              size: 10,
                              body: {
                                  query: {
                                      bool: {
                                          must: must_array
                                      }
                                  },
                                  aggregations: {
                                      titles: {terms: {field: 'title.raw', size: 50}},
                                      languages: {terms: {field: 'language.raw', size: 50}},
                                      authors: {terms: {field: 'author.raw', size: 50}},
                                      publishers: {terms: {field: 'publisher.raw', size: 50}},
                                      groups: {terms: {field: 'group.raw', size: 50}}
                                  }
                              }
    %w(titles languages publishers).each { |field| get_agg field, response }
  end

  def get_agg(field, response)
    list = self.instance_variable_get("@#{field}")
    list.clear
    response['aggregations'][field]['buckets'].each do |item|
      list.push(item['key'])
    end
  end


end