require 'rails_helper'

RSpec.describe Recipient, type: :model do
  it_behaves_like 'factorized model'
  it { is_expected.to have_many :invoices }
  it { is_expected.to have_many :notifications }
end
