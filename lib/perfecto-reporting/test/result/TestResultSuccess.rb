require_relative 'TestResult'

# TestResultSuccess
#
# Define a successful test result
class TestResultSuccess < TestResult 

  @@STATUS = 'PASSED'

  def isSuccessful
    return true
  end

  def status
    @@STATUS
  end

end