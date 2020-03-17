if @invoice
  json.error do 
    json.invoice @invoice.errors.full_messages
  end
  json.status 400
else
  json.error 'Not found'
  json.status 404
end