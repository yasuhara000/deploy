class QuestionsController < ApplicationController
    def new
        @question = Question.new
    end

    def create
        @question = Question.new(params_question)
        @question.user_id = current_user.id
        
        @question.save!(params_question)
       
        redirect_to question_path(@question.id)
    end

    def show
        @question = Question.find(params[:id])
        @answer = Answer.where(question_id:params[:id])
    end
    
    def edit
        @question = Question.find(params[:id]) 
    end

    def update
        @question = Question.find(params[:id]) 
        @question.update(params_question)
        redirect_to question_path(@question.id)
    end
    def index
        @questions = Question.all
    end

    private
    def params_question
        params.require(:question).permit(:title, :question, :status)
    end
end
