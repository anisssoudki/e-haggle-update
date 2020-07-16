class SessionsController < ApplicationController
  before_action :logged_in_redirect, only: [:login, :create]
  
  
      def login
      end
    
      def create
        
        user = User.find_by(email: session_params[:email])
          if user && user.authenticate(session_params[:password])
          session[:user_id] = user.id
          flash[:msg] = "Logged in successfully"
          redirect_to user_path(user)
  
        else
          
          redirect_to login_path
          flash[:err] = "hmmm, looks like the information you entered doesn't match our records."
        end
      end
    
      def logout
        session.clear
        flash[:err] = "Logged out"
        redirect_to root_path
      end
  
  
      def facebook
       
        
          user = User.find_or_create_by(uid: facebook_params['uid']) do |user|
          user.username = facebook_params['info']['name']
          # user.image = facebook_params['info']['image']
          user.email = facebook_params['info']['email']
          user.oauth_token = facebook_params['credentials']['token']
          user.oauth_expires_at = Time.at(facebook_params['credentials']['expires_at'])
          user.password = facebook_params['credentials']['token'][1..5] 
          # byebug
          user.save
          user
        end
          
          if session[:user_id] = user.id
         
          flash[:success] = "Welcome, #{user.username}!"
          else
          flash[:err] = "There was an error while trying to authenticate you..."
          end
        redirect_to "/"
      end
  
  
      private
  
      def session_params
        params.require('session').permit(:email, :password)
      end
  
      def facebook_params
        request.env['omniauth.auth']
      end
  
      # adding contoller level restriction to prevent duplicate logins from facebook and regular log in
      def logged_in_redirect
        if logged_in?
          flash[:err] = "you are already logged in"
          redirect_to root_path
      end
    end
  end
  