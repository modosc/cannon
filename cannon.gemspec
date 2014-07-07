# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cannon/version'

Gem::Specification.new do |spec|
  spec.name          = "cannon"
  spec.version       = Cannon::VERSION
  spec.authors       = ["jonathan schatz"]
  spec.email         = ["jon@divisionbyzero.com"]
  spec.summary       = %q{interesting random number generation}
  spec.description   = %q{
This gem is an implementation of the random number generators (aka cannons) described in "A Panoply of Stochastic 'Cannons'" (Lorrain, D. 1980, read it online for here: http://www.jstor.org/discover/10.2307/3679879?uid=3739560&uid=2&uid=4&uid=3739256&sid=21104431233533 ). This code is (currently) ported directly from the Pascal implementations provided in the paper and as such is at times unreadable. 
}
  spec.homepage      = "https://github.com/modosc/cannon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
