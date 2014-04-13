class Tutorial < ActiveRecord::Base
  belongs_to :user
  has_many :chapters, dependent: :destroy
  
  validates :title, presence: true
  validates :difficulty, presence: true
  
  def self.search(query)
    where("title like ?", "%#{query}%") 
  end
end
