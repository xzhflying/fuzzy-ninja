class Mission < ActiveRecord::Base
  validates :target, :status, presence: true
  validates :target, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }

  belongs_to :user, dependent: :destroy
end
