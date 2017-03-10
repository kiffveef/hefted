require "hefted/version"

module Hefted
  autoload :Refine, "hefted/refine"
  autoload :Argument, "hefted/argument"
  autoload :ClassMethod, "hefted/class_method"

  def self.included(base)
    base.extend(ClassMethod)
  end
end
