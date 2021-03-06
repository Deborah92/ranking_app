class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    cannot :manage, :all

    can :index, User
    can [:index, :show], Dog
    can :filtrado, Result

    if !user.cahoot?
      can [:index, :show], Dog
      can [:edit, :update], User, ['user.id = ?', user.id] do |u|
        u.id == user.id
      end
      can [:show], Result
      can [:index], Result, ['dog_id = ?', user.id] do |r|
        r.dog.user_id == user.id
      end
    end

    if user.cahoot?
      can [:index, :show], Dog
      can [:new, :create], Dog
      can [:edit, :update, :destroy], Dog, ['dogs.user_id = ?', user.id] do |dog|
        dog.user_id == user.id
      end
      can [:edit, :update], User, ['user.id = ?', user.id] do |u|
        u.id == user.id
      end
      can [:new, :create, :show], Result
      can [:index, :destroy], Result, ['dog_id = ?', user.id] do |r|
        r.dog.user_id == user.id
      end
    end

    if user.admin?
      can :index, :all
      can [:new, :create, :edit, :update, :destroy], Dog
      can [:new, :create, :edit, :update, :destroy], User
      can [:new, :create, :edit, :update, :destroy, :show], Result
    end

    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
