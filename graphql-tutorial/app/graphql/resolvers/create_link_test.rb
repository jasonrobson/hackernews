require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  test 'creating new link' do
    link = perform(
      url: 'http://ghost.com',
      description: 'entra na minha casa, entra na minha vida',
    )

    assert link.persisted?
    assert_equal link.description, 'entra na minha casa, entra na minha vida'
    assert_equal link.url, 'http://ghost.com'
  end
end