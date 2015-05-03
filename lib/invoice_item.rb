class InvoiceItem
  attr_reader :repository,
              :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(invoice_item, repository)
    @repository   = repository

    @id           = invoice_item[:id].to_i
    @item_id      = invoice_item[:item_id].to_i
    @invoice_id   = invoice_item[:invoice_id].to_i
    @quantity     = invoice_item[:quantity].to_i
    @unit_price   = invoice_item[:unit_price].to_i
    @created_at   = invoice_item[:created_at]
    @updated_at   = invoice_item[:updated_at]
  end

  def inspect
    "#<#{self.class}: id:#{@id.inspect} item_id: #{@item_id.inspect} invoice_id: #{@invoice_id.inspect} quantity: #{@quantity.inspect} unit_price: #{@unit_price.inspect} created_at: #{@created_at.inspect} updated_at: #{@updated_at.inspect}>"
  end

  # invoice(id) --> invoice_item(invoice_id) --> invoice_item#invoice

  def invoice
  # invoice returns an instance of Invoice associated with this object
    repository.find_invoice_items_invoice_by_(invoice_id)
  end

  def item # invoice#item
    repository.find_invoice_items_item_by_(item_id)
    # item returns an instance of Item associated with this object
  end
end
