# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "vermonster"
  gem.version     = "0.1.1"
  gem.authors     = ["Ethan Turkeltaub", "Johnathan Croom"]
  gem.email       = ["ethan.turkeltaub@gmail.com", "johnathancroom@gmail.com"]
  gem.homepage    = "http://github.com/eturk/vermonster"
  gem.summary     = %q{Consume all of the Cheddar (API).}
  gem.description = %q{Consume all of the Cheddar (API).}

  gem.rubyforge_project = "vermonster"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  
end
