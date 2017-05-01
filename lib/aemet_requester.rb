require 'aemet_url_builder'
require 'openssl'
require 'open-uri'
# TODO, change openssl verification
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# This class requests AEMET data (XML or JSON) and returns it.
class AemetRequester
  def initialize(api_key = '', location_code = '')
    @api_key = api_key
    @location_code = location_code
    @url_builder = AemetUrlBuilder.new
  end

  def hourly_forecast_xml
    request_url = @url_builder.hourly_xml_url
    request_xml(request_url)
  end

  def daily_forecast_xml
    request_url = @url_builder.daily_xml_url
    request_xml(request_url)
  end

  def hourly_forecast_json
    request_url = @url_builder.hourly_json_url
    request_json(request_url)
  end

  def daily_forecast_json
    request_url = @url_builder.daily_json_url
    request_json(request_url)
  end

  private

  def request_xml(url)
    raw_data = request_raw_data_from(url)
    Nokogiri::XML(raw_data)
  end

  def request_json(url)
    raw_data = request_raw_data_from(url)
    data_url = JSON.parse(raw_data)['datos']
    raw_data = URI(data_url).read
    JSON.parse(raw_data)
  end

  def request_raw_data_from(url)
    URI(replace_data_in_url(url)).read
  end

  def replace_data_in_url(url)
    replaced_url = url.sub! 'CODE', @location_code
    replaced_url.sub! 'APIKEY', @api_key
  end
end
