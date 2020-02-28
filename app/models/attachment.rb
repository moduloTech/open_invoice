class Attachment < ApplicationRecord
  belongs_to :invoice
  mount_uploader :original_file, OriginalFileUploader
end