class ReactionsController < ApplicationController
    before_action :authenticate_user!
    def new_user_reaction
    @user = current_user
    @post = Post.find(params[:post_id]) if params[:post_id]
    @kind = params[:kind]
    respond_to do |format|
        
        reaction_post = Reaction.find_by(user_id: @user.id, post_id: @post.id)
            if reaction_post
                format.html { redirect_to post_path(@post), notice: 'You already have a reaction'}
            else
                @reaction = Reaction.new(user_id: @user.id, post_id: @post.id, kind: @kind)
                if @reaction.save!
                    format.html { redirect_to post_path(@post), notice: 'Reaction was successfully saved.' }
                else
                    format.html { redirect_to post_path(@post), notice: 'Something went wrong' }
                end
            end
        end
    end
end
