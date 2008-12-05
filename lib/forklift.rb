require 'shoulda'
require 'factory_girl'

module Thumblemonks
  module Forklift
    module ContextExtensions
      
      
      def depot(&block)
        captured_instance_vars, depot_ran = nil, false
        setup do 
          inject_instance_vars(captured_instance_vars) && next if depot_ran
          captured_instance_vars, depot_ran = run_depot_and_capture_vars(block), true
        end
      end
      
    end # ContextExtensions
    module TestUnitTestCaseExtensions

    private
    
      def inject_instance_vars(var_hash)
        var_hash.each { |var_name, var_value| instance_variable_set(var_name, var_value) }
      end
    
      def run_depot_and_capture_vars(depot_block)
        before_variables = instance_variables
        instance_eval(&depot_block)
        after_variables = instance_variables
        (after_variables - before_variables).inject({}) do |vars,var_name|
          vars[var_name] = instance_variable_get(var_name)
          vars
        end
      end

    end # TestUnitTestCaseExtensions
  end   # Forklift
end

Test::Unit::TestCase.instance_eval { include Thumblemonks::Forklift::TestUnitTestCaseExtensions }
Thoughtbot::Shoulda::Context.instance_eval { include Thumblemonks::Forklift::ContextExtensions }