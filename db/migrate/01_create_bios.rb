class CreateBios < ActiveRecord::Migration[6.0]
    def change
        create_table :bios do |t|
            t.integer :level
            t.string :name
        end
    end
end