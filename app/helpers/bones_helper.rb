module BonesHelper

  def bones_jquery_javascript_tag
    javascript_include_tag('//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js') + javascript_tag("window.jQuery || document.write('<script src=\"#{asset_path('jquery-1.10.2.min.js')}\">\\x3C/script>')")
  end

  def bones_underscore_javascript_tag
    javascript_include_tag('//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min.js') + javascript_tag("window._ || document.write('<script src=\"#{asset_path('underscore-1.5.2-min.js')}\">\\x3C/script>')")
  end

  def bones_javascript_tags
    bones_jquery_javascript_tag + bones_underscore_javascript_tag
  end

end
