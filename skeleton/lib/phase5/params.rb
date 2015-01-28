require 'uri'

module Phase5
  class Params
    def initialize(req, route_params = {})
      @params = {}

      @params.merge!(route_params)
      if req.body
        @params.merge!(parse_www_encoded_form(req.body))
      end
      if req.query_string
        @params.merge!(parse_www_encoded_form(req.query_string))
      end
    end

    def [](key)
      @params[key.to_s]
    end

    def to_s
      @params.to_json.to_s
    end

    class AttributeNotFoundError < ArgumentError; end;

    private

    def parse_www_encoded_form(www_encoded_form)
      params = {}

      key_values = URI.decode_www_form(www_encoded_form)
      key_values.each do |fullkey, value|
        scope = params

        key_seq = parse_key(fullkey)
        key_seq.each_with_index do |key, idx|
          if (idx + 1) == key_seq.count
            scope[key] = value
          else
            scope[key] ||= {}
            scope = scope[key]
          end
        end
      end

      params
    end

    def parse_key(key)
      key.split(/\[|\]\[|\]/)
    end
  end
end
