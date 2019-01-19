require 'test_helper'

class ProductControllerTest < ActionDispatch::IntegrationTest
  def setup
     @bannana = products(:bannana)
     @apple = products(:apple)
  end
end
