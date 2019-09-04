class Api::V1::CohortsController < ApplicationController

  before_action :authorize, only: [:create, :join_cohort]

  def index
    cohorts = Cohort.all

    render json: cohorts
  end

  def join_cohort
    cohort = Cohort.find(params[:id])
    uc = UserCohort.new(cohort: cohort, user: session_user)

    if uc.save
     render json: cohort
    else
      render json: {errors: "You're already in this cohort!"}
    end

  end

  def create
    cohort = Cohort.new(cohort_params)

    if cohort.save
      cohort.users << session_user

      render json: cohort
    else
      render json: {errors: cohort.errors.full_messages}
    end
  end

  private

  def cohort_params
    params.require(:cohort).permit(:name)
  end
end
