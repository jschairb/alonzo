require 'spec_helper'

describe Alonzo do
  describe ".root" do
    it "returns the root path" do
      root_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
      expect(Alonzo.root).to eq(root_path)
    end
  end
end
