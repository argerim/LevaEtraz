class EnableExtensionCitext < ActiveRecord::Migration
  def change
    enable_extension 'citext'
  end
end
