#!/usr/bin/env ruby

require 'fileutils'

Dir["*/*"].each do |workshop_dir|
  next unless File.directory?(workshop_dir)
  next unless File.exists?(File.join(workshop_dir, "Rakefile"))
  FileUtils.cd workshop_dir do
    puts "Running tests for #{File.basename workshop_dir}"
    system("rake verify | grep -v '^Loaded suite' | grep -v '^Started' | grep -v '^Finished' | grep -v '^(in ' | egrep -v '[0-9]+ tests, [0-9]+ assertions' | grep -v '^$'") 
  end
end
