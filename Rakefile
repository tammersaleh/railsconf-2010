require 'rake/testtask'
 
task :default => :test
 
Rake::TestTask.new(:test) do |t|
  t.test_files = FileList['test/test_*.rb']
  t.ruby_opts = ['-rubygems'] if defined? Gem
end
 

task "db:migrate" do
  # Fake task so EY cloud stops trying to deploy.
end
