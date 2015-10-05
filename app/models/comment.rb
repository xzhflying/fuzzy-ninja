class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user, inverse_of: :comments
  belongs_to :mission, inverse_of: :comments
end
