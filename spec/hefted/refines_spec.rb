require "spec_helper"
require "hefted/refines"

describe Hefted::Refines do
  context "using" do
    using described_class

    it(String) do
      expect("toto".to_camel).to eq "Toto"
      expect("spam_ham".to_camel).to eq "SpamHam"
      expect("spam ham".to_camel).to eq "SpamHam"
      expect("eggs".to_camel).to eq "Eggs"
    end

    it(Symbol) do
      expect(:toto.to_camel).to eq :Toto
      expect(:spam_ham.to_camel).to eq :SpamHam
      expect(:eggs.to_camel).to eq :Eggs
    end
  end

  context "no use" do
    it(String) do
      expect(String).not_to respond_to(:to_camel)
    end

    it(Symbol) do
      expect(Symbol).not_to respond_to(:to_camel)
    end
  end
end
