require 'module-requirement'

describe Module::Requirement do
  let(:iterable) {
    Module.new do
      include Module::Requirement
      include ::Enumerable

      requires :each
    end
  }

  it 'is ok' do
    mod = iterable
    natural_iterator = Class.new do
      def each
        yield 1
        yield 2
        yield 3
      end

      include mod
    end
    assert_equal natural_iterator.new.first, 1
  end

  it "is not ok" do
    mod = iterable
    assert_raises Module::Requirement::Error::NotMeetRequirements do
      not_iterator = Class.new do
        include mod
      end
    end
  end
end
