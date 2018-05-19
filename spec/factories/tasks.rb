FactoryBot.define do
  factory :task do
    user
    start_time Time.current
    end_time 1.hour.from_now
    description 'MyText'
  end
end
