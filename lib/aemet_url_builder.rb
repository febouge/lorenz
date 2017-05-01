# This class will build the corresponding URL to request data from AEMET.
class AemetUrlBuilder
  URL_MAP = { hourly_xml: 'http://www.aemet.es/xml/municipios_h/localidad_h_CODE.xml',
              daily_xml: 'http://www.aemet.es/xml/municipios/localidad_CODE.xml',
              hourly_json: 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/CODE?api_key=APIKEY',
              daily_json: 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/CODE?api_key=APIKEY' }.freeze

  def hourly_xml_url
    url_for :hourly_xml
  end

  def daily_xml_url
    url_for :daily_xml
  end

  def hourly_json_url
    url_for :hourly_json
  end

  def daily_json_url
    url_for :daily_json
  end

  private

  def url_for(url_type)
    URL_MAP[url_type]
  end
end
