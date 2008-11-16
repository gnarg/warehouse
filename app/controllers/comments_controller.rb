class CommentsController < ApplicationController
  def create
    params[:comment][:change_id] = params[:change_id]
    @comment = Comment.create(params[:comment])
    respond_to do |format|
      format.js
    end
  end
end
