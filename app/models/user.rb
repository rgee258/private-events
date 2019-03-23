class User < ApplicationRecord
  before_save {self.email = email.downcase}

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :created_events, :class_name => "Event", :foreign_key => "creator_id"
  has_many :event_attendees, :foreign_key => "attendee_id"
  has_many :attended_events, :through => :event_attendees, :source => :attended_event

  def upcoming_events
    self.attended_events.where("date >= ?", DateTime.now)
  end

  def previous_events
    self.attended_events.where("date < ?", DateTime.now)
  end
end