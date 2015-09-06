class ClockoutsController < ApplicationController
  before_action :authenticate_user!
  respond_to :json, only: [:create]

  def create
    if new_clockout(clockout_params).save
      render json: { html: render_to_string(partial: '/clockins/button',
                     locals: { project: clockin.project,
                               clockin: clockin.project.clockins.build }) }
    else
      render status: 422
    end
  end

private

  def clockin
    @clockin ||= current_user.clockins.find(params[:clockin_id])
  end

  def clockout
    @clockout ||= current_user.clockouts.find(params[:id])
  end

  def new_clockout(attrs={})
    @clockout ||= clockin.build_clockout(attrs)
  end

  def clockout_params
    { clockin_id: clockin.id }
  end
end
