class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :title
      t.text :body
      t.string :username
      t.integer :user_id

      t.timestamps
    end
  end
end
