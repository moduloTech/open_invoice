# This model is used to store invoice attachments
# Attachments can be added only to draft invoices
class Attachment < ApplicationRecord
  belongs_to :invoice
  mount_uploader :original_file, OriginalFileUploader
end