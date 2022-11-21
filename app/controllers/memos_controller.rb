class MemosController < ApplicationController
  def new
    @memo = Memo.new
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    if @memo.save
      redirect_to memo_path(@memo), notice: "You have created memo successfully."
    else
      @memos = Memo.all
      render 'index'
    end
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to memo_path(@memo), notice: "You have updated memo successfully."
    else
      render "edit"
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:user_id, :folder_id, :title, :comment, :copy_text)
  end
end
