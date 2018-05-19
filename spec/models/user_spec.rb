require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_email) { 'me@example.com' }
  let(:invalid_email) { 'me_example.com' }

  it { should have_secure_password }

  it { is_expected.to have_many(:tasks) }

  it { is_expected.to validate_presence_of(:email).on(:create) }
  subject { create(:user) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to allow_value(valid_email).for(:email) }
  it { is_expected.not_to allow_value(invalid_email).for(:email) }
  it { is_expected.to validate_length_of(:password).is_at_least(8).on(:create) }
end
