class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewer
      t.text :body
      t.references :recipe, index: true

      t.timestamps
    end
  end
end
