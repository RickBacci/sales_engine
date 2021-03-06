class Customer

  attr_reader :id,
              :repository,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(customer, repository)
    @repository  = repository
    @id          = customer[:id].to_i
    @first_name  = customer[:first_name]
    @last_name   = customer[:last_name]
    @created_at  = customer[:created_at]
    @updated_at  = customer[:updated_at]
  end

  def inspect
    "#<#{self.class}: id:#{@id.inspect}>"
  end

  def invoices
    repository.find_invoices_by_(id)
  end

  def transactions
    repository.customer_transactions(id)
  end

  def favorite_merchant
    fav_mer = 0
    invoices.select do |invoice|
      if invoice.status == "shipped"
        fav_mer = invoice.merchant_id
      end
    end
    repository.engine.merchant_repository.find_by_id(fav_mer)
  end
end
