require 'spec_helper'

module Alonzo
  describe Generator do
    let(:args)      { ["MyClass"] }
    let(:generator) { Generator.new(args, options) }
    let(:options)   { { root: root, type: type } }
    let(:root)      { File.join(Alonzo.root, "tmp", "rspec") }
    let(:type)      { :rb_class }

    describe ".generate" do
    end

    describe ".new" do
      it "sets the args attribute" do
        expect(generator.args).to eq(args)
      end

      it "sets the generator class" do
        expect(generator.generator_class).to eq(Generator::RbClassGenerator)
      end

      it "sets the output attribute, by default" do
        expect(generator.output).to eq(STDOUT)
      end

      it "sets the root attribute" do
        expect(generator.root).to eq(root)
      end
    end

    describe "#generate" do
    end
  end
end
