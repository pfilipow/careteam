class Blog < ApplicationRecord
  belongs_to :owner, class_name: "User"   #, foreign_key: :owner_id
  has_many :articles

  def to_s
    title
  end
end
