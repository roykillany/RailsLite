require_relative '../params/controller_base'

module Routing
  class ControllerBase < Params::ControllerBase

    def invoke_action(name)
      self.send(name)
      render(name) unless already_built_response?
    end
  end
end
