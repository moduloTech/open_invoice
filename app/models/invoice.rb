# This model stores invoices information
# - uses money_rails to store amounts
# - has many notifications, recepients, visits and attachments
# - uses state_machine to switch invoice states
class Invoice < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :recipients, through: :notifications
  has_many :visits, dependent: :destroy
  has_many :attachments, dependent: :destroy
  
  monetize :amount_vat_excluded_cents
  monetize :amount_vat_included_cents

  # amounts are required
  # amount vat included should be >= than amount vat excluded
  validates :amount_vat_included,
            numericality: { greater_than_or_equal_to: :amount_vat_excluded }
  validates :amount_vat_excluded,
            numericality: { greater_than_or_equal_to: 0.01 }

  # VAT helper function
  # calculates as diff between amounts with and without VAT
  def vat
    amount_vat_included - amount_vat_excluded
  end
end

