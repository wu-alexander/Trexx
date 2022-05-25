class Dashboard
  def initialize(user)
    @user = user
  end

  def client_bookings
    @user.bookings
  end

  def host_treks
    @user.treks
  end

  def host_bookings
    @user.host_bookings
  end
end
