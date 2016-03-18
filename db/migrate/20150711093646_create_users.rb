class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :last_sign_out_at

      t.timestamps
    end
  end
end
