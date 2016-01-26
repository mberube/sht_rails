module ShtRails
  class Engine < ::Rails::Engine
    config.before_configuration do |app|
      app.paths['app/views'] << ShtRails.template_base_path
    end

    initializer "sprockets.sht_rails", :after => "sprockets.environment", :group => :all do |app|
      next unless Sprockets
      Sprockets.register_engine(".#{ShtRails.template_extension}", Tilt)
      app.config.assets.paths << ShtRails.template_base_path
    end
  end
end
