class ReviewFlagForChangesets < ActiveRecord::Migration
  def self.up
    add_column :changesets, :needs_review, :boolean
  end

  def self.down
    remove_column :changesets, :needs_review
  end
end
