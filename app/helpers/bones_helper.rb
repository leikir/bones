module BonesHelper

  def bones_jquery_javascript_tag
    javascript_include_tag('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js') + javascript_tag("window.jQuery || document.write('<script src=\"#{asset_path('jquery-1.10.2.min.js')}\">\\x3C/script>')")
  end

  def bones_underscore_javascript_tag
    javascript_include_tag('//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js') + javascript_tag("window._ || document.write('<script src=\"#{asset_path('underscore-1.5.2-min.js')}\">\\x3C/script>')")
  end

  def bones_templates_tag
    map = Hash[ Bones::Engine.bones_templates.map do |template_name|
      [template_name, asset_path("templates/#{template_name}.js")]
    end ]
    def js_regexp(ruby_regexp)
      Regexp.new(ruby_regexp.inspect.sub('\\A','^').sub('\\Z','$').sub('\\z','$').sub(/^\//,'').sub(/\/[a-z]*$/,'').gsub(/\(\?#.+\)/, '').gsub(/\(\?-\w+:/,'('), ruby_regexp.options).inspect
    end
    def js_replacement(replacement)
      replacement
    end
    #FIXME: make this work
    javascript_tag(
      "window.App || (window.App = {});
      App.templatesMap = #{map.to_json};
      String.inflections = #{{
        acronym_regex: js_regexp(ActiveSupport::Inflector.inflections.acronym_regex),
        acronyms: ActiveSupport::Inflector.inflections.acronyms,
        humans: ActiveSupport::Inflector.inflections.humans,
        plurals: [['/(.*)ium/', '$1ia'], ['/(.*)y/', '$1ies']],#ActiveSupport::Inflector.inflections.plurals.map{|rule|
          #[js_regexp(rule[0]), js_replacement(rule[1])]
        #},
        singulars: [],#ActiveSupport::Inflector.inflections.singulars.map{|rule|
          # [js_regexp(rule[0]), js_replacement(rule[1])]
        # },
        uncountables: ActiveSupport::Inflector.inflections.uncountables
      }.to_json};"
    )
  end

  def bones_javascript_tags
    bones_jquery_javascript_tag + bones_underscore_javascript_tag + bones_templates_tag
  end

end
