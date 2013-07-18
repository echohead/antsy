require 'spec_helper'
require 'tempfile'

describe Antsy do

  it 'should parse equals-seperated args from a file' do
    f = Tempfile.new('antsy')
    f.write 'foo=bar bam=baz'
    f.flush
    ARGV[0] = f.path
    Antsy.args.should == {foo: 'bar', bam: 'baz'}
  end

  it 'should emit failure json and exit failure' do
    capture_stdout { Antsy.fail! 'foo' }.chomp.should == {'failed' => 'True', 'msg' => 'foo'}.to_json
    lambda { Antsy.fail! 'foo' }.should exit_with_code 1
  end

  it 'should emit change json and exit success' do
    capture_stdout { Antsy.changed!({}) }.chomp.should == {'changed' => 'True'}.to_json
    lambda { Antsy.changed!({}) }.should exit_with_code 0

  end

  it 'should emit no-change json and exit success' do
    capture_stdout { Antsy.no_change!({}) }.chomp.should == {'changed' => 'False'}.to_json
    lambda { Antsy.no_change!({}) }.should exit_with_code 0
  end
end
