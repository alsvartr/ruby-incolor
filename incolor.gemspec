Gem::Specification.new do |spec|
  spec.name          = 'incolor'
  spec.version       = '0.1'
  spec.authors       = ['Pavel Nazarov']
  spec.email         = ['nazarov.pn@gmail.com']
  spec.licenses      = ['MIT']

  spec.summary       = 'Library for output colorizing'
  spec.description   = 'Library for output colorizing'
  spec.homepage      = 'https://github.com/alsvartr/ruby-incolor'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
