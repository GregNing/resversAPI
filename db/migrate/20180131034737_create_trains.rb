class CreateTrains < ActiveRecord::Migration[5.1]
  def change
    create_table :trains do |t|
      t.string :number, :index => true # 列車號碼
      t.timestamps
    end
  end
end
