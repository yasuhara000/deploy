class Users::QuestionsController < ApplicationController
    def new
    end

    def create
        @question = Question.new(params_question)
        @question.save!(params_question)
        @question1 = Question.find(params[:id])
        redirect_to question_path(@question1)
    end

    def show
        @question = Question.find(params[:id])
    end

    def index
        @questions = Question.all
    end

    private
    def params_question
        params.require(:question).permit(:title, :question, :status)
    end
end
