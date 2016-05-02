# This migration comes from site_framework (originally 20160216141442)
class AddDefaultTemplateToSites < ActiveRecord::Migration
  def up
    add_column :site_framework_sites, :default_template, :string, default: ''
  end

  def down
    remove_column :site_framework_sites, :default_template
  end
end
