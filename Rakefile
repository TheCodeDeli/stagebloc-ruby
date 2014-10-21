require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber/rake/task'
require 'sdoc'

task default: [:spec, :cucumber]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.ruby_opts = "-I./spec -rspec_helper"
  t.rspec_opts = %w[--format progress]
end

Cucumber::Rake::Task.new

RDoc::Task.new('docs') do |rdoc|
  rdoc.title = 'StageBloc API'
  rdoc.options << '--format' << 'sdoc'
  rdoc.options << '--github'
  rdoc.options << '--force-output'

  rdoc.rdoc_dir = 'pages'
  rdoc.rdoc_files.include('lib/**/*.rb', 'README.md')
  rdoc.main = 'README.md'
end
