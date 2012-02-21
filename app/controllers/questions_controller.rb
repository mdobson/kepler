class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = create_question(params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to "/studies/#{params[:study_id]}/questions", notice: 'Question was successfully created.'}
      end
    end
  end

  def edit
  end

  def index
    @questions = Question.questions_in_study(params[:study_id])
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  def create_question(params)
    question = Question.new
    question.question = params[:question][:question]
    question.study_id = params[:study_id]
    question.user_id = current_user.id
    return question
  end

end
