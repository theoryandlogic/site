module Sinatra
  module Nav
    def is_active?(uri)
      env['REQUEST_URI'] == uri ? "active" : "inactive"
    end
  end
end
