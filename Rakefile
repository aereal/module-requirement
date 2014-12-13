require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.ruby_opts = ['-r./test/lib/helper']
end
task :default => :test
