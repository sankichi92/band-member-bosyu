require 'app_auth0_client'

class User < ApplicationRecord
  has_many :songs, dependent: :restrict_with_exception
  has_many :plays, dependent: :restrict_with_exception

  def fetch_auth0_user_and_save!
    auth0_user = AppAuth0Client.instance.user(auth0_id)
    assign_attributes(
      name: auth0_user.fetch('name'),
      joined_year: auth0_user.fetch('user_metadata').fetch('joined_year'),
      livelog_member_id: auth0_user.fetch('user_metadata').fetch('livelog_member_id'),
    )
    save!
  end

  def year_and_name
    "#{joined_year} #{name}"
  end
end
