class SkyDropX
  require "uri"
  require "net/http"

  # Receives the origin and destiny zips and package specs.
  # Returns a list of the packaging services with prices.
  # Example of request:
  # {
  #   "zip_from": "71317",
  #   "zip_to": "64000",
  #   "parcel": {
  #     "weight": 10,
  #     "height": 10,
  #     "width": 10,
  #     "length": 10
  #   }
  # }
  def quotations(zip_from:, zip_to:, parcel:)
    response = endpoint_call("post", "quotations", {
      zip_from: zip_from,
      zip_to: zip_to,
      parcel: parcel
    })
    JSON.parse(response.body)
  rescue JSON::ParserError => error
    { error: error }
  end

  def all_shipments
    response = endpoint_call("get", "shipments")
    JSON.parse(response.body)
  rescue JSON::ParserError => error
    { error: error }
  end

  def get_shipment(id)
    response = endpoint_call("get", "shipment/#{id}")
    JSON.parse(response.body)
  rescue JSON::ParserError => error
    { error: error }
  end

  # Receives the origin and destiny addresses and packages specs.
  # Creates the shipment
  # Example of request in MX:
  # {
  #   "address_from": {
  #     "province": "Ciudad de México",
  #     "city": "Azcapotzalco",
  #     "name": "Jose Fernando",
  #     "zip": "02900",
  #     "country": "MX",
  #     "address1": "Av. Principal #234",
  #     "company": "skydropx",
  #     "address2": "Centro",
  #     "phone": "5555555555",
  #     "email": "skydropx@email.com"
  #   },
  #   "address_to": {
  #     "province": "Jalisco",
  #     "city": "Guadalajara",
  #     "name": "Jorge Fernández",
  #     "zip": "44100",
  #     "country": "MX",
  #     "address1": " Av. Lázaro Cárdenas #234",
  #     "company": "-",
  #     "address2": "Americana",
  #     "phone": "5555555555",
  #     "email": "ejemplo@skydropx.com",
  #     "reference": "Frente a tienda de abarro",
  #     "contents": "ropa"
  #   },
  #   "parcels": [{
  #     "weight": 3,
  #     "distance_unit": "CM",
  #     "mass_unit": "KG",
  #     "height": 10,
  #     "width": 10,
  #     "length": 10
  #   }]
  # }
  #
  # Example of request in other countries:
  # {
  #   "address_from": {
  #     "province": "Ciudad de México",
  #     "city": "Azcapotzalco",
  #     "name": "Jose Fernando",
  #     "zip": "02900",
  #     "country": "MX",
  #     "address1": "Av. Principal #234",
  #     "company": "skydropx",
  #     "address2": "Centro",
  #     "phone": "5555555555",
  #     "email": "skydropx@email.com"
  #   },
  #   "parcels": [
  #     {
  #       "weight": 3,
  #       "distance_unit": "CM",
  #       "mass_unit": "KG",
  #       "height": 10,
  #       "width": 10,
  #       "length": 10
  #     }
  #   ],
  #   "address_to": {
  #     "province": "TX",
  #     "city": "San Antonio",
  #     "name": "Jorge Fernández",
  #     "zip": "78006",
  #     "country": "US",
  #     "address1": " Av. Lázaro Cárdenas #234",
  #     "company": "-",
  #     "address2": "Americana",
  #     "phone": "2124499113",
  #     "email": "ejemplo@skydropx.com",
  #     "reference": "Frente a tienda de abarro",
  #     "contents": "ropa"
  #   },
  #   "customs_declarations": {
  #     "type_of_content": "Men Clothing",
  #     "customs_items": {
  #       "description": "Men's or boys' suits, ensembles, suit-type jackets, blazers, trousers, bib and brace overalls, breeches and shorts (other than swimwear); Trousers, bib and brace overalls, breeches and shorts; Of other textile materials;Other;Shorts (847)",
  #       "quantity": 1,
  #       "total_value": 10,
  #       "origin": "AF",
  #       "commodity_code": "6203.49.9060",
  #       "purpose": "SOLD"
  #     }
  #   }
  # }
  def create_shipment(address_from:, address_to:, parcels:, customs_declarations: {})
    if customs_declarations.blank? && address_to.with_indifferent_access[:country] != "MX"
      return { error: "Custom Delcarations are required" }
    end
    response = endpoint_call("post", "shipments", {
      address_from: address_from,
      address_to: address_to,
      parcels: parcels,
      # customs_declarations: customs_declarations
    })
    JSON.parse(response.body)
  rescue JSON::ParserError => error
    { error: error }
  end

  private

  def base_url
    "https://api-demo.skydropx.com"
  end

  def endpoint_call(verb, path, package_details = nil)
    uri = URI("#{base_url}/v1/#{path}")
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    if verb == "get"
      request = Net::HTTP::Get.new(uri)
    else
      request = Net::HTTP::Post.new(uri)
    end
    request["Authorization"] = "Bearer #{ENV['SKYDROPX_API_KEY']}"
    if package_details.present?
      # request.body = package_details
      request.body = package_details.to_json
      # puts package_details
      puts request.body
    end
    https.request(request)
  end
end


skydropx = SkyDropX.new
r = skydropx.create_shipment(
  address_from: {
    "province": "Ciudad de México",
    "city": "Azcapotzalco",
    "name": "Jose Fernando",
    "zip": "02900",
    "country": "MX",
    "address1": "Av. Principal #234",
    "company": "skydropx",
    "address2": "Centro",
    "phone": "5555555555",
    "email": "skydropx@email.com"
  },
  parcels: [{
    "weight": 3,
    "distance_unit": "CM",
    "mass_unit": "KG",
    "height": 10,
    "width": 10,
    "length": 10
  }],
  address_to: {
    "province": "Jalisco",
    "city": "Guadalajara",
    "name": "Jorge Fernández",
    "zip": "44100",
    "country": "MX",
    "address1": " Av. Lázaro Cárdenas #234",
    "company": "-",
    "address2": "Americana",
    "phone": "5555555555",
    "email": "ejemplo@skydropx.com",
    "reference": "Frente a tienda de abarro",
    "contents": "ropa"
  }
)

# "parcel": { "weight": 10, "height": 10, "width": 10, "length": 10 }



curl "https://api-demo.skydropx.com/v1/shipments" \
  -H "Authorization: Token token=El7j0lNpWycdqPcTwMNUvHu0iRZkIZb5I7AdmBSrREAt" \
  -H "Content-Type: application/json" \
  -d '{
      "address_from": {
      "province": "Ciudad de México",
      "city": "Azcapotzalco",
      "name": "Jose Fernando",
      "zip": "02900",
      "country": "MX",
      "address1": "Av. Principal #234",
      "company": "skydropx",
      "address2": "Centro",
      "phone": "5555555555",
      "email": "skydropx@email.com"},
      "parcels": [{
        "weight": 3,
        "distance_unit": "CM",
        "mass_unit": "KG",
        "height": 10,
        "width": 10,
        "length": 10
      }],
      "address_to": {
        "province": "Jalisco",
        "city": "Guadalajara",
        "name": "Jorge Fernández",
        "zip": "44100",
        "country": "MX",
        "address1": " Av. Lázaro Cárdenas #234",
        "company": "-",
        "address2": "Americana",
        "phone": "5555555555",
        "email": "ejemplo@skydropx.com",
        "reference": "Frente a tienda de abarro",
        "contents": "ropa_curl"
      }
    }'



