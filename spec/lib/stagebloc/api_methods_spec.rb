require "spec_helper"

class DummyObject < Struct.new(:attributes)
  include StageBloc::APIMethods

  has_attribute :something_grand, :second_method
end

module StageBloc
  describe APIMethods do
    
    context "has_attribute" do
      it "defines method" do
        expect(DummyObject.method_defined?(:something_grand)).to be_truthy
      end

      it "gets value from attributes hash" do
        dummy = DummyObject.new(something_grand: 'grand-value')
        expect(dummy.something_grand).to eq('grand-value')
      end

      it "gets value for string keys" do
        dummy = DummyObject.new('something_grand' => 'grand-string-value')
        expect(dummy.something_grand).to eq('grand-string-value')
      end

      it "allows multiple methods to be defined" do
        dummy = DummyObject.new(something_grand: 'grand-value', second_method: 'second-method-value')
        expect(dummy.something_grand).to eq('grand-value')
        expect(dummy.second_method).to eq('second-method-value')
      end
    end

  end
end
