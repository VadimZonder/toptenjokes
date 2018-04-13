class Student < ActiveRecord::Base
 #in orer to have proper connection
  def student_params
      params.require(:student).permit(:name, :surname, :day_of_birth, :month_of_birth, :year_of_birth, :school, :email, :comment)
   
  end

 #has_many :results, dependent: :destroy
end
