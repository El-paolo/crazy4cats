class CommentsController < ApplicationController
    before_action :set_comment, only: %i[ show edit update destroy ]
    #before_action :set_post
    before_action :authenticate_user!, except: %i[ index show]
    #before_action :comment_permission, only: %i[ edit destroy ]
    before_action only: %i[ destroy ] do
      authorize_request(["admin"])
    end
    

  


  
    # GET /comments/1/edit
    def edit
    end
  
    # POST /comments or /comments.json
    def create
        @post = Post.find(params[:comment][:post_id])
        @comment = Comment.new(comment_params)
        @comment.user = current_user
  
      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_path(@post.id), notice: "Comment was successfully created." }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  

  

  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.

      def comment_params
        params.require(:comment).permit(:content, :post_id)
      end
  
    #   def comment_permission
    #     unless @comment.user_id == current_user.id || current_user.role != 2
    #       redirect_to report_comment_path(@post.id), notice: 'You are not allowed to perform this action'
    #     end
    #   end     
  end
  