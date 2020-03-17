class InvoicesController < ApplicationController
  api :POST, '/invoices', 'create invoice'
  param 'invoice[invoice_number]', String
  param 'invoice[subject]', String
  param 'invoice[due_date]', Date
  param 'invoice[amount_vat_excluded]', Money
  param 'invoice[amount_vat_excluded_currency]', ['EUR', 'USD'], default: 'EUR'
  param 'invoice[amount_vat_included]', Money
  param 'invoice[amount_vat_included_currency]', ['EUR', 'USD'], default: 'EUR'
  param 'invoice[documents]', File
  param 'invoice[recipients_attributes][][email]', String
  param 'invoice[recipients_attributes][][name]', String
  def create
    @invoice = Invoice.new(permitted_params)
    if @invoice.save
      render 'show'
    else
      render 'errors'
    end
  end

  api :GET, '/invoices/:id', 'get an invoice'
  def show
    @invoice = Invoice.find(params[:id])
  end
  
  def permitted_params
    params[:invoice].permit(
      :invoice_number,
      :subject,
      :due_date,
      :amount_vat_excluded,
      :amount_vat_excluded_currency,
      :amount_vat_included,
      :amount_vat_included_currency,
      documents: [],
      recipients_attributes: [
        :name,
        :email
      ]
    )
  end
end
