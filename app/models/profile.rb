class Profile < ActiveRecord::Base
  belongs_to :user
  has_one :overview
  has_many :skills, dependent: :delete_all
  has_many :educations, dependent: :delete_all

  validates :name, presence: true
  scope :by_user, lambda { |user|
    where(user_id: user.id)
  }
end
