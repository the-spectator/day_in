class CreateProfiles < ActiveRecord::Migration[7.0]
  def up
    create_enum :gender, ["male", "female", "other"]

    create_table :profiles do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.enum :gender, enum_type: :gender, null: false

      t.timestamps
    end
  end

  def down
    drop_table :profiles

    execute <<-SQL
      DROP TYPE gender
    SQL
  end
end
