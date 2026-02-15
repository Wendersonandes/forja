json.extract! course, :id, :title, :about, :start_date, :address, :city, :state, :cover, :created_at, :updated_at
json.url course_url(course, format: :json)
json.about course.about.to_s
json.cover url_for(course.cover)
