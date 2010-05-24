require "test/unit"
require "extra_credit"

class LogTest < Test::Unit::TestCase
  def setup
    @log_device = []
  end

  def test_log_with_upcase
    log(@log_device, "string", :upcase => true)
    assert_equal ['ATTENTION! "STRING"'], @log_device
  end

  def test_log_with_upcase_and_number
    log(@log_device, 123, :upcase => true)
    assert_equal ['ATTENTION! 123'], @log_device
  end

  def test_log_with_pre
    log(@log_device, :symbol, :pre => "Yo!")
    assert_equal ["Yo! :symbol"], @log_device
  end
end

