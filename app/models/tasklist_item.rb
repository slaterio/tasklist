class TasklistItem < ActiveRecord::Base
  belongs_to :tasklist

  validates :content, presence: true,
  			length: { minimum: 2 }
end
