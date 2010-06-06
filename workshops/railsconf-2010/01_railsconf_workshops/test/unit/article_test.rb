require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  context "An article" do
    subject { Factory(:article) }

    should_belong_to :state
    should_belong_to :category
    should_validate_presence_of :state_id
    should_validate_presence_of :category_id
  end

  context "an article that is published" do
    setup do
      @review = Factory(:state, :name => "review")
      @article = Factory(:article)
    end

    should "be need to be reviewed when given flag!" do
      @article.flag!
      assert_equal @review, @article.reload.state
    end
  end
end
