class ChangeLinksScaffoldToPosts < ActiveRecord::Migration[7.0]
  def change
    change_table :links do |t|
      t.remove :url
      t.text :post
      t.integer :vote
    end
  end
end
