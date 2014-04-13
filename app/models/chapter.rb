class Chapter < ActiveRecord::Base
  belongs_to :tutorial
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true
end
