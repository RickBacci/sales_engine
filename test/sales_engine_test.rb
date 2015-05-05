require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  attr_reader :engine

  def setup
    @engine = SalesEngine.new('./test/fixtures')
    engine.startup
  end

  def test_sales_engine_can_start_up_its_repositories
    assert engine.customer_repository
    assert engine.invoice_repository
    assert engine.transaction_repository
    assert engine.merchant_repository
    assert engine.item_repository
    assert engine.invoice_item_repository
  end


  # //---------- business logic tests --------------------------------------//


  def test_merchant_can_calculate_total_revenue
    merchant = engine.merchant_repository.find_by_id(62)

   puts merchant.revenue
    assert_equal "0.514976E4", merchant.revenue.to_s
  end
end

