class CreateUserBios < ActiveRecord::Migration[6.0]
    def change
        create_table :user_bios do |t|
            t.integer :user_id
            t.integer :bio_id
        end
    end
end