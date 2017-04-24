module Hefted
  module ClassMethod
    using Hefted::Refine

    def hefted(**args)
      arguments = const_join(args)
      template = Base.new(*arguments.keys)
      self.const_set(arguments.name, template.new(*arguments.values).freeze)
    end

    def release_hefted(*names)
      names.each do |name|
        remove_const(name.to_camel) if const_defined?(name.to_camel)
      end
    end

    private
      def const_join(**args)
        arguments = Argument.new(**args)
        if arguments.join?
          _consts = arguments.joins.each_with_object({}) do |name, hash|
            hash.merge!(self.const_get(name).to_h)
          end.merge!(arguments.keys.zip(arguments.values).to_h)
          Argument.new(name: arguments.name, **_consts)
        else
          arguments
        end
      end

    class Base < Struct
      def each
        return to_enum(:each) unless block_given?
        members.each do |key|
          yield(key, send(key))
        end
      end

      def each_key
        return to_enum(:each_key) unless block_given?
        keys.each { |key| yield(key) }
      end

      def each_value
        return to_enum(:each_value) unless block_given?
        values.each { |value| yield(value) }
      end

      def keys
        members
      end

      def has_key?(key)
        keys.include?(key.to_sym)
      end
      alias :key? :has_key?

      def has_value?(value)
        values.include?(value)
      end
      alias :value? :has_value?

      def fetch(key, *args)
        return send(key) if has_key?(key)
        return args.first if args.size > 0
        return yield(key) if block_given?
      end

      def fetch_values(*_keys)
        _keys.map do |key|
          if has_key?(key)
            fetch(key)
          else
            yield(key) if block_given?
          end
        end
      end

      def values_at(*_keys)
        fetch_values(*_keys)
      end

      def [](key)
        fetch(key)
      end
    end
    private_constant :Base
  end
end
