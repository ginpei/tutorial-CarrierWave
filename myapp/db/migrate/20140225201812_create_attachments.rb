class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :data

      t.timestamps
    end
  end
end
