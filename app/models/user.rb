class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :missions, dependent: :destroy
  has_many :supervising_missions, through: :supervisions, class_name: Mission.name
  has_many :supervisions,
           class_name: Mission::Supervision.name,
           inverse_of: :supervisor,
           foreign_key: 'supervisor_id'
  has_many :comments, class_name: Mission::Comment.name, inverse_of: :user
  has_many :friendships, dependent: :destroy, inverse_of: :user
  has_many :friends, through: :friendships, class_name: User.name
end
