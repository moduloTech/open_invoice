class Recipient < ApplicationRecord
  has_many :notifications
  has_many :invoices, through: :notifications
end