require 'test_helper'

class ImportAemetDailyDataJobTest < ActiveJob::TestCase
  test 'working job' do
    previous_job_forecasts = HourlyForecast.all.length
    ImportAemetDailyDataJob.perform_now
    after_job_forecasts = HourlyForecast.all.length
    assert_not previous_job_forecasts.eql? after_job_forecasts
  end
end
