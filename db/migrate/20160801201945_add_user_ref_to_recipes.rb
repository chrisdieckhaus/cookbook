class AddUserRefToRecipes < ActiveRecord::Migration
  def change
    add_reference :recipes, :user, index: true
  end
end
