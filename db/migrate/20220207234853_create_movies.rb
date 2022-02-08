class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :year_of_release
      t.string :rating
      t.integer :person_id

      t.timestamps
    end
  end
end
