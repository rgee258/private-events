class Event < ApplicationRecord
  scope :upcoming,  -> { where("date >= ?", DateTime.now) }
  scope :past, -> { where("date < ?", DateTime.now) }

  belongs_to :creator, :class_name => "User"
  has_many :event_attendees, :foreign_key => "attended_event_id"
  has_many :attendees, :through => :event_attendees, :source => :attendee
end