require 'active_support/core_ext/numeric/time'
BiblesearchExample::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and adjust caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  recognized_cache_stores = {
    null_store: [],
    file_store: ["./cache"],
    dalli_store: [],
    memory_store: []
  }
  cache_store = ENV.fetch('RAILS_CACHE_STORE', 'null_store').to_sym
  begin
    cache_args, = recognized_cache_stores.fetch(cache_store)
    config.cache_store = cache_store, *cache_args, {expires_in: 2.weeks}
  rescue KeyError
    msg = "RAILS_CACHE_STORE in ENV or application.yml must be in #{recognized_cache_stores.keys}."
    raise KeyError.new(msg)
  end

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
end
