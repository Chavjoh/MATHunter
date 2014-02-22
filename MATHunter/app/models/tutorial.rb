class Tutorial < ActiveRecord::Base
  belongs_to :user
  has_many :chapters, dependent: :destroy
end