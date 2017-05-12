class ReviewHistory < ActiveRecord::Base

  def initialize
    @versions = {}
    @version_number = 0
    super
  end

  def add(version)
    @versions[@version_number] = version
    @version_number += 1
  end

  def version(number)
    @versions[number]
  end
end