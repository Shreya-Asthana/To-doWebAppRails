class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit create update ]

  def index
    @categories = Category.all
    if params[:category_id].present?
      @todos = Todo.where(category_id: params[:category_id]).order(:due_date)
    else
      @todos = Todo.order(:due_date)
    end

    @completed_count = @todos.where(completed: true).count
    @remaining_count = @todos.where(completed: false).count
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def edit
  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def todo_params
    params.require(:todo).permit(:title, :description, :completed, :due_date, :category_id)
  end
end
