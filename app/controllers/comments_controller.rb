class CommentsController < ApplicationController
  def create
      @product = Product.find_by(id: params[:id])
      if(!@product.nil?)
        comment = @product.comments.build(comment_params)
        comment.user = current_user

        if comment.save
          flash[:notice] = "Comment has been created."
          redirect_to @product
        else
          flash[:alert] = "Comment has not been created."
        end
      end
    end

    private    
      def comment_params
        params.permit(:comment)
      end
end
