class User < ApplicationRecord
  has_many :blogs, foreign_key: "owner_id"
  has_many :articles, foreign_key: "author_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    "#{name} (#{email})"
  end
end
