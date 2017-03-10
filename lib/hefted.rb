require "hefted/version"

module Hefted
  autoload :Refines, "hefted/refines"
  autoload :Arguments, "hefted/arguments"
  autoload :ClassMethod, "hefted/class_method"

  def self.included(base)
    base.extend(ClassMethod)
  end
end
