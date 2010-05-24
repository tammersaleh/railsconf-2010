require 'test/unit'
require 'library'

class LibraryTest < Test::Unit::TestCase
  def setup
    @book = Book.new("A book")
    @video = Video.new("A video")
    @library = Library.new
  end

  def test_checkin_adds_a_book
    @library.add(@book)
    assert_equal [@book], @library.catalog
  end

  def test_checkin_adds_a_video_and_a_book
    @library.add(@book)
    @library.add(@video)
    assert_equal [@book, @video], @library.catalog
  end

  def test_checking_out_media
    @library.add(@book)
    @library.checkout(@book)

    assert_equal [@book], @library.checked_out
  end

  def test_media_should_know_it_has_been_checked_out
    @library.add(@book)
    @library.checkout(@book)

    assert @book.checked_out?
  end
  
  def test_media_cannot_be_checked_out_if_it_is_not_in_the_library
    assert_raises(NoMediaExistsException) { @library.checkout Book.new("A new book") }
  end
end

