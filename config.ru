$LOAD_PATH << File.join(File.dirname(__FILE__), "lib")

require "rubygems"
require 'workshops'
require 'podium'

log_file = File.new("log/sinatra.log", "a")
$stdout.reopen(log_file)
$stderr.reopen(log_file)
use Rack::CommonLogger, log_file

Podium.root_dir  = File.expand_path(File.join(File.dirname(__FILE__), "podium"))
Podium.base_path = "/slides"
use Podium

run Workshops

