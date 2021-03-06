$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'aws-sdk-core', 'lib')))

require 'aws-sdk-core'

YARD::Tags::Library.define_tag('CONFIGURATION_OPTIONS', :seahorse_client_option)
YARD::Tags::Library.define_tag('SERVICE', :service)
YARD::Tags::Library.define_tag('API_VERSION', :api_version)

YARD::Templates::Engine.register_template_path(File.join(File.dirname(__FILE__), '..', 'templates'))

YARD::Parser::SourceParser.after_parse_list do
  Aws.load_all_services
  Aws.service_added do |_, svc_module, options|
    Aws::Api::Documenter.new(svc_module, options[:docs]).apply
  end
end
