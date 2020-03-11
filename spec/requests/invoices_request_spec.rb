require 'rails_helper'

RSpec.describe "Invoices", type: :request do
  it 'create' do 
    expect {
      post '/invoices.json', params: {
        invoice: {
          :amount_vat_included=>1,
          :amount_vat_excluded=>1,
          :recipients_attributes=>[{
            name: 'hi',
            email: 'admin@example.com'
          }]
        }
      }
    }.to change(Invoice, :count).by 1
    invoice = Invoice.last
    expect(invoice.recipients.first.name).to eq 'hi'
    expect(invoice.amount_vat_included_cents).to eq 100
    expect(response).to be_ok
    expect(response.body).to include('hi')
  end

  it 'show' do 
    invoice = create(:invoice)
    get "/invoices/#{invoice.id}.json"
    expect(assigns(:invoice)).to eq invoice
    expect(response).to be_ok
  end
end
