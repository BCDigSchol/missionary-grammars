class LanguagesText < ActiveRecord::Base
  belongs_to :language
  belongs_to :text
end
