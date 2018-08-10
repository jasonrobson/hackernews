require 'test_helper'

class Resolvers::CreateUserTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateUser.new.call(nil, args, nil)
  end

  test 'creating new user' do
    user = perform(
      name: 'Xymbalaiane',
      authProvider: {
        email: {
          email: 'fulanodetal@bol.com.br',
          password: '[omitted]'
        }
      }
    )

    assert user.persisted?
    assert_equal user.name, 'Xymbalaiane'
    assert_equal user.email, 'fulanodetal@bol.com.br'
  end
end