json.extract! student, :id, :name, :surname, :day_of_birth, :month_of_birth, :year_of_birth, :school, :email :comment, :created_at, :updated_at
json.url student_url(student, format: :json)
