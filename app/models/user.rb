class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :missions, dependent: :destroy
  has_many :mission_comments, class_name: Mission::Comment.name
  has_many :supervisions, class_name: Mission.name, inverse_of: :supervisor
end
