require 'sinatra/base'
require "sinatra/ratpack"
require 'active_support'
require 'redcloth'

class Workshops < Sinatra::Base

  set :environment, ENV['RACK_ENV'].to_sym
  set :root,        File.expand_path(File.join(File.dirname(__FILE__), ".."))
  set :public,      proc { File.expand_path(File.join(root, "public")) }
  set :views,       proc { File.expand_path(File.join(root, "workshops")) }
  enable :logging

  helpers Sinatra::Ratpack

  helpers do
    def courses
      course_dirs = Dir[File.join(settings.views, "*")].sort
      course_dirs = course_dirs.select {|d| File.directory?(d) }
      return course_dirs.map { |dir_name| File.basename(dir_name) }
    end
  end

  get "/" do
    haml :index
  end

  get '/courses/:course/:workshop.tgz' do |course, workshop|
    content_type 'application/x-compressed'
    attachment "#{course}-#{workshop}.tgz"
    `cd #{settings.views}/#{course}/??_#{workshop} && tar -cz --exclude *.swp -f - *`
  end

  get '/courses/:course' do |course|
    @course = course
    @course_description = File.read(File.join(settings.views, course, "README.textile"))
    ws_list = Dir[File.join(settings.views, course, "[0-9][0-9]_*")].sort
    @workshops = ws_list.inject(ActiveSupport::OrderedHash.new) do |h, dir_name|
      name = File.basename(dir_name).sub(/^\d\d_/, '')
      h[name] = File.read(File.join(dir_name, "README.textile"))
      h
    end
    haml :course
  end

end

