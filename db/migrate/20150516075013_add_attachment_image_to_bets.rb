class AddAttachmentImageToBets < ActiveRecord::Migration
  def self.up
    change_table :bets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bets, :image
  end
end
