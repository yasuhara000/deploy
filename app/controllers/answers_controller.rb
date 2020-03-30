class AnswersController < ApplicationController
    def new
        
        @answer = Answer.new
        @question = Question.find(params[:question_id])
    end
    def show
        @answer = Answer.find(params[:id])
        #binding.pry

    end

    def create

        @answer = Answer.new(params_answer)
        @answer.engineer_id = current_engineer.id
        @answer.question_id = params[:answer][:question_id]
        @answer.save!(params_answer)
        #binding.pry
        redirect_to answer_path(@answer)
    end
    def edit
        @answer = Answer.find(params[:id]) 
        
    end

    def update
        @answer = Answer.find(params[:id]) 
        @answer.update(params_answer)
        redirect_to answer_path(params[:id])
    end
    private
    def params_answer
        params.require(:answer).permit(:title, :answer, :status,:question_id)
    end
end
