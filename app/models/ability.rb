class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    # Post Owner for Posts
    can :manage, Post do |post|
      user == post.user
    end

    # Comment Owner for comments
    can :manage, Comment do |comment|
      user == comment.user
    end

    # Post owner for Comments on their posts
    can :destroy, Comment do |comment|
      user == comment.post.user
    end

  end
end
