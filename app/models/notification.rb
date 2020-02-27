class Notification < ApplicationRecord

  belongs_to :invoice
  belongs_to :recipient

  validates :recipient_id, uniqueness: { scope: :invoice_id }

end