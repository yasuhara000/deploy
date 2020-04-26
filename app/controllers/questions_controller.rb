class QuestionsController < ApplicationController
    #impressionist :actions=> [:show]
    before_action :authenticate_user!, only: [:new,:update,:new]
    def new
        @question = Question.new
    end

    def create
        @question = Question.new(params_question)
        @question.user_id = current_user.id   
        if @question.save(params_question)
            redirect_to question_path(@question.id)
        else
            render :new
        end
    end

    def show
        @question = Question.find(params[:id])
        @user = User.find(@question.user_id)
        impressionist(@question)
        @answer = Answer.where(question_id:params[:id])
        @engineer = current_engineer
    end
    
    def edit
        @question = Question.find(params[:id]) 
        if @question.user != current_user
            redirect_to question_path(@question)
        end
    end

    def update
        @question = Question.find(params[:id]) 
        
        @answer = Answer.where(question_id:params[:id])
        if @question.update(params_question)
            redirect_to question_path(@question.id)
        else
            render :edit
        end
    end

    def index
        if params[:tag_id] and params[:serach]== ""
            questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.all
            @questions = questions.page(params[:page]).reverse_order
        elsif (params[:search]) and params[:tag_id] == ""
            @questions = Question.search(params[:search]).order('impressions_count DESC').page(params[:page]).reverse_order
        elsif params[:tag_id]=="" and params[:search]== ""
            @questions = Question.page(params[:page]).reverse_order
        else
            questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.all
            @questions = questions.search(params[:search]).order('impressions_count DESC').page(params[:page]).reverse_order
        end
    end
    
    private
    def params_question
        params.require(:question).permit(:title, :question, :status, :answer["id"],tag_ids: [],answer_attributes: [:id ,:status])
    end
  
end
