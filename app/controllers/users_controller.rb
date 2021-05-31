class UsersController < ApplicationController

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

    # Allow user to change roles:

    private

    def user_params
        params.require(:user).permit(*User::ROLES)
    end

end