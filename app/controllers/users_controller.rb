class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain:"hello to rails !#{DateTime.now.to_s}"
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    #render plain:"hai create"
    user_name = params[:username]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(username: user_name, email: email, password: password)
    #   render plain:"Hey the params are #{params.to_s}"
    response_text = "Hey ,your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    #if(User.where("email=? and password=?",email,password))
    #  render plain:"true"
    # else
    #  render plain:"false"
    # end
    #end
    #render plain:bool.map{|user |user.to_pleasant_string}.join("\n")

    #render plain:User.all.map{|user |user.to_pleasant_string}.join("\n")
    #if User.exists?(User.where("email=? and password=?",email,password))

    #render plain:"true"
    #else
    #  render plain:"false"
    #end

    user = User.where("email=? and password=?", email, password)
    render plain: user.exists?
  end
end
