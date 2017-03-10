module Hefted
  module Refine
    refine Hash do
      def indexer!(*keys)
        idx = keys.map do |key|
          value = self[key].to_i if self.key?(key)
          value ||= 0
          [key, value]
        end
        self.delete_if { |key, _| keys.include?(key) }
        idx.to_h
      end
    end

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
