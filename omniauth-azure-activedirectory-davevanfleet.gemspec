$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'omniauth/azure_activedirectory_davevanfleet/version'

Gem::Specification.new do |s|
  s.name            = 'omniauth-azure-activedirectory-davevanfleet'
  s.version         = OmniAuth::AzureActiveDirectoryDavevanfleet::VERSION
  s.author          = 'Microsoft Corporation'
  s.email           = 'nugetaad@microsoft.com'
  s.summary         = 'Azure Active Directory strategy for OmniAuth'
  s.description     = 'Allows developers to authenticate to AAD'
  s.homepage        = 'https://github.com/AzureAD/omniauth-azure-activedirectory'
  s.license         = 'MIT'

  s.files           = `git ls-files`.split("\n")
  s.require_paths   = ['lib']

  s.required_ruby_version = '>= 2.2'

  s.add_runtime_dependency 'jwt', '>= 2.0'
  s.add_runtime_dependency 'oauth2', '~> 1.1'
  s.add_runtime_dependency 'omniauth', '~> 2.0'
  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.7.1'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rubocop', '~> 0.49'
  s.add_development_dependency 'simplecov', '~> 0.10'
  s.add_development_dependency 'webmock', '~> 1.21'
end