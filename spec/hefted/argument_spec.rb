require "spec_helper"

describe Hefted::Argument do
  subject { described_class.new(arguments) }
  let(:name) { :toto }

  context "Array members" do
    using Hefted::Refine

    let(:members) { %w(spam ham eggs) }
    let(:arguments) do
      {
        name: name,
        members: members
      }
    end

    it "#name" do
      expect(subject.name).to eq name.to_camel
    end

    it "#keys" do
      expect(subject.keys).to be_a(Array)
      expect(subject.keys.first).to be_a(Symbol)
      expect(subject.keys).to include(*members.map(&:to_sym))
    end

    it "#values" do
      expect(subject.values).to be_a(Array)
      expect(subject.values).to include *(0..members.size - 1)
    end

    context "exception" do
      context "no enumerable membered" do
        let(:members) { :spam_ham_eggs }

        it "#keys" do
          expect { subject.keys }.to raise_error(Hefted::MissingKeysError)
        end
      end

      context "nil membered" do
        let(:members) { [:spam, :ham, nil] }

        it "#keys" do
          expect { subject.keys }.to raise_error(Hefted::MissingKeysError)
        end
      end
    end
  end

  context "Hash members" do
    using Hefted::Refine

    let(:members) { { spam: 10, ham: 20, eggs: 100 } }
    let(:arguments) do
      {
        name: name,
        **members
      }
    end

    it "#name" do
      expect(subject.name).to eq name.to_camel
    end

    it "#keys" do
      expect(subject.keys).to be_a(Array)
      expect(subject.keys.first).to be_a(Symbol)
      expect(subject.keys).to include(*members.keys)
    end

    it "#values" do
      expect(subject.values).to be_a(Array)
      expect(subject.values).to include *members.values
    end

    context "exception" do
      context "nil membered" do
        let(:members) { { spam: 10, ham: nil, eggs: 100 } }

        it "#values" do
          expect { subject.values }.to raise_error(Hefted::MissingValuesError)
        end
      end
    end
  end
end
