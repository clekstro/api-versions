module ApiVersions
  module SimplifyFormat
    extend ActiveSupport::Concern

    included do
      prepend_before_filter :simplify_format
    end

    private

    def simplify_format
      request.headers['Accept'] && request.headers['Accept'].match(/\+\s*(\w+)/) { |m| request.format = m[1] }
    end
  end
end
