class ProfessionalsController < ApplicationController
  before_action :set_professional, except: %w(index)
  def index
    @professionals = Professional.all
  end

  def show
  end

  def temp_job_posts
    @temp_job_posts = TempJobPost.where(public: true)
  end

  def invites
    @invites = TempJobPost.joins(:requests).where(requests: { receiver: @professional })
  end

  def applications
    @applications = Application.where(sender: @professional)
  end

  def proposals
    @proposals = TempJobPost.where(created_by: @professional)
  end

  private

  def set_professional
    @professional = Professional.find(params[:id])
  end
end
