class CreateBuyers < ActiveRecord::Migration[5.0]
  def change
    create_table :buyers do |t|

      t.timestamps
    end
  end
end
