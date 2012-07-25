class User < ActiveRecord::Base

	# Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname
	has_many :created_rooms, :class_name => "Room", :foreign_key => :creator_id
	has_many :joined_rooms, :class_name => "Room", :foreign_key => :joiner_id

	validates_presence_of :firstname, :email, :password

	def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(:email => auth.info.email).first
		unless user
			# CHECK FOR NEW/CREATE
			user = User.new(firstname:auth.info.first_name,
												 lastname:auth.info.last_name,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
			
		end
		user
  end

	def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]
        user.email = data.info.email
				user.firstname = data.info.first_name
				user.lastname = data.info.last_name
				user.uid = data.uid
      end
    end
  end

end
