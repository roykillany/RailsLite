module Foundation
  class ControllerBase
    attr_reader :req, :res

    def initialize(req, res)
      @req = req
      @res = res
      @already_built_response = false
    end

    def already_built_response?
      @already_built_response
    end

    def redirect_to(url)
      raise "Already rendered!" unless !@already_built_response

      @res.header["location"] = url
      @res.status = 302

      @already_built_response = true
    end

    def render_content(content, type)
      raise "Already rendered!" unless !@already_built_response

      @res.content_type = type
      @res.body = content

      @already_built_response = true
    end
  end
end
