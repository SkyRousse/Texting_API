class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.column :body, :string
      t.column :to, :string
      t.column :from, :string

      t.timestamps
    end
  end
end
