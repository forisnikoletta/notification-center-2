class Notification < ApplicationRecord
	validates_presence_of :title, :body

#	belongs_to :users
#	accepts_nested_attributes_for :users,
#								reject_if: lambda { |attrs| attrs['id'].blank? }
end
