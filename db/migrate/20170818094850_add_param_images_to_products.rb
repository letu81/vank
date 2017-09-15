class AddParamImagesToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :param_images, :string, array: true, default: []
  end
end