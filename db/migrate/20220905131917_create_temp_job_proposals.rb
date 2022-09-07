class CreateTempJobProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_job_proposals do |t|
      t.string :type
      t.integer :temp_job_post_id
      t.string :status
      t.references :sender, polymorphic: true, null: true
      t.references :receiver, polymorphic: true, null: true

      t.timestamps
    end
  end
end
