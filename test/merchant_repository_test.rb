require_relative 'test_helper'
require './lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repository, :engine

  def setup
    @engine = SalesEngine.new('./test/fixtures')
    @merchant_repository = @engine.initialize_merchant_repository

    # @engine.initalize_merchant_repository
    # @merchant_repository = @engine.merchant_repository
  end

#Base Tests
  def test_merchant_repository_exists
    assert merchant_repository
  end

  def test_merchant_repository_contains_data
    assert_equal 100, merchant_repository.length
  end

  def test_merchant_repository_returns_all_merchants
    assert_equal 100, engine.merchant_repository.all.length
  end

  def test_merchant_repository_returns_random_merchant
    skip
    assert_equal "some random shit", engine.merchant_repository.random
  end

#Find_by Method Tests
  def test_merchant_repository_returns_by_merchant_id
    by_id = engine.merchant_repository.find_by_id(3)
    assert_equal 3, by_id.id
  end

  def test_merchant_repository_returns_by_merchant_name
    by_merchant_name = engine.merchant_repository.find_by_name("Cummings-Thiel")
    assert_equal 4, by_merchant_name.id
  end

  def test_merchant_repository_returns_by_created_at
    by_created_at = engine.merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", by_created_at.created_at
  end

  def test_merchant_repository_returns_by_updated_at
    by_updated_at = engine.merchant_repository.find_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal "2012-03-27 14:53:59 UTC", by_updated_at.updated_at
  end

#Find_by_all Method Tests
  def test_merchant_repository_returns_all_merchants_by_id
    all_by_id = engine.merchant_repository.find_all_by_id(4)
    assert_equal 1, all_by_id.count
  end

  def test_merchant_repository_returns_all_merchants_by_name
    all_by_name = engine.merchant_repository.find_all_by_name("Cummings-Thiel")
    assert_equal 1, all_by_name.count
  end

  def test_merchant_repository_returns_all_merchants_by_created_at
    all_by_created_at = engine.merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC")
    assert_equal 9, all_by_created_at.count
  end

  def test_merchant_repository_returns_all_merchants_by_updated_at
    all_by_updated_at = engine.merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC")
    assert_equal 8, all_by_updated_at.count
  end
end
