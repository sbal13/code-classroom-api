class SubmissionsController < ApplicationController
  def create
    submission = Submission.create(user_id: params[:user_id], code: params[:code], room_id: params[:room_id])
    if submission
      RoomsChannel.broadcast_to(submission.room, { type: "SUBMISSION_CREATED", payload: SubmissionSerializer.new(submission) })
      render json: submission, status: :created
    else
      render json: { error: "Error in submission" }, status: :bad_request
    end
  end
end
