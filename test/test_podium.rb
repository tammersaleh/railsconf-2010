$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'podium'
require 'rack/test'
require 'webrat'
require 'shoulda'

Webrat.configure do |config|
  config.mode = :rack
end

Podium.enable :raise_errors
Podium.set :show_exceptions, false

class TestPodium < Test::Unit::TestCase
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers
  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Podium
  end

  should "be able to navigate to the homepage" do
    get "/"
    assert last_response.ok?, last_response.body
  end

  should "be able to navigate to course page" do
    get "/"
    click_link "Ruby on Rails"
    assert last_response.ok?, last_response.body
  end

  should "be able to navigate to an individual workshop page" do
    get "/"
    click_link "Ruby on Rails"
    click_link "Ruby Methods"
    assert last_response.ok?, last_response.body
  end

  should "be able to navigate to a slide set" do
    get "/"
    click_link "Ruby on Rails"
    click_link "Slides"
    assert last_response.ok?, last_response.body
  end

end

