require 'test_helper'

class AttrChainTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AttrChain::VERSION
  end

  context "include AttrChian" do
    should "add method attr_chain to class" do
      class A
        include AttrChain
      end

      assert_respond_to A, :attr_chain
    end
  end

  context "attr_chain" do
    class B
      include AttrChain
      attr_chain :v
    end

    should "add getter/setter method to instance" do
      assert_respond_to B.new, :v
    end

    context "added setter/gettter" do
      should "return self for chain as setter" do
        a = B.new
        assert_same a, a.v(1)
      end 

      should "read the setted value" do
        assert_equal 1, B.new.v(1).v
      end
    end
  end

end
