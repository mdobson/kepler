class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    @answer = create_answer(params)
     respond_to do |format|
      if @answer.save
        format.html { redirect_to "/studies/#{params[:study_id]}/questions/#{params[:answer][:question_id]}", notice: 'Answer was successfully created.'}
      end
    end
  end

  def edit
  end

  def index
  end

  def show
  end

  def create_answer(params)
    answer = Answer.new
    answer.question_id = params[:answer][:question_id]
    answer.study_id = params[:study_id]
    answer.user_id = current_user.id
    answer.answer = params[:answer][:answer]
    return answer
  end
end
