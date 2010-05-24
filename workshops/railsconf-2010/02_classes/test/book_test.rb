require 'test/unit'
require 'library'

class BookTest < Test::Unit::TestCase
  def test_book_has_a_name
    book = Book.new("Gone with the Wind")
    assert_equal "Gone with the Wind", book.name
  end

  def test_book_should_not_be_checked_out_by_default
    assert ! Book.new("A book").checked_out?
  end
end
