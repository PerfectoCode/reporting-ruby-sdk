require_relative '../model/PerfectoExecutionContext'
require_relative '../exceptions/ReportiumException'
require_relative 'constants'

# PerfectoReportiumClient
class PerfectoReportiumClient

  attr_accessor :perfectoExecutionContext

  def initialize(perfectoExecutionContext)
    @perfectoExecutionContext = perfectoExecutionContext
  end

  # creates a new test execution
  #
  # name - test name
  # context - test context instance
  #
  # returns - id of created test
  def testStart(name, context)
    params = {}

    unless @perfectoExecutionContext.job.nil?
      params['jobName'] = @perfectoExecutionContext.job.name
      params['jobNumber'] = @perfectoExecutionContext.job.number
	  params['jobBranch']= @perfectoExecutionContext.job.br_name
    end

    unless @perfectoExecutionContext.project.nil?
      params['projectName'] = @perfectoExecutionContext.project.name
      params['projectVersion'] = @perfectoExecutionContext.project.version
    end

    params['name'] = name
	
    params['tags'] = @perfectoExecutionContext.contextTags
    unless context.testExecutionTags.nil?
	 params['tags'] += context.testExecutionTags
    end
		 
	# need to merge the CustomFields from the two levels of context
	# the TestContext (in the "context" parameter) values overwrite the ExecutionContext
    custom_flds = @perfectoExecutionContext.customFields
    context.customFields.each do |key, value|
	custom_flds[key] = value
    end
	
    custom_json = custom_flds.map { |key, value| key + '=' + value }
    # the format that script wants is: '[ "test=sample","tester=new_tester"]'
    params['customFields'] = custom_json

    executeScript($START_TEST_COMMAND, params)
  end


  # logging a logical test step.
  #
  # ### DEPRECATED ###
  #
  # description - step description, will be presented on reporting ui.
  #
  # returns - id of created step
  #
  # e.g. 'click on next button'
  def testStep(description)
    warn 'testStep method is deprecated, please use stepStart or stepEnd commands instead.'
    executeScript($START_STEP_COMMAND, {:name => description})
  end

  # logging a logical test step start
  #
  # description - step description
  def stepStart(description)
    executeScript($START_STEP_COMMAND, {:name => description})
  end

  # logging a logical test step end
  #
  # message - a possible message to attach
  def stepEnd(message=nil)
    executeScript($END_STEP_COMMAND, {:message => message})
  end

  # Indicates that the test has stopped and its execution status.
  #
  # testResult - testResult instance
  #
  # returns - false if the method failed due to existing conditions such as a previous call to testStart that failed,
  # otherwise return true 
  def testStop(testResult)

    params = {
        :success => testResult.isSuccessful
    }

    if !testResult.isSuccessful
      params['failureDescription'] = testResult.message
      params['failureReason'] = testResult.failureReason
    end

    executeScript($END_TEST_COMMAND, params)
    return true
  end

  def testStop(testResult, context)

    params = {
        :success => testResult.isSuccessful
    }

    if !testResult.isSuccessful
      params['failureDescription'] = testResult.message
      params['failureReason'] = testResult.failureReason
    end

    unless context.testExecutionTags.nil?
	 params['tags'] = context.testExecutionTags
    end

    custom_json = context.customFields.map { |key, value| key + '=' + value }
    # the format that script wants is: '[ "test=sample","tester=new_tester"]'
    params['customFields'] = custom_json
    
    executeScript($END_TEST_COMMAND, params)
    return true
  end
  
  
  # log a new assertion
  #
  # message - a message to be attached to the assertion
  # status - true / false value
  def reportiumAssert(message, status)
    params = {
        :message => message,
        :status => status
    }
    executeScript($ASSERT_COMMAND, params)
  end

  # Returns the URL to the created online report in Perfecto's reporting solution.
  #
  # name - test name
  # The report is based on all tests that match the current execution context, and is not
  # limited to a single functional test execution.
  #
  # returns - URL to the created online report
  #
  # raise exception if driver has no capabilities variable
  def getReportUrl()
    url = nil
    webdriver = @perfectoExecutionContext.webdriver

    begin
      url = webdriver.capabilities['testGridReportUrl']
    rescue Exception => e
      raise ReportiumException.new e.message
    end

    return url
  end

  def executeScript(script, params)
    webdriver = @perfectoExecutionContext.webdriver
    return webdriver.execute_script(script, params)
  end

end
