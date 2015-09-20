class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { maximum: 20 }
end
