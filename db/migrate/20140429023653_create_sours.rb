class CreateSours < ActiveRecord::Migration
  def change
    create_table :sours do |t|

      t.timestamps
    end
  end
end
