class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :estimate_time
      t.string :owner
      t.timestamps
    end

    create_table :members do |t|
      t.string :name
      t.timestamps
    end

    create_table :project_members do |t|
      t.integer :project_id, index: { unique: true}
      t.integer :member_id, index: { unique: true}
      t.timestamps
    end
  end
end
