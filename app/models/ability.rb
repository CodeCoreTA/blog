class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new

    can :manage, Post do |post|
      user == post.user
      # user == q.user || user.is_moderator?
    end

  end
end
