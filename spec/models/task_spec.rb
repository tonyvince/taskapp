require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }
  it { is_expected.to validate_presence_of(:description) }

  it 'validates stat_time is before end_time' do
    task = build(:task, end_time: 1.hour.ago)
    expect(task.valid?).to be false
    expect(task.errors[:end_time]).to include I18n.t('errors.task.end_date_error')
  end
end
