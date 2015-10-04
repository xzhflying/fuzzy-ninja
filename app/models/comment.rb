class Comment < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 200 }

  belongs_to :user
  belongs_to :mission
end
