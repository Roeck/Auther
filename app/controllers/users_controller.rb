class UsersController < ApplicationController

    # Admin user exclusive actions:
    before_action :require_admin, only: [:edit, :update, :ban, :destroy]

    # DISPLAY USERS
    def index
        @users = User.all.order(created_at: :asc)
    end

    def show
        @user = User.find(params[:id])
    end

    # EDIT ROLES
    def edit 
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit
        end
    end
    
    # BAN USERS
    def ban  
        @user = User.find(params[:id])
        if @user.access_locked?
            @user.unlock_access!
        else
            @user.lock_access!
        end
        redirect_to @user, notice: "User access locked: #{@user.access_locked?}"
    end

    # DELETE USERS
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path, notice: "User was successfully deleted."
    end

    private

    def user_params
        # Allow user to change roles:
        params.require(:user).permit(*User::ROLES)
    end

    def require_admin
        # Admin method for exclusive actions:
        unless current_user.admin? 
            redirect_to root_path, alert: "You are not authorized for this action"
        end
    end

end