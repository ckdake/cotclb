require_relative "application_policy"

class TeamPolicy < ApplicationPolicy
  def destroy?
    @user.admin?
  end
  
  def update?
    @user.admin?
  end
  
  def create?
    @user.admin?
  end
  
  def edit?
    @user.admin?
  end
end
