require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  context "a category" do
    setup { Factory(:category) }

    should_validate_presence_of :name
  end
end
