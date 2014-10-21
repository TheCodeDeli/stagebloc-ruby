require "bundler/gem_tasks"
require 'sdoc'

RDoc::Task.new('docs') do |rdoc|
  rdoc.title = 'StageBloc API'
  rdoc.options << '--format' << 'sdoc'
  rdoc.options << '--github'
  rdoc.options << '--force-output'

  rdoc.rdoc_dir = 'pages'
  rdoc.rdoc_files.include('lib/**/*.rb', 'README.md')
  rdoc.main = 'README.md'
end
