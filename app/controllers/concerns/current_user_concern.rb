module CurrentUserConcern
  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

#inherit from guest_user model
#Guest user is the true user inherit from devise.
#need to create in order to user petergate  => ##application/helper
  def guest_user
    guest = GuestUser.new
    # guest.name = "Guest User"
    # guest.first_name = "Guest"
    # guest.last_name = "User"
    guest.email = "Guest User"
    guest
  end

end
