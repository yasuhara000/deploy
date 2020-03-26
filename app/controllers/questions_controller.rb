class QuestionsController < ApplicationController
    #impressionist :actions=> [:show]

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
        #impressionist(@question, nil, :unique => [:session_hash])

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
        @questions = Question.order('impressions_count DESC')
    end

    private
    def params_question
        params.require(:question).permit(:title, :question, :status)
    end
end
