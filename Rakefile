require 'rspec/core/rake_task'
$: << "#{File.dirname __FILE__}/lib"
require 'antsy/version'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--color'
end
