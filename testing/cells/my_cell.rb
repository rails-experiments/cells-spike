module MyHelpers
  def hello
    "Hello"
  end
end

class MyCell < Cell::Base
  helper MyHelpers

  cache :display

  def display
    $x ||= 0
    $x +=  1
    render
  end
end