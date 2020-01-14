require_relative 'lib/bongloy/version'

Gem::Specification.new do |spec|
  spec.name          = "bongloy"
  spec.version       = Bongloy::VERSION
  spec.authors       = ["Bongloy"]
  spec.email         = ["sovon@bongloy.com"]

  spec.summary       = "Ruby bindings for the Bongloy API"
  spec.description   = "Bongloy is the easiest way to accept payments online.  " \
                       "See https://bongloy.com for details."
  spec.homepage      = "https://bongloy.com"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/khomsovon/bongloy-ruby"
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.add_dependency("stripe")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
