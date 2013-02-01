class Ability
  include CanCan::Ability

  def initialize(user)

		#alias_action :new_conversation_ui, :create_conversation_ui, :calculate_timezon, :confirm, :to => :custom_conversation

		user ||= User.new # guest user
 
    if user.role? :admin
      can :manage, :all
    elsif user.role? :buyer
			#can :custom_conversation, Conversation
			can :manage, Conversation do |conversation|
				conversation.try(:buyer) == user
			end
    elsif user.role? :seller 
			# TODO: Update being able to modify the seller field
			#can :manage, Conversation do |conversation|
			#	conversation.try(:seller) == user
			#end
		end
	end

end
