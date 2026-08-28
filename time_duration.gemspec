# frozen_string_literal: true

require_relative 'lib/time_duration/version'

Gem::Specification.new do |spec|
  spec.name          = 'time-duration'
  spec.version       = TimeDuration::VERSION
  spec.authors       = ['Daiki Matoba']
  spec.email         = ['telnetstat@gmail.com']

  spec.summary       = 'This module provides functions for expressing durations'
  spec.description   = <<~DESCRIPTION
    TimeDuration parses strings like '1:10' into values that can be added,
    subtracted and compared. They are durations, not clock times: 50:00
    stays fifty hours instead of wrapping around a day.
  DESCRIPTION
  spec.homepage      = 'https://github.com/d-mato/time_duration'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.3.0'

  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[. bin/ spec/ Gemfile])
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
