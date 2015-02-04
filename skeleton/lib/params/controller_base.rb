require_relative '../session/controller_base'
require_relative './params'

module Params
  class ControllerBase < Session::ControllerBase
    attr_reader :params

    def initialize(req, res, route_params = {})
      super(req, res)
      @params = Params.new(req, route_params)
    end
  end
end
