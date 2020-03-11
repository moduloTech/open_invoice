require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it_behaves_like 'factorized model'
  it { is_expected.to have_many :recipients }
  it { is_expected.to have_many :notifications }
  it 'validates amount' do 
    expect(build(:invoice, amount_vat_included: 2, amount_vat_excluded: 1)).to be_valid
    expect(build(:invoice, amount_vat_included: 2, amount_vat_excluded: 2)).to be_valid
    expect(build(:invoice, amount_vat_included: 1, amount_vat_excluded: 2)).not_to be_valid
    expect(build(:invoice, amount_vat_included: 0, amount_vat_excluded: 0)).not_to be_valid
  end

end
