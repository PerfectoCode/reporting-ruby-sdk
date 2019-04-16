require_relative 'PerfectoReportiumClient'

class ReportiumClientFactory

  def self.createPerfectoReportiumClient(perfectoExecutionContext)
    return PerfectoReportiumClient.new perfectoExecutionContext
  end

end