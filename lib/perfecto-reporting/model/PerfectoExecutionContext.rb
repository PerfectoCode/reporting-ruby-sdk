require_relative '../exceptions/ReportiumException'
require_relative '../model/CustomField'

# PerfectoExecutionContext
#
# This class defines the high-level execution context for all tests.
#
# Creating instance of this class possible only with PerfectoExecutionContextBuilder instance.
class PerfectoExecutionContext

  attr_accessor :job, :project, :webdriver, :contextTags, :customFields
 
  # create new instance
  #
  # perfectoExecutionContextBuilder - 
  # raise ReportiumException if driver not given. 
  def initialize (perfectoExecutionContextBuilder)

    # execution is not possible without webdriver.
    if perfectoExecutionContextBuilder.webdriver.nil?
      raise ReportiumException.new('Missing required webdriver argument.')
    end

    @job = perfectoExecutionContextBuilder.job
    @project = perfectoExecutionContextBuilder.project
    @webdriver = perfectoExecutionContextBuilder.webdriver
    @contextTags = perfectoExecutionContextBuilder.contextTags
	@customFields = perfectoExecutionContextBuilder.customFields

  end

  # PerfectoExecutionContext
  #
  # This class used to create PerfectoExecutionContext instance
  #
  # example:
  # perfectoExecutionContext::perfectoExecutionContextBuilder
  # .withJob("job name" , job number )
  # .withProject("project name" , project version)
  # .withWebDriver(driver)
  # .build()
  class PerfectoExecutionContextBuilder

    @@job = nil
    @@project = nil
    @@webdriver = nil
    @@contextTags = nil
 	@@customFields = Hash.new
	
    # define a job
    def self.withJob job
      @@job = job
      return self
    end

    # define a project
    def self.withProject project
      @@project = project
      return self
    end

    # define webdriver
    def self.withWebDriver webdriver
      @@webdriver = webdriver
      return self
    end

    # define contextTags
    def self.withContextTags *args
      @@contextTags = args
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

    def job
      @@job
    end

    def project
      @@project
    end

    def contextTags
      @@contextTags
    end

    def customFields
      @@customFields
    end
	
	def webdriver
      @@webdriver
    end

  end # end PerfectoExecutionContextBuilder

end

