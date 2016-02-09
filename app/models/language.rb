class Language < ActiveRecord::Base
  has_many :alternate_designations
  has_and_belongs_to_many :orthographies
  has_many :languages_texts
  has_many :texts, through: :languages_texts
end
