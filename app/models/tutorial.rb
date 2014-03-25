class Tutorial < ActiveRecord::Base
  belongs_to :user
  has_many :chapters, dependent: :destroy
  
  def self.search(query)
    where("title like ?", "%#{query}%") 
  end
end
