class Play < ApplicationRecord
  belongs_to :song
  belongs_to :user

  validates :user_id, uniqueness: { scope: :song_id }

  def instrument_and_name
    if instrument.present?
      "#{instrument}.#{user.name}"
    else
      user.name
    end
  end

  def owner?(user)
    self.user == user
  end
end
