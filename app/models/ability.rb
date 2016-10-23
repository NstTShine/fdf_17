class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    else user.role == "member"
      can :read, Order
      can :create, Order
      can :update, Order
    end
  end
end
