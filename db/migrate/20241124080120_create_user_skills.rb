class CreateUserSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :user_skills do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill_category, null: false, foreign_key: true
      t.string :rating

      t.timestamps
    end
  end
end
