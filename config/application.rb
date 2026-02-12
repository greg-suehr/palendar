require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InviteProto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Sytem application configuration
    # config.eager_load_paths << Rails.root.join("extras")
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      if html_tag =~ /^<label/
        html_tag
      elsif instance.error_message.present?
        error_msg = instance.error_message.is_a?(Array) ? instance.error_message.first : instance.error_message
        %(#{html_tag}<span class="field-error">#{error_msg}</span>).html_safe
      else
        html_tag
      end
    }

    # User application configuration
    config.time_zone = "Central Time (US & Canada)"
  end
end
