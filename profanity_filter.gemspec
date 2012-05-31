# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "profanity_filter/version"

Gem::Specification.new do |s|
  s.name        = "profanity_filter"
  s.version     = ProfanityFilter::VERSION
  s.authors     = ["Garrett Heinlen"]
  s.email       = ["heinleng@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Profanity Filter}
  #s.description = %q{}

  s.rubyforge_project = "profanity_filter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "sanitize"
end
