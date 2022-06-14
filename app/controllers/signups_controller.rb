class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def create
    signup = Signup.create!(signup_params)
    activity = signup.activity
    render json: activity, status: :created
  end


  private 

  def signup_params
    params.permit(:activity_id, :camper_id, :time)
  end 

  def render_record_invalid
    render json: {errors: ["validation errors"]}, status: :unprocessable_entity
  end


end
