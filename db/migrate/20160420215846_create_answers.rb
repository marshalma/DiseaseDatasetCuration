class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :disease_id
      t.string :answer
      t.string :reason

      t.timestamps null: false
    end
  end
end
