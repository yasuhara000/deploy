class AnswersController < ApplicationController
    def new
        @answer = Answer.new
    end

    def create
        @answer = Answer.new(params_answer)
        @answer.engineer_id = current_engineer.id
        @answer.question_id = params[:question_id]
        @answer.save!(params_answer)
       
        redirect_to question_path(@answer.question_id)
    end
    def edit
        @answer = Answer.find(params[:id]) 
        @question = Question.find(params[:question_id])
    end

    def update
        @answer = Answer.find(params[:id]) 
        @answer.update(params_answer)
        redirect_to question_path(params[:answer][:question_id])
    end
    private
    def params_answer
        params.require(:answer).permit(:title, :answer, :status,:question_id)
    end
end
