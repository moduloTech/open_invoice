json.invoice do 
  json.invoice_number @invoice.invoice_number
  json.subject @invoice.subject
  json.due_date @invoice.due_date
  json.amount_vat_excluded @invoice.amount_vat_excluded
  json.amount_vat_excluded_currency @invoice.amount_vat_excluded_currency
  json.amount_vat_included @invoice.amount_vat_included
  json.amount_vat_included_currency @invoice.amount_vat_included_currency
  json.documents @invoice.documents do |document|
    json.document url_for(document)
  end
  json.recipients @invoice.recipients do |recipient|
    json.name recipient.name
    json.email recipient.email
  end
end