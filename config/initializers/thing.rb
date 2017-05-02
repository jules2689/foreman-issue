def safe_gem_check(*args)
  if Gem::Specification.respond_to?(:find_by_name)
    Gem::Specification.find_by_name(*args)
  elsif Gem.respond_to?(:available?)
    Gem.available?(*args)
  end
rescue Gem::LoadError
  false
end
safe_gem_check("rails", "~> 5.0", ">= 5.0.0.beta1")