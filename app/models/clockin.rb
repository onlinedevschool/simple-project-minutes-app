class Clockin < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_one    :clockout, dependent: :destroy

  scope :completed, -> {
    joins(:clockout).where("clockouts.clockin_id = clockins.id")
  }

  def completed?
    clockout.present?
  end
end
