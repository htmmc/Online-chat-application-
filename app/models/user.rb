class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  		:registerable,
        :recoverable, 
        :rememberable, 
        :trackable, 
        :validatable,
        :confirmable

	scope :public_fields, -> { select(:name, :agegroup, :license_type, :registration_type, :description, :religion, :specialty, :categories, :description, :beginning_of_available_time, :end_of_available_time) }        
 
  protected

    #def confirmation_required?
    #  false
    #end
    #Test to see if this will skip the confirmation process for now

    def skip_confirmation!
      self.confirmed_at = Time.now
    end

    def confirmation_required?
      false
    end


end
