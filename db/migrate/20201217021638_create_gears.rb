class CreateGears < ActiveRecord::Migration[6.0]
  def change
    create_table :gears do |t|

      t.timestamps
    end
  end
end
