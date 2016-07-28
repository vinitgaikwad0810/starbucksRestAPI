class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :location
      t.string :status

      t.timestamps


    end


  end
end
