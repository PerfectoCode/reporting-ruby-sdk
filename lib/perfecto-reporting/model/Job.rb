
# Job 
# Defines a job which runs the test / group of tests
# 
# This can be used in order to locate specific job in reporting ui
class Job

  attr_accessor :name, :number, :br_name

  # initialize a new job instance
  def initialize name, number
    @name = name
    @number = number
  end
  
  def withBranch(brName)
  	@br_name = brName
	return self
  end
  
end