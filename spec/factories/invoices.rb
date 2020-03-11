FactoryBot.define do
  factory :invoice do
    amount_vat_included { 1 }
    amount_vat_excluded { 1 }
  end
end
