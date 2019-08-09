class AddEventsToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :event, foreign_key: true
  end
end
