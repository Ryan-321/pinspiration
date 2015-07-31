class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :image_url
      t.string :caption
      t.belongs_to :user
    end
  end
end
