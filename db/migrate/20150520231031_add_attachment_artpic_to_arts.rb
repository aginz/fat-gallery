class AddAttachmentArtpicToArts < ActiveRecord::Migration
  def self.up
    change_table :arts do |t|
      t.attachment :artpic
    end
  end

  def self.down
    remove_attachment :arts, :artpic
  end
end
