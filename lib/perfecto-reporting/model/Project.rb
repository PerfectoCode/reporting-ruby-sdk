# Project
#
# Tests can be filtered by project they belong to.
#
# Usage:
# Project.new projectName, projectVersion
class Project

  attr_accessor :name, :version

  # initialize new project instance
  #
  # name - the new project's name
  # version - the project's version
  def initialize name, version
    @name = name
    @version = version
  end

end