class Event < ApplicationRecord
  belongs_to :place

  before_save :default_date

  private
    def default_date
      self.date ||= Time.now
    end
end
