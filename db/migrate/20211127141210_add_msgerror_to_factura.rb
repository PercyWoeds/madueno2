class AddMsgerrorToFactura < ActiveRecord::Migration
  def change
    add_column :facturas, :msgerror, :string
  end
end
