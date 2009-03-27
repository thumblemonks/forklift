module Thumblemonks
  module Forklift
    module FixtureLoadingCallbacks
      
      def self.included(klass)
        klass.instance_eval do 
          class_inheritable_hash :callbacks
          self.callbacks = {}
          alias_method_chain :setup_fixtures, :callback_invocation
        end
        klass.extend(ClassMethods)
      end
      
      def setup_fixtures_with_callback_invocation
        run_callback(:before_fixture_load)
        setup_fixtures_without_callback_invocation
      end
    
    private

      def run_callback(callback_name)
        to_run = callbacks[callback_name]
        return unless to_run.any?
        to_run.each { |callback| instance_eval(&callback) }
      end
      
      
      module ClassMethods
      
        def add_callback(callback_name, method = nil, &block)
          raise(ArgumentError, "Require either a method or a block") unless method || block
          callback = block_given? ? block : lambda { send(method) }
          existing = callbacks[callback_name] || []
          write_inheritable_hash :callbacks, {callback_name => (existing + [callback])}
        end
        
      end # ClassMethods
    end   # FixtureLoadingCallbacks
  end     # Forklift
end       # Thumblemonks

ActiveSupport::TestCase.instance_eval { include Thumblemonks::Forklift::FixtureLoadingCallbacks }
