class Blog < ApplicationRecord
  belongs_to :owner, class_name: "User" 
  has_many :articles
  has_many :comments, through: :articles
  
  def to_s
    title
  end

  def user_is_owner(user)
    user == owner
  end
end
