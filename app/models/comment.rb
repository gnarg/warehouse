class Comment < ActiveRecord::Base
  belongs_to :change
  validates_presence_of :change_id
end