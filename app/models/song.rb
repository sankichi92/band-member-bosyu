class Song < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/, allow_blank: true

  def title
    if artist.present?
      "#{name} / #{artist}"
    else
      name
    end
  end

  def owner?(user)
    self.user == user
  end
end
