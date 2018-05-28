class AccessesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:access_request]

  def access_request
    @access = Access.new(access_request_params)
    if @access.save
      redirect_to root_path, :flash => { :notice => "#{@access.email} est bien enregistré sur liste d'attente." }
    elsif Access.find_by(email: @access.email)
      redirect_to root_path, :flash => { :notice => "#{@access.email} est bien enregistré sur liste d'attente." }
    else
      redirect_to root_path, :flash => { :alert => "Nous avons rencontré un problème lors de votre inscription." }
    end
  end

  private

  def access_request_params
    params.permit(:email)
  end
end
