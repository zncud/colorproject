class CreateSuggeColors < ActiveRecord::Migration[5.1]
  def change
    create_table :sugge_colors do |t|
      t.string :rgb
      t.timestamps
    end
  end
end
