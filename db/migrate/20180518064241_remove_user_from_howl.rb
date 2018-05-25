class RemoveUserFromHowl < ActiveRecord::Migration[5.1]
  def change
    remove_reference :howls, :user, foreign_key: true
  end
end
