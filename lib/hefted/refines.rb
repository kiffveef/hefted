module Hefted
  module Refines
    refine String do
      def to_camel
        self.gsub(/(?:^|_|\s)(.)/) { $1.upcase }
      end
    end

    refine Symbol do
      def to_camel
        self.to_s.to_camel.to_sym
      end
    end
  end
end
