require "spec_helper"

describe Hefted::Argument do
  subject { described_class.new(arguments) }
  let(:name) { :toto }

  context "Array members" do
    using Hefted::Refine

    let(:members) { %w(spam ham eggs) }
    let(:first) { 20 }
    let(:arguments) do
      {
        name: name,
        members: members,
        first: first
      }
    end

    it "#name" do
      expect(subject.name).to eq name.to_camel
    end

    it "#keys" do
      expect(subject.keys).to be_a(Array)
      expect(subject.keys.first).to be_a(Symbol)
      expect(subject.keys).to include *members.map(&:to_sym)
      expect(subject.keys).not_to include :first
    end

    it "#values" do
      expect(subject.values).to be_a(Array)
      expect(subject.values).to include *(first..(first + members.size - 1)).to_a
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
    let(:first) { { first: 2 } }
    let(:arguments) do
      {
        name: name,
        **members,
        **first
      }
    end

    it "#name" do
      expect(subject.name).to eq name.to_camel
    end

    it "#keys" do
      expect(subject.keys).to be_a(Array)
      expect(subject.keys.first).to be_a(Symbol)
      expect(subject.keys).to include *members.keys
      expect(subject.keys).not_to include *first.keys
    end

    it "#values" do
      expect(subject.values).to be_a(Array)
      expect(subject.values).to include *members.values
      expect(subject.values).not_to include *first.values
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

  context "Join name" do
    using Hefted::Refine

    let(:join) { %i(tete titi) }
    let(:arguments) do
      {
        name: name,
        join: join,
      }
    end

    it "#join?" do
      expect(subject.join?).to be_truthy
    end

    it "#joins" do
      names = join.map { |_| _.to_camel }
      expect(subject.joins).to include *names
    end
  end
end
