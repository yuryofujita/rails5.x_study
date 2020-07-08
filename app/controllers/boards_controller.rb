class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    #binding.pry
  end

  def show
    @board = Board.find(params[:id])
    p(@board)
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    board = Board.find(params[:id])
    board.update(board_params)
    redirect_to board
  end

  def create
    Board.create(board_params)
    binding.pry
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body)
  end
end