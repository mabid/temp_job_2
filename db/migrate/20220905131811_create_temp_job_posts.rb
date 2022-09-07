class CreateTempJobPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :temp_job_posts do |t|
      t.datetime :time_range
      t.boolean :public
      t.references :created_by, polymorphic: true, null: true

      t.timestamps
    end
  end
end
