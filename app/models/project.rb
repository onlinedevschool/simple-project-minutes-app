class Project < ActiveRecord::Base
  has_many :clockins, dependent: :destroy

  def elapsed_minutes
    clockins.completed.reduce(0) do |acc, clockin|
      delta = (clockin.clockout.created_at.to_f - clockin.created_at.to_f)
      acc + (delta/60)
    end
  end

end
