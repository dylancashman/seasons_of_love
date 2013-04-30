# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "seasons_of_love/version"

Gem::Specification.new do |s|
  s.name        = "seasons_of_love"
  s.version     = SeasonsOfLove::VERSION
  s.authors     = ["Dylan Cashman"]
  s.email       = ["dylan.cashman@annkissam.com"]
  s.homepage    = "https://github.com/dylancashman/seasons_of_love"
  s.summary     = "Date range parser"
  s.description = "This gem provides a method that splits a date range into months and their first and last day respectively"

  s.rubyforge_project = "seasons_of_love"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec"
end
