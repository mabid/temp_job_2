class OfficesController < ApplicationController
  before_action :set_office, except: %w(index)

  def index
    @offices = Office.all
  end

  def show
  end

  def temp_jobs
    @temp_jobs = TempJobPost.joins(:requests).where("(created_by_id = ? AND created_by_type = 'Office' AND public = true) OR (created_by_type = 'Professional' AND public = true AND temp_job_proposals.receiver_type = 'Office' AND temp_job_proposals.receiver_id = ?)", @office.id, @office.id ).distinct
  end

  def booking_proposals
    @booking_proposals = TempJobPost.joins(:requests).where(requests: { receiver: @office })
  end

  def booking_requests
    @booking_requests = TempJobPost.joins(:requests).where(requests: { sender: @office }, created_by: @office, public: false).distinct
  end

  def post_temp_job
    @office.temp_jobs.find(params[:temp_job_id]).update(post: true)
    redirect_back fallback_location: root_path
  end

  private

  def set_office
    @office = Office.find(params[:id])
  end
end
