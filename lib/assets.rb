module Sinatra
  module Assets
    def stylesheet(stylesheet, media = 'screen')
      stamp = File.mtime(File.join(Sinatra::Application.public, 'stylesheets', "#{stylesheet}.css")).to_i.to_s
      "<link href='/stylesheets/#{stylesheet}.css?#{stamp}' media='#{media}' rel='stylesheet' type='text/css' />"
    end

    def javascript(js)
      stamp = File.mtime(File.join(Sinatra::Application.public, "javascripts", "#{js}.js")).to_i.to_s
      "<script src='/javascripts/#{js}.js?#{stamp}' type='text/javascript'></script>"
    end
  end
end