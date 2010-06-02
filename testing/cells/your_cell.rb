module YourHelpers
  def hello
    "Hello You"
  end
end

class YourCell < Cell::Base
  helper YourHelpers

  def display
    render
  end
end