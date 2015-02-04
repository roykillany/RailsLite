require_relative '../template/controller_base'
require_relative './session'

module Session
  class ControllerBase < Template::ControllerBase
    def redirect_to(url)
      super(url)
      session.store_session(@res)
    end

    def render_content(content, type)
      super(content, type)
      session.store_session(@res)
    end

    def session
      @session ||= Session.new(@req)
    end
  end
end
