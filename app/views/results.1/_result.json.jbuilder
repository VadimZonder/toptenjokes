json.extract! result, :id, :date_time, :classes, :teacher, :grade, :email, :parent_email, :comment, :created_at, :updated_at
json.url result_url(result, format: :json)
