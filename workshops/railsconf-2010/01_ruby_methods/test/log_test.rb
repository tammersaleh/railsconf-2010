require "test/unit"
require "log"

class LogTest < Test::Unit::TestCase
  def setup
    @log_device = []
  end

  def test_log_with_string
    log(@log_device, "string")
    assert_equal ['Attention! "string"'], @log_device
  end

  def test_log_with_number
    log(@log_device, 123)
    assert_equal ["Attention! 123"], @log_device
  end

  def test_log_with_symbol
    log(@log_device, :symbol)
    assert_equal ["Attention! :symbol"], @log_device
  end

  def test_log_with_array
    log(@log_device, [1, 2])
    assert_equal ["Attention! [1, 2]"], @log_device
  end
end

