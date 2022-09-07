class TempJobPost < ApplicationRecord
  belongs_to :created_by, polymorphic: true
  has_many :temp_job_proposals
  has_many :requests
  has_many :applications
end
