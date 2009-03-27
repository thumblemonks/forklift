module Thumblemonks
  module Forklift
    module RailsContextExtensions
      
      def depot(&block)
        captured_instance_vars, depot_ran = nil, false
        add_callback(:before_fixture_load) do 
          inject_instance_vars(captured_instance_vars) && next if depot_ran
          captured_instance_vars, depot_ran = run_depot_and_capture_vars(block), true
        end
      end
      
    end # RailsContextExtensions
  end   # Forklift
end     # Thumblemonks

Shoulda::Context.instance_eval { include Thumblemonks::Forklift::RailsContextExtensions }