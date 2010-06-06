require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    category = Factory(:category)
    state = Factory(:state)
    assert_difference('Article.count') do
      post :create, 
           :article => { :category_id => category.id, 
                         :state_id => state.id }
    end

    assert_redirected_to articles_path
  end

  test "should show article" do
    article = Factory(:article)
    get :show, :id => article.to_param
    assert_response :success
  end

  test "should get edit" do
    article = Factory(:article)
    get :edit, :id => article.to_param
    assert_response :success
  end

  test "should update article" do
    article = Factory(:article)
    put :update, :id => article.to_param, :article => { }
    assert_redirected_to articles_path
  end

  test "should destroy article" do
    article = Factory(:article)
    assert_difference('Article.count', -1) do
      delete :destroy, :id => article.to_param
    end

    assert_redirected_to articles_path
  end

  test "should flag article" do
    review = Factory(:state, :name => "review")
    published = Factory(:state, :name => "published")
    article = Factory(:article, :state => published)
    post :flag, :id => article.to_param
    assert_redirected_to article_path(article)
    assert_equal review, article.reload.state
  end
end
