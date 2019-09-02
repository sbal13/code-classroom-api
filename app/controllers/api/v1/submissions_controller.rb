class Api::V1::SubmissionsController < ApplicationController
  before_action :authorize, only: [:create, :destroy]

  def create
    submission = Submission.find_or_create_by(user_id: session_user.id, room_id: params[:room_id])

    submission.update(code: params[:code])

    if submission
      RoomsChannel.broadcast_to(submission.room, { type: "SUBMISSION_CREATED", payload: SubmissionSerializer.new(submission)})
      render json: submission, status: :created
    else
      render json: { error: "Error in submission" }, status: :bad_request
    end
  end

  def destroy
    submission = Submission.find_by(user_id: params[:user_id], room_id: params[:room_id])


    RoomsChannel.broadcast_to(submission.room, { type: "SUBMISSION_DELETED", payload: submission.user.username})

    submission.destroy

    render json: {message: "SUCCESS"}
  end
end
