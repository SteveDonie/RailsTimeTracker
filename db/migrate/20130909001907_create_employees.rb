class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fullName
      t.string :mobileNumber

      t.timestamps
    end
  end
end
