require_relative 'lib/time_duration/version'

Gem::Specification.new do |spec|
  spec.name          = 'time-duration'
  spec.version       = TimeDuration::VERSION
  spec.authors       = ["Daiki Matoba"]
  spec.email         = ["telnetstat@gmail.com"]

  spec.summary       = %q{This module provides functions for expressing durations}
  spec.description   = %q{This module provides functions for expressing durations}
  spec.homepage      = 'https://github.com/d-mato/time_duration'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.3.0'

  # Specify which files should be added to the gem when it is released.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ spec/ .github/ .gitignore .rspec .ruby-version Gemfile])
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
