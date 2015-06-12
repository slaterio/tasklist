class Tasklist < ActiveRecord::Base
	has_many :tasklist_items

	validates :title, presence: true
	validates :title, length: { minimum: 3 }
	validates :description, presence: true
	validates :description, length: { minimum: 3 }
end
