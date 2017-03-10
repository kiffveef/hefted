require "spec_helper"

describe "core_ext" do
  it(:require) do
    require "hefted/core_ext"
    expect(Object).to be_const_defined(:Hefted)
  end
end
