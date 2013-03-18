require 'spec_helper'

module Alonzo
  module Commands
    describe Gen do
      let(:cmd_opts_and_args) do
        {
          :args    => "Foo::Bar::Blah",
          :global  => nil,
          :options => { }
        }
      end

      let(:gen) { Gen.new(cmd_opts_and_args) }

      describe ".new" do
        it "sets the args attribute" do
          expect(gen.args).to eq(cmd_opts_and_args[:args])
        end

        it "sets the global attribute" do
          expect(gen.global).to eq(cmd_opts_and_args[:global])
        end

        it "sets the options attribute" do
          expect(gen.options).to eq(cmd_opts_and_args[:options])
        end

        it "sets the output attribute to STDOUT by default" do
          expect(gen.output).to eq(STDOUT)
        end
      end

      describe ".run" do
      end

      describe "#run" do
      end
    end
  end
end
