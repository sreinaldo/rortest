class Education < ActiveRecord::Base
  belongs_to :profile

  validates :institution, :degree, :start_date, :end_date, presence: true
end
