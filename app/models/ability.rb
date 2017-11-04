class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    # ||= significa que si usuario esta definido lo mantiene sino crea uno nuevo
      user ||= User.new(role: 2) # manejo de vistas el role 2 es gues
       if user.admin?
         can :manage, :all
       elsif user.author?
         can :read, :all
         can :create, Pin
         can [:destroy, :update], Pin, user_id: user.id # solo puede borrar cuando sean del usuario
       elsif user.guest?
         can :read, :all
       end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
