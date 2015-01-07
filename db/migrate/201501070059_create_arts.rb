class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :author
      t.string :born_died
      t.string :title
      t.string :date
      t.string :technique
      t.string :location
      t.string :url
      t.string :form
      t.string :type
      t.string :school
      t.string :timeframe
    end
  end
end
