require 'app_auth0_client'

class User < ApplicationRecord
  def fetch_auth0_user_and_save!
    auth0_user = AppAuth0Client.instance.user(auth0_id)
    assign_attributes(
      name: auth0_user.fetch('name'),
      joined_year: auth0_user.fetch('user_metadata').fetch('joined_year'),
      livelog_member_id: auth0_user.fetch('user_metadata').fetch('livelog_member_id'),
    )
    save!
  end
end
