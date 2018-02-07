class CreateVideostyles < ActiveRecord::Migration[5.1]
  def change
    create_table :videostyles do |t|

      t.timestamps
    end
  end
end
