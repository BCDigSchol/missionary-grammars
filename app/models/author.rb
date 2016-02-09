class Author < ActiveRecord::Base
  has_and_belongs_to_many :texts

  def full_name
    full = last
    if first
      full = full + ', ' + first
    end
    return full
  end

end
