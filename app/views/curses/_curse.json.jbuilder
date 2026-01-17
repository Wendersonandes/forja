json.extract! curse, :id, :title, :about, :start_date, :address, :city, :state, :cover, :created_at, :updated_at
json.url curse_url(curse, format: :json)
json.about curse.about.to_s
json.cover url_for(curse.cover)
