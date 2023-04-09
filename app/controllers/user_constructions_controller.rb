class UserConstructionsController < ApplicationController
    def create
      @user = User.find(params[:user_id])
        @user_construction = @user.user_constructions.create(user_constructions_params)
        
        redirect_to user_path(@user)
      end

      def destroy
        @user = User.find(params[:user_id])
        @user_construction = @user.user_constructions.find(params[:id])
        @user_construction.destroy
        redirect_to user_path(@user), status: :see_other
      end
    
      private
        def user_constructions_params
          params.require(:user_construction).permit(:construction_id, :user_id)
        end
end
