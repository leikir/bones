# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bones/version'

Gem::Specification.new do |spec|
  spec.name          = "bones"
  spec.version       = Bones::VERSION
  spec.authors       = ["Yann Hourdel"]
  spec.email         = ["yann@hourdel.fr"]
  spec.description   = "Backbone for Rails without any pain"
  spec.summary       = "It just works"
  spec.homepage      = ""
  spec.license       = "?"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Rails
  spec.add_dependency 'rails', '>= 4.0.0'

  # Translations
  spec.add_dependency 'rails-i18n'

  # Templates
  spec.add_dependency 'haml-rails'

  # CSS
  spec.add_dependency 'sass-rails', '~> 4.0.0'

  # JS
  spec.add_dependency 'coffee-rails', '~> 4.0.0'
  spec.add_dependency 'uglifier', '>= 1.3.0'
  spec.add_dependency 'backbone-on-rails'
  spec.add_dependency 'haml_coffee_assets'

  # Bootstrap
  spec.add_dependency 'anjlab-bootstrap-rails', '~> 3.0.2.0'

  # dev
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

end
