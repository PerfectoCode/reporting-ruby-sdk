require_relative '../model/CustomField.rb'
# TestContext
#
# TestExecutionTags will be presented in reporting ui.
# This tags attached to each test execution.
# 
# Custom Fields defined for the TestContext are presented in report UI
#   These custom fields override the values in the PerfectoExecutionContext
class TestContext

  attr_accessor :testExecutionTags, :customFields

  # Create TestContext instance
  def initialize(contextBuilder )
    @testExecutionTags = contextBuilder.testExecutionTags
    @customFields = contextBuilder.customFields
  end
	
  # TestContextBuilder
  #
  # This class used to create TestContext instance
  #
  # example:
  # cf1 = CustomField.new(key1, val1)
  # cf2 = CustomField.new(key2, val2)
  # TestContext::TestContextBuilder
  # .withContextTags("tag1" , "tag2" )
  # .withCustomFields(cf1, cf2)
  # .build()
  class TestContextBuilder
    @@customFields = Hash.new
    @@testExecutionTags = nil

    # define contextTags
    def self.withTestExecutionTags *args
      @@testExecutionTags = args
      return self
    end

    # define the custom fields, overriding any existing definition
    def self.withCustomFields *args
	unless args.nil?
	  args.each do |cf| 
		@@customFields[cf.key] = cf.value
	  end
	end
      return self
    end
	
    # building a new builder instance
    def self.build
      return self.new
    end

    def testExecutionTags
      @@testExecutionTags
    end
	
    def customFields
      @@customFields
    end

  end # end TestContextBuilder
end
