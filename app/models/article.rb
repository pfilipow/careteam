class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :author, class_name: "User"
  has_many :comments
end
