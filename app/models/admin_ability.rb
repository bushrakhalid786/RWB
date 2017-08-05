class AdminAbility
  include CanCan::Ability
  def initialize(user)
  	byebug
    if user && user.admin?
      can :access, :rails_admin
      can :manage, :all   
    end
  end
end
