class CreateTables < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description
    end
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.string :git_url
    end
    create_table :projects_skills, id: false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :skill, index: true
    end
  end
end
