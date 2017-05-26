# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "payment_fee_tool/version"

Gem::Specification.new do |spec|
  spec.name          = "payment_fee_tool"
  spec.license       = ""
  spec.version       = PaymentFeeTool::VERSION
  spec.authors       = ["Zach Nusbaum"]
  spec.email         = ["zach@zdnenterprises.com"]

  spec.summary       = %q{Calculates the appropriate fee for invoice payments.}
  spec.description   = %q{Calculates credit card fees for payments at ZDN Enterprises.}
  spec.homepage      = "http://zdnenterprises.com"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables << 'payment_fee_tool'
  spec.require_paths = ["lib"]

  spec.add_dependency 'money'
  spec.add_dependency 'tty-prompt'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_dependency('methadone', '~> 1.9.5')
  spec.add_development_dependency('test-unit')
end
