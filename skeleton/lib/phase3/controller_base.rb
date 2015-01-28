require_relative '../phase2/controller_base'
require 'active_support/core_ext'
require 'erb'

module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      temp_name = File.join(
        "views", self.class.name.underscore, "#{template_name}.html.erb"
      )

      temp_code = File.read(temp_name)

      render_content(ERB.new(temp_code).result(binding), "text/html")
    end
  end
end
