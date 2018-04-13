class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(params_student)
    if @student.save
      redirect_to student_path(@student), notice: @student.name + 'さんのデータが新しく作成されました'
    else
      redirect_to new_student_path, notice: @student.name + 'さんデータの作成に失敗しました。入力内容に誤りがないか確認してください'
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(params_student)
      redirect_to root_path, notice: @student.name + 'さんの情報が更新されました'
    else
      redirect_to edit_student_path(@student), notice: @student.name + 'さんの情報の更新に失敗しました。入力内容に誤りがないか確認してください'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to root_path, notice: @student.name + 'の情報は削除されました。'
  end

  private

  def params_student
    params.require(:student).permit(:name, :year, :image, :memo, :attend_count, :total_time, :entry_time, :exit_time, :are_you_now)
  end
end
