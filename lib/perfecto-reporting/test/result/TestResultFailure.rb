require_relative 'TestResult'

# TestResultFailure
#
# Define a failure test result.
class TestResultFailure < TestResult

  attr_accessor :message, :failureReason

  @@STATUS = 'FAILED'

  # Create a new instance
  #
  # reason - string representation of the failure reason
  # error - exception caused to the failure
  # failureReason - one of the failure reasons in the catalogue
  def initialize(reason, error, failureReason=nil)
    if error.is_a? Exception
      @message = reason + '. Stack Trace:' + error.backtrace.to_s
    else
      @message = reason
    end
    ## Validate that the reason + error stacktrace are not longer then 4096 charcters 
    if @message.length > 4096
      @message = @message[0,4096]
    end
    @failureReason = failureReason

  end
  
  def isSuccessful
    return false
  end

  def status
    @@STATUS
  end

end
