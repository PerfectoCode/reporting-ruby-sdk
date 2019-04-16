#   CustomField - class
#  Defines a hash list of all the custom field values defined for the test context
#  The context fields should be saved as part of the Context and attached to the test report
#
class CustomField
  attr_accessor :key, :value
  def initialize(key, value)
  	@key = key
	@value = value
	end
end