Gem::Specification.new do |spec|
  spec.name          = "bongloy"
  spec.version       = "1.0.0"
  spec.required_ruby_version = ">= 2.3.0"
  spec.authors       = ["Bongloy"]
  spec.email         = ["support@bongloy.com"]

  spec.summary       = "This is the Unofficial Ruby library for Bongloy Payment Gateway API."
  spec.description   = "Bongloy is the easiest way to accept payments online." \
                       "See https://bongloy.com for details."
  spec.homepage      = "https://www.bongloy.com/documentation"
  spec.license       = "MIT"

  spec.metadata = {
    "bug_tracker_uri"   => "https://github.com/bongloy-community/bongloy-ruby/issues",
    "documentation_uri" => "https://www.bongloy.com/documentation",
    "github_repo"       => "https://github.com/bongloy-community/bongloy-ruby",
    "homepage_uri"      => "https://www.bongloy.com/documentation",
    "source_code_uri"   => "https://github.com/bongloy-community/bongloy-ruby",
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency("stripe")
end
