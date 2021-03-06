class AnswersController < ApplicationController
    before_action :authenticate_engineer!, only: [:edit,:new]
    
    def new
        @answer = Answer.new
        @question = Question.find(params[:question_id])
       
    end

    def show
        @answer = Answer.find(params[:id])
    end

    def create
        @question = Question.find(params[:answer][:question_id])
        @answer = Answer.new(params_answer)
        @answer.engineer_id = current_engineer.id
        @answer.question_id = params[:answer][:question_id]
        if @answer.save(params_answer)
            @answer_question = @answer.question
            @answer_question.create_notification_answer!(current_engineer, @answer.id)
            redirect_to answer_path(@answer)
        else
            render :new
        end
    end

    def edit
        @answer = Answer.find(params[:id]) 
        if @answer.engineer != current_engineer
            redirect_to answer_path(@answer)
        end
    end

    def update
        @answer = Answer.find(params[:id]) 
        if @answer.update(params_answer)
            if @answer.status == true
                question = Question.find(@answer.question.id)
                question.update!(status: "解決済")
            end
            redirect_to answer_path(params[:id])
        else
            render :edit
        end
    end

    private
    def params_answer
        params.require(:answer).permit(:title, :answer, :status,:question_id)
    end
end
