class CreateHowls < ActiveRecord::Migration[5.1]
  def change
    create_table :howls do |t|
      t.string :content

      t.timestamps
    end
  end
end
