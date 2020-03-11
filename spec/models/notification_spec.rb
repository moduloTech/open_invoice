require 'rails_helper'

RSpec.describe Notification, type: :model do
  it_behaves_like 'factorized model'
  it { is_expected.to belong_to :invoice }
  it { is_expected.to belong_to :recipient }
end
