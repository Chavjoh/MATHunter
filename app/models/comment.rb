class Comment < ActiveRecord::Base
  belongs_to :chapter
  belongs_to :user
  
  validates :content, presence: true
  self.per_page = 5
end
