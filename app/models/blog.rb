class Blog < ApplicationRecord
  belongs_to :owner, class_name: "User" 
  has_many :articles
  has_many :comments, through: :articles
  
  def self.all_by_article_count
    Blog.all.left_joins(:articles).group(:id).order('COUNT(articles.id) DESC')
  end

  def self.all_by_comment_count
    Blog.all.left_joins(:comments).group(:id).order('COUNT(comments.id) DESC')
  end

  def to_s
    title
  end

  def user_is_owner(user)
    user == owner
  end


end
