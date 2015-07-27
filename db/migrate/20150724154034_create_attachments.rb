class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.text :about
      t.string :title
      t.string :location
      t.string :url
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
