require 'antsy'

def capture_stdout
  out = StringIO.new
  $stdout = out
  begin
    yield
  rescue SystemExit
    ;
  end
  out.string
ensure
  $stdout = STDOUT
end

def suppress_stdout
  begin
    $stdout = StringIO.new
    yield
  ensure
    $stdout = STDOUT
  end
end

RSpec::Matchers.define :exit_with_code do |exp_code|
  actual = nil
  match do |block|
    begin
      suppress_stdout { block.call }
    rescue SystemExit => e
      actual = e.status
    end
    actual and actual == exp_code
  end
  failure_message_for_should do |block|
    "expected block to call exit(#{exp_code}) but exit" +
      (actual.nil? ? " not called" : "(#{actual}) was called")
  end
  failure_message_for_should_not do |block|
    "expected block not to call exit(#{exp_code})"
  end
  description do
    "expect block to call exit(#{exp_code})"
  end
end
