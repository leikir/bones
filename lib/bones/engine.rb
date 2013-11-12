module Bones
  class Engine < ::Rails::Engine

    def self.bones_templates
      Dir[Rails.root.join('app', 'assets', 'javascripts', 'templates', '**', '*.{hamlc}').to_s].map do |path|

        res = path
        res.gsub! Rails.root.join('app', 'assets', 'javascripts', 'templates/').to_s, ''
        res.gsub! '.hamlc', ''
        res

      end
    end

    config.after_initialize do
      config.hamlcoffee.namespace = 'window.App.Templates'

      # precompile all templates as single files
      bones_templates.each do |template_name|
        config.assets.precompile << "templates/#{template_name}.js"
      end
    end

  end
end
