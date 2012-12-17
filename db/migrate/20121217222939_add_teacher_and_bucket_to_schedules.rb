class AddTeacherAndBucketToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :teacher_id, :integer
    add_column :schedules, :bucket, :string
  end
end
