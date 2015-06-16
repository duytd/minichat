class Room < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  has_and_belongs_to_many :members, class_name: 'User'
end
