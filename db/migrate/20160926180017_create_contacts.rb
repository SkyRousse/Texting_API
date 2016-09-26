class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.column :name, :string
      t.column :phone, :string
    end
  end
end
