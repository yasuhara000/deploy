class Engineers::AnswersController < ApplicationController
    def new
    end

    def create
        @answer = Answer.new(params_answer)
        @answers.save!(params_answer)
    end

    def show
        @answer = Answer.find(params[:id])
    end

    def index
        @answers = Answer.all
    end

    private
    def params_answer
        params.require(:answer).permit(:title, :answer, :status)
    end
end
