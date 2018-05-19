class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_time, :end_time, :description
  validate :end_time_is_after_start_time

  private

    def end_time_is_after_start_time
      return if end_time.blank? || start_time.blank? || end_time > start_time
      errors.add(:end_time, I18n.t('errors.task.end_date_error'))
    end
end
