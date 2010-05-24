require 'test/unit'
require 'library'

class VideoTest < Test::Unit::TestCase
  def test_video_has_a_name
    video = Video.new("Scanners")
    assert_equal "Scanners", video.name
  end
end
