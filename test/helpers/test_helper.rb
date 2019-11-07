class ActionDispatch::IntegrationTest

  def login_as(user)
    post login_url, params:{ username: user.username, password: 'secret' }
  end

  def logout
    delete logout_url
  end

  def setup
    login_as users(:one)
  end
end
