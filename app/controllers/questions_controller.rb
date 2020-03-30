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
        @user = User.find(@question.user_id)
        impressionist(@question)
        @answer = Answer.where(question_id:params[:id])
       
    end
    
    def edit
        @question = Question.find(params[:id]) 
    end

    def update
        #binding.pry
        @question = Question.find(params[:id]) 
        @question.update!(params_question)
        @answer = Answer.where(question_id:params[:id])
        #@answer1 = Answer.find(params[:question][:answer][:id])
        #@answer1.status = true
        #@answer1.update!(status: true)
        redirect_to question_path(@question.id)
    end
    def index
        #@questions = Question.order('impressions_count DESC')
        if params[:tag_id] and params[:serach]== ""
            questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.all
            @questions = questions.page(params[:page]).reverse_order
        elsif (params[:search]) and params[:tag_id] == ""
            @questions = Question.search(params[:search]).order('impressions_count DESC').page(params[:page]).reverse_order
        elsif params[:tag_id]=="" and params[:search]== ""

            @questions = Question.page(params[:page]).reverse_order
        else
            #questions = Question.search(params[:search])
            #@questions = questions。where(。where())
            #@questions = Question.search(params[:search]).where(tags.tag_id:params[:tag_id]).order('impressions_count DESC')
            questions = params[:tag_id].present? ? Tag.find(params[:tag_id]).questions : Question.all
            @questions = questions.search(params[:search]).order('impressions_count DESC').page(params[:page]).reverse_order
        end
    end
    
    private
    def params_question
        params.require(:question).permit(:title, :question, :status, :answer["id"],tag_ids: [],answer_attributes: [:id ,:status])
    end
    
    
    
end
