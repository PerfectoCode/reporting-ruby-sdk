# perfecto-reporting Gem
#
# For more information about the gem read the documentation file.
# For support check out our community at : www.community.perfectomobile.com
#
# MIT License

# Client classes
require_relative './perfecto-reporting/client/PerfectoReportiumClient'
require_relative './perfecto-reporting/client/ReportiumClientFactory'

# Model classes
require_relative 'perfecto-reporting/model/PerfectoExecutionContext'
require_relative 'perfecto-reporting/model/Job'
require_relative 'perfecto-reporting/model/Project'
require_relative 'perfecto-reporting/model/CustomField'

# Test classes
require_relative 'perfecto-reporting/test/TestContext'
require_relative 'perfecto-reporting/test/result/TestResultFactory'
