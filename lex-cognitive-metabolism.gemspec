# frozen_string_literal: true

require_relative 'lib/legion/extensions/cognitive_metabolism/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-cognitive-metabolism'
  spec.version       = Legion::Extensions::CognitiveMetabolism::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX Cognitive Metabolism'
  spec.description   = 'ATP-like cognitive energy system with metabolic cycles, catabolism, and anabolism for brain-modeled agentic AI'
  spec.homepage      = 'https://github.com/LegionIO/lex-cognitive-metabolism'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri']        = spec.homepage
  spec.metadata['source_code_uri']     = 'https://github.com/LegionIO/lex-cognitive-metabolism'
  spec.metadata['documentation_uri']   = 'https://github.com/LegionIO/lex-cognitive-metabolism'
  spec.metadata['changelog_uri']       = 'https://github.com/LegionIO/lex-cognitive-metabolism'
  spec.metadata['bug_tracker_uri']     = 'https://github.com/LegionIO/lex-cognitive-metabolism/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
end
