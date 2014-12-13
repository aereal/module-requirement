require 'set'

module Module::Requirement
  class Error < ::StandardError; end
  class Error::NotMeetRequirements < Error; end

  def self.included(included)
    included.extend(Declaration)
    included.singleton_class.send(:define_method, :included) do |inc|
      unimplemented = requirements.reject {|req| inc.method_defined?(req) }
      raise Error::NotMeetRequirements, unimplemented unless unimplemented.empty?
    end
  end

  module Declaration
    def requires(method_name)
      add_requirement(method_name)
    end

    def add_requirement(method_name)
      requirements << method_name
    end

    def requirements
      @requirements ||= Set.new
    end
  end
end
