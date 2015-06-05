# -*- encoding: utf-8 -*-
# stub: furatto 1.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "furatto"
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Abraham Kuri Vargas"]
  s.date = "2015-03-26"
  s.description = "Integrates the Furatto CSS Framework to the Rails assets Pipeline"
  s.email = ["kurenn@icalialabs.com"]
  s.homepage = "https://github.com/IcaliaLabs/furatto-rails"
  s.licenses = ["GPL"]
  s.rubyforge_project = "furatto-rails"
  s.rubygems_version = "2.4.7"
  s.summary = "Furatto CSS Framework for Rails 3.1 Asset Pipeline"

  s.installed_by_version = "2.4.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1.0"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1"])
      s.add_runtime_dependency(%q<activemodel>, [">= 3.1"])
      s.add_runtime_dependency(%q<compass-rails>, ["~> 2.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1.0"])
      s.add_dependency(%q<actionpack>, [">= 3.1"])
      s.add_dependency(%q<activemodel>, [">= 3.1"])
      s.add_dependency(%q<compass-rails>, ["~> 2.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1.0"])
    s.add_dependency(%q<actionpack>, [">= 3.1"])
    s.add_dependency(%q<activemodel>, [">= 3.1"])
    s.add_dependency(%q<compass-rails>, ["~> 2.0"])
  end
end
