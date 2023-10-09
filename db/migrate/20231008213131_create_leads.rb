class CreateLeads < ActiveRecord::Migration[7.1]
  def change
    create_table :leads do |t|
      t.references :admin, null: false, foreign_key: { to_table: :users }
      t.string :country
      t.string :company
      t.string :website
      t.string :linkedin
      t.string :email
      t.integer :phone
      t.string :type

      t.timestamps
    end
  end
end
