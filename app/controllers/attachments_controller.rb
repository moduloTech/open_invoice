class AttachmentsController < ApplicationController
  def create
    invoice = Invoice.find params[:invoice_id]
    invoice.attachments.create(permitted_params)
  end

  def permitted_params
    params[:attachment].permit(:file)
  end
end
