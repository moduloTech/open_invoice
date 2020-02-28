require 'rails_helper'

RSpec.describe Attachment, type: :model do
  it_behaves_like 'factorized model'
  it { is_expected.to belong_to :invoice }
end
