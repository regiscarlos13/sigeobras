# frozen_string_literal: true

require 'test_helper'

class ReportControllerTest < ActionDispatch::IntegrationTest
  test 'should get constructions' do
    get report_constructions_url
    assert_response :success
  end
end
