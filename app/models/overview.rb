class Overview < ActiveRecord::Base
  belongs_to :profile

  validates :description, presence: true
end
