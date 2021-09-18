class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.datetime :time
      t.string :score

      t.timestamps
    end
  end
end
