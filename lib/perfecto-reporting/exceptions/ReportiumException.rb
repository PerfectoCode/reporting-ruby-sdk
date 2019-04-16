
# Instance denoting customized reporting exception
class ReportiumException < StandardError

  # Create new instance
  #
  # msg - new message to be attached to the exception
  def initialize msg
    super(msg)
  end

end