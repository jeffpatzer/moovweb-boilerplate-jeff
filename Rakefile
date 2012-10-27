require 'rake'
include Rake::DSL

require 'rspec/core/rake_task'
%w(endpoint integration).each do |test_type|
  desc "Run rspec tasks for #{test_type}"
  RSpec::Core::RakeTask.new("test:#{test_type}") do |t|
    t.pattern = "spec/#{test_type}/**/*_spec.rb"
  end
end

task default: ['server']

desc 'Runs moov server and displays errors in growl'
task 'server' do
  system 'rvmsudo moov server | tee /dev/tty | while read -r line; do [[ $line =~ "ERROR" ]] && growlnotify -t "Moov error" -m "$line" && echo "$line" >> log/error.log; done'
end
