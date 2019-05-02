## Reporting SDK for Ruby Programming language 

**Updates:**

- 31/8 init repo
- 1/9 Uploaded PerfectoReportingClient + reportingTests.
- Added documentation (internal, not for the community).
- 4/9 Added Connection/SsoTokenProducer (Look documentation for windows [certification errors](## Troubleshoot for windows certification error (OpenSSL::SSL::SSLError))). 
- 5/9 Added gem (without httpclient) . 
- 6/9 Gem without httpclient published.



*Dependencies:*

require reporting statement:  <br/>
`require_relative '../gem/Perfecto-Reporting'`

**Usage:**

Initialize a new client:
```Ruby
def create_reporting_client
    perfectoExecutionContext = PerfectoExecutionContext.new(PerfectoExecutionContextBuilder
         .withProject(Project.new('Ruby Reporting', '0.1'))
         .withJob(Job.new('Ruby Job' , 1))
         .withContextTags('Context tag1', 'Context tag2', 'Context tag 3' ...... )
         .withWebDriver(@driver)
         .build)

    @reporting_client = PerfectoReportiumClient.new(perfectoExecutionContext)
  end
```

Test start command: 
```Ruby
@reporting_client.testStart(self.name, TestContext.new('Test tag 1', 'Test tag 2', 'Test tag 13' ...... ))
```

Test step command:
```Ruby
@reporting_client.testStep('Test step description')
```

Test stop command:<br/>
**Note!** - in this case i'm using test instance in order to determine test condition (passed / failed)
```Ruby
if self.passed?
    @reporting_client.testStop(TestResultSuccess.new)
else
    @reporting_client.testStop(TestResultFailure.new(@exception.message, @exception))
end
```

**Running the tests:**
test_setup.rb - this file define the test behavior (setup,teardown ...)<br/>
test.rb - this is the test class inherent from PerfectoTestingBox which is in test_setup.rb file. 

```
ruby test.rb
```

## Troubleshoot for windows certification error (OpenSSL::SSL::SSLError)

Download *cacert.pem* file from [here](https://curl.haxx.se/ca/cacert.pem) . 
set enviorment variable using the following command in the command line: <br/>
`set SSL_CERT_FILE=PATH_OF_FILE\cacert.pem`

Note! Do not delete this file, it's required for certification.
