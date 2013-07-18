require 'rubygems'
require 'json'
require 'shellwords'

module Antsy

  # parse the specified file, whose contents look like this:
  #    arg1=foo arg2=bar
  # and return a hash like this:
  #    {:arg1 => 'foo', :arg2 => 'bar'}
  def self.args()
    Hash[
      Shellwords::shellwords(File.read(ARGV.first)).map { |kv| kv.split('=') }
    ].inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}
  end

  def self.fail!(msg)
    puts ({ 'failed' => 'True', 'msg' => msg }.to_json)
    exit 1
  end

  def self.changed!(data={})
    data[:changed] = 'True'
    puts data.to_json
    exit 0
  end

  def self.no_change!(data={})
    data[:changed] = 'False'
    puts data.to_json
    exit 0
  end

end
