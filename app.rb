require('sinatra')
require('sinatra/reloader')
require('./lib/parcel')
require('geokit')

get('/') do
  erb(:index)
end

get('/parcel') do
  zip_1 = params[:zip1]
  zip_2 = params[:zip2]
  start_point = Geokit::Geocoders::GoogleGeocoder.geocode(zip_1)
  end_point = Geokit::Geocoders::GoogleGeocoder.geocode(zip_2)
  distance = start_point.distance_to(end_point).round()

  speed = params[:shipRadios].to_i()

  length = params[:length].to_f()
  width = params[:width].to_f()
  height = params[:height].to_f()

  weight = params[:weightLbs].to_f() * 16 + params[:weightOzs].to_f()

  user_parcel = Parcel.new(length, width, height, weight)
  @shipping_cost = '%.2f' % user_parcel.cost_to_ship(speed, distance)

  erb(:parcel)
end
