require 'spec_helper'

module Alonzo
  describe Generator do
    let(:args)      { ["MyClass"] }
    let(:generator) { Generator.new(type, root, args) }
    let(:root)      { File.join(Alonzo.root, "tmp", "rspec") }
    let(:type)      { :rb_class }

    describe ".generate" do
    end

    describe ".new" do
      it "sets the args attribute" do
        expect(generator.args).to eq(args)
      end

      it "sets the root attribute" do
        expect(generator.root).to eq(root)
      end

      it "sets the type attribute" do
        expect(generator.type).to eq(type)
      end
    end

    describe "#generate" do
      context "when type = :lib" do
        it "generates a class file"

        it "generates a spec file"
      end
    end

    describe "#templates_path" do
      it "returns the path to the templates" do
        templates_path = File.join(Alonzo.root, "lib", "alonzo", "templates", "rb_class_templates")
        expect(generator.templates_path).to eq(templates_path)
      end
    end
  end
end
