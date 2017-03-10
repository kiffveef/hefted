require "spec_helper"

describe Hefted::Refine do
  context "using" do
    using described_class

    it(Hash) do
      hash = { toto: 100, titi: 20, index: 1}
      expect(hash.indexer!(:index)).to include(index: 1)
      expect(hash.indexer!(:index).keys).not_to include(:toto, :titi)
      expect(hash.indexer!(:first)).to include(first: 0)
    end

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
