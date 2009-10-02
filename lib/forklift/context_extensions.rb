module Thumblemonks
  module Forklift
    module RailsContextExtensions
      
      def depot(&block)
        captured_instance_vars, depot_ran = nil, false
        add_callback(:before_fixture_load) do 
          ActiveRecord::Base.connection.rollback_to_savepoint and puts("Rolling back to savepoint") if depot_ran
          inject_instance_vars(captured_instance_vars) && next if depot_ran
          captured_instance_vars, depot_ran = run_depot_and_capture_vars(block), true
          ActiveRecord::Base.connection.create_savepoint and puts("Creating savepoint")
        end
      end
      
    end # RailsContextExtensions
  end   # Forklift
end     # Thumblemonks

Shoulda::Context.instance_eval { include Thumblemonks::Forklift::RailsContextExtensions }