class BoardsController < ApplicationController

  #アクション実行前に起動
  before_action :set_target_board, only: %i[show edit update destroy]

  def index
    # @boards = Board.all
    # kaminariのpagenation
    @boards = params[:tab_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    # @boards = Board.page(params[:page])
    @boards = @boards.page(params[:page])
  end

  def new
    @board = Board.new(flash[:board])
    #binding.pry
  end

  def show
    #@board = Board.find(params[:id])
    #@comment = @board.comments.new
    @comment = Comment.new(board_id:@board.id)
    #binding.pry
  end

  def edit
    #@board = Board.find(params[:id])
    @board.attributes = flash[:board] if flash[:board]
  end

  def update
    #@board.update(board_params)
    if @board.update(board_params)
      redirect_to @board
    else
      redirect_to :back, flash: {
        board: @board,
        error_messages: @board.errors.full_messages
      }
    end
  end

  def create
    # board = Board.create(board_params)
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
    #binding.pry
  end

  def destroy
    #board = Board.find(params[:id])
    # @board.delete
    @board.destroy
    redirect_to boards_path, flash: {notice: "「#{@board.title}」の掲示板が削除されました"}
  end

  private
  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def set_target_board
    @board = Board.find(params[:id])
  end
end