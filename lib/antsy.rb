require 'rubygems'
require 'json'

Module Antsy

  # parse the file named on the command line, whose contents look like this:
  #    arg1=foo arg2=bar
  # and return a hash like this:
  #    {:arg1 => 'foo', :arg2 => 'bar'}
  def self.args()
    File.read(ARGV.first)
  end

  def self.fail!(msg)
    puts ({ 'failed' => 'True', 'msg' => args }.to_json)
    exit 1
  end

  def self.changed!(data)
    data[:changed] = 'True'
    puts data.to_json
    exit 0
  end

  def self.no_change!(data)
    data[:changed] = 'False'
    puts data.to_json
    exit 0
  end

end
