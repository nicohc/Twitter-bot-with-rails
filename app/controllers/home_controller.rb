class HomeController < ApplicationController
  def index
  end

  def new
    @twitt = Twitt.new
  end

  def create
    @twitt = Twitt.new(twitt_params)
    if @twitt.save
      msg = @twitt.content
      Twittermessage.new(msg).perform
      flash[:success] = "Envoyé." #Permet d'afficher une pop-up de confirmation.
      redirect_to home_index_path
    else
      flash[:danger] = "NON envoyé." #Permet d'afficher une pop-up d'erreur.
      render 'index'
    end
  end

private

  def twitt_params
      params.permit(:content)
  end

end
