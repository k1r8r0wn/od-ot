class Api::TodoListsController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :find_todo_list, only: [:show, :update, :destroy]

  def index
    render json: TodoList.all
  end

  def show
    render json: @list
  end

  def create
    list = TodoList.new(list_params)
    if list.save
      render status: 200, json: {
        message: 'Successfully created To-do List.',
        todo_list: list
      }.to_json
    else
      render status: 422, json: {
        message: list.errors,
        todo_list: list
      }.to_json
    end
  end

  def update
    if @list.update(list_params)
      render status: 200, json: {
          message: 'Successfully updated.',
          todo_list: @list
      }.to_json
    else
      render status: 422, json: {
          message: 'The To-do list could not be updated.',
          todo_list: @list
      }.to_json
    end
  end

  def destroy
    @list.destroy
    render status: 200, json: {
      messsage: 'Successfully deleted To-do List.'
    }.to_json
  end

  private

  def list_params
    params.require(:todo_list).permit(:title)
  end

  def find_todo_list
    @list = TodoList.find(params[:id])
  end

end