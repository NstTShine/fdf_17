class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new
    if user.admin?
      can :manage, :all
    else user.member?
      can :read, Order
      can :create, Order
      can :update, Order
    end
  end
end
