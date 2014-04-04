class CreateQuestionDetails < ActiveRecord::Migration
  def change
    create_table :question_details do |t|
      t.text :notes
      t.references :question, index: true

      t.timestamps
    end
  end
end
