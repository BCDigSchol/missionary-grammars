class TextSection < ActiveRecord::Base
  belongs_to :parent, class_name: 'TextSection', foreign_key: 'parent_id'
  has_many :children, class_name: 'TextSection'
  belongs_to :text

  def self.base_section(text)
    top_node = TextSection.where('text_id = ? AND parent_id IS NULL', text.id).first
    unless top_node
      top_node = TextSection.new
      top_node.title = 'base_node'
      top_node.from = -1
      top_node.ordinal = 0
      top_node.text = text
      top_node.save
    end
    top_node
  end
end