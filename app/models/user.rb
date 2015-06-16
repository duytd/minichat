class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }

  has_many :rooms
  has_and_belongs_to_many :joined_rooms, class_name: 'Room'
end