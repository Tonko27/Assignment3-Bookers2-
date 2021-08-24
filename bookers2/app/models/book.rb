class Book < ApplicationRecord
  
  belongs_to :user
end

#validates :title, presence: true
#validates :body, presence: true, length: { maximum: 200 }