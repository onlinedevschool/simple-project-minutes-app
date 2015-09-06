class ClockinsController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, only: [:new]
  respond_to :json, only: [:create]

  def new
    new_clockin
  end

  def create
    if new_clockin(clockin_params).save
      render json: { html: render_to_string(partial: '/clockouts/button',
                       locals: { clockin: new_clockin,
                                 clockout: new_clockin.build_clockout }) }
    else
      render status: 422
    end
  end

private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def new_clockin(attrs={})
    @clockin ||= project.clockins.new(attrs)
  end

  def clockin_params
    { user_id: current_user.id }
  end
end
