require_relative 'TestResultSuccess'
require_relative 'TestResultFailure'

# TestResultFactory
#
# Generates a new test result instance.
class TestResultFactory

  # create a successful test execution result
  #
  # return - instance denoting a successful test execution
  def self.createSuccess
    return TestResultSuccess.new
  end

  # Creates a failed test execution result
  #
  # reason - string representation of the reason for the test failure
  # error - the exception caused the failure
  #
  # return - instance denoting a failed test execution
  def self.createFailure reason, error
    return TestResultFailure.new(reason, error)
  end

  # Creates a failed test execution result
  #
  # reason - string representation of the reason for the test failure
  # error - the exception caused the failure
  # failureReason - string that represents one of the catalogued failure reasons
  #
  # return - instance denoting a failed test execution
  def self.createFailure reason, error, failureReason
    return TestResultFailure.new(reason, error, failureReason)
  end
end
