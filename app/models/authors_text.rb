class AuthorsText < ActiveRecord::Base
  belongs_to :author
  belongs_to :text
end
