require 'rest-client'

class TokenController < ApplicationController

  def home
  	if session.key?(:token)
  		@token = session[:token]
  		reset_session
  	end
  end

  def generate
    unless ['production', 'sandbox'].include? params[:environment]
      flash[:error] = 'Something went wrong. Please try again?'
      return redirect_to '/'
    end

    dw_env = params[:environment] == 'production'
    cred = params[:auth][:user_key].blank? || params[:auth][:user_secret].blank?
    session[:base_url] = "https://#{dw_env ? 'www.dwolla.com' : 'uat.dwolla.com'}/oauth/v2"

    scope = ""

    params[:auth].each do |k, v|
      scope = scope + k + '|' if v == '1'
    end

    session[:req] = {
      :client_id => cred ? dw_env ? Rails.application.secrets.key_prod : Rails.application.secrets.key_uat : params[:auth][:user_key],
      :client_secret => cred ? dw_env ? Rails.application.secrets.sec_prod : Rails.application.secrets.sec_uat : params[:auth][:user_secret],
      :scope => scope[0..scope.length - 2],
      :response_type => 'code',
      :redirect_uri => Rails.application.secrets.redirect,
      :dwolla_landing => 'login'
    }

    redirect_to(session[:base_url] + '/authenticate?' + session[:req].except(:client_secret).to_query)
  end

  def redirect
    if not (params.key?('code') || session.key?(:req))
      flash[:error] = 'We did not receive any useful data from the Dwolla API. Please try again later.'
      redirect_to '/'
    else
      session[:req] = session[:req].except!(:scope)
      session[:req][:grant_type] = 'authorization_code'
      session[:req][:code] = params[:code]
      p session[:base_url]
      response = RestClient.post(session[:base_url] + '/token', session[:req])
      response = JSON.pretty_generate(JSON.parse(response))

	    session[:token] = "```js\n" + response

      redirect_to '/'
    end
  end
end
