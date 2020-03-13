class Answer < ApplicationRecord
    belongs_to : engineer
    belongs_to : question
end
