class CreateEnterprises < ActiveRecord::Migration[5.2]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.integer :enterprise_types

      t.timestamps
    end
  end
end
