module AssetsMapper
  class Enum
    # static methods
    class << self
      def static_let(key, value)
        "static let #{key} = \"#{value}\"\n"
      end
    end

    attr_reader :name, :children
    attr_writer :indent_prefix
    def initialize(name)
      @name = name
      @children = []
      @indent_prefix = ""
    end

    def add_children(child)
      if child.class == String
        @children.push("    " + child)
      elsif child.class == Enum
        child.indent_prefix = "    "
        @children.push(child)
      else
        raise "Must be String or Enum"
      end
    end


    def to_s
      s = @indent_prefix + "enum #{@name} {\n"
      @children.each do |x|
        s = s + @indent_prefix + x.to_s
      end
      s = s + @indent_prefix + "}\n"
    end
  end
end