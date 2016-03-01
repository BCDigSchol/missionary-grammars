class Text < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :publishers
  belongs_to :missionary_group
  belongs_to :text_category
  has_many :languages_texts
  has_many :languages, through: :languages_texts
  has_many :text_sections

  accepts_nested_attributes_for :authors, allow_destroy: true
  accepts_nested_attributes_for :missionary_group, allow_destroy: true
  accepts_nested_attributes_for :publishers, allow_destroy: true
  accepts_nested_attributes_for :text_category, allow_destroy: true


  scope :title, -> (title) { where('upper(title) like ?', "#{title.upcase}%") }
  scope :author, -> (author) { joins(:authors).where('concat_ws(\' \', upper(authors.first::text), upper(authors.last::text)) like ?', "%#{author.upcase}%") }
  scope :author_id, -> (id) { joins(:authors).where('authors.id = ?', id) }
  scope :missionary_group, -> (id) { joins(:missionary_group).where('missionary_groups.id = ?', id) }

  def hathi_output_url
    if hathi_url and hathi_url.include?('http')
      return hathi_url
    else
      return false
    end
  end

  def google_books_output_url
    if google_url and google_url.include?('http')
      return google_url
    else
      return false
    end
  end

  def structure
    self.text_sections.where('parent_id IS NULL').first.get_json_renderable
  end
end
