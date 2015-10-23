class Ability
  include CanCan::Ability
  attr_reader :user

  # Initialize the ability of user.
  # For now a user can do anything...
  #
  # @param [User|nil] user The current user. This can be nil if the no user is logged in.
  def initialize(user)
    @user = user
    can :manage, :all
  end
end
