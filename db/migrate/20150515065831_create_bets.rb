class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.string :name
      t.float :betamount
      t.float :potentialwins
      t.integer :votes

      t.timestamps null: false
    end
  end
end
