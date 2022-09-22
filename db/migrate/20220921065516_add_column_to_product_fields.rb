class AddColumnToProductFields < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_fields, :user, index: true
  end
end
