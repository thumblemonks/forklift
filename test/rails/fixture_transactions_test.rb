require File.dirname(__FILE__) + '/../test_helper'
require File.dirname(__FILE__) + '/../../rails/init'

class FixtureTransactionsTest < Test::Unit::TestCase
  self.use_transactional_fixtures = true

  def setup_fixtures_with_a_stubbed_configuration
    ActiveRecord::Base.configurations.stubs(:blank?).returns(false)
    setup_fixtures_without_a_stubbed_configuration
  end
  alias_method_chain :setup_fixtures, :a_stubbed_configuration
  
  context "when using rails transactional tests" do
    
    depot_runs = 0 
    poodle_object_id = nil
    local_dawg = nil
    
    depot do
      depot_runs += 1
      @poodle = Factory(:poodle)
    end

    2.times do |i|
      should "create our #{i.ordinalize} poodle" do
        assert Poodle.find(@poodle.id)
        assert_equal 1, depot_runs
        assert @poodle
        assert_equal(local_dawg.object_id, @poodle.object_id) if local_dawg
        local_dawg ||= @poodle
      end
    end # 2.times
        
    should_eventually "think of a better way to test that @poodle is always the same poodle"
  end # with a new context
  
end
