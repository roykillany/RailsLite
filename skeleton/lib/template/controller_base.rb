require_relative '../foundation/controller_base'
require 'active_support/core_ext'
require 'erb'

module Template
  class ControllerBase < Foundation::ControllerBase
    def render(template_name)
      temp_name = File.join(
        "views", self.class.name.underscore, "#{template_name}.html.erb"
      )

      temp_code = File.read(temp_name)

      render_content(ERB.new(temp_code).result(binding), "text/html")
    end
  end
end
