# class VersionHistory # folder
#   attr_reader :versions

#   def initialize
#     @versions       = {}
#     @version_number = 0
#   end

#   def add(version)
#     @versions[@version_number] = version
#     @version_number            += 1
#   end

#   def version(number)
#     @versions[number]
#   end
# end


class ReviewHistory

  attr_reader :versions

  def initialize
    @versions = {}
    @version_number = 0
  end

  def add(version)
    @versions[@version_number] = version
    @version_number += 1
  end

  def version(number)
    @versions[number]
  end
end