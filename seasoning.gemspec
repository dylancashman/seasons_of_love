# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "seasoning/version"

Gem::Specification.new do |s|
  s.name        = "seasoning"
  s.version     = Seasoning::VERSION
  s.authors     = ["Dylan Cashman"]
  s.email       = ["dylan.cashman@annkissam.com"]
  s.homepage    = ""
  s.summary     = "This gem provides a method that splits a date range into months and their first and last day respectively"
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "seasoning"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec"
end
