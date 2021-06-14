# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_asset_variant_options'
  s.version     = '3.0'
  s.summary     = 'Allow an image to belong to multiple Spree::Variant models'
  s.description = 'Spree makes it tedious to upload the same image across multiple variants. This gem solves the problem.'
  s.required_ruby_version = '>= 2.5.0'

  s.author    = 'FlamboSoft'
  s.homepage  = 'https://github.com/FlamboSoft/spree_asset_variant_options'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 4.2.0', '< 6.0'
  s.add_runtime_dependency 'spree_core', spree_version
  s.add_runtime_dependency 'spree_api', spree_version
  s.add_runtime_dependency 'spree_backend', spree_version
  s.add_runtime_dependency 'deface', '~> 1.0'
  s.add_runtime_dependency 'spree_extension'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'pry'
end
