# This class will build the corresponding URL to request data from AEMET.
class AemetUrlBuilder
  URL_MAP = { hourly_xml: 'http://www.aemet.es/xml/municipios_h/localidad_h_CODE.xml',
              daily_xml: 'http://www.aemet.es/xml/municipios/localidad_CODE.xml',
              hourly_json: 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/horaria/CODE?api_key=APIKEY',
              daily_json: 'https://opendata.aemet.es/opendata/api/prediccion/especifica/municipio/diaria/CODE?api_key=APIKEY' }.freeze

  def hourly_xml_url
    URL_MAP[:hourly_xml]
  end

  def daily_xml_url
    URL_MAP[:daily_xml]
  end

  def hourly_json_url
    URL_MAP[:hourly_json]
  end

  def daily_json_url
    URL_MAP[:daily_json]
  end
end
