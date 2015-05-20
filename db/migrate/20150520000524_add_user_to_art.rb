class AddUserToArt < ActiveRecord::Migration
  def change
    add_reference :arts, :user, index: true, foreign_key: true
  end
end
