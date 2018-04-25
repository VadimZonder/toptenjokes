class Result < ActiveRecord::Base
    belongs_to :student #, dependent: :destroy
end
