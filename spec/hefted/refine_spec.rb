require "spec_helper"

describe Hefted::Refine do
  context "using" do
    using described_class

    it(String) do
      expect("toto".to_camel).to eq "Toto"
      expect("spam_ham".to_camel).to eq "SpamHam"
      expect("spam ham".to_camel).to eq "SpamHam"
      expect("eggs".to_camel).to eq "Eggs"
      expect("titi".to_setter).to eq "titi="
    end

    it(Symbol) do
      expect(:toto.to_camel).to eq :Toto
      expect(:spam_ham.to_camel).to eq :SpamHam
      expect(:eggs.to_camel).to eq :Eggs
      expect(:titi.to_setter).to eq :titi=
    end
  end

  context "no use" do
    it(String) do
      expect(String).not_to respond_to(:to_camel)
      expect(String).not_to respond_to(:to_setter)
    end

    it(Symbol) do
      expect(Symbol).not_to respond_to(:to_camel)
      expect(Symbol).not_to respond_to(:to_setter)
    end
  end
end
