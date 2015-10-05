require 'rest-client'

class TokenController < ApplicationController

  cattr_accessor :dw_env, :cred, :base_url, :req, :auth

  def home
  	reset_session
  end

  def generate
  	unless ['Production', 'UAT/Sandbox'].include? params[:commit] 
  		redirect_to '/'
  		flash[:error] = 'Something went wrong. Please try again?'
  	end

  	p params

  	@@dw_env = params[:commit] == 'Production'
  	@@cred = params[:auth][:user_key].empty? || params[:auth][:user_secret].empty?

  	@@base_url = "https://#{dw_env ? 'dwolla.com' : 'uat.dwolla.com'}/oauth/v2"

  	scope = ""

  	params[:auth].each do |k, v|
  		scope = scope + k + '?' if v == 1
  	end

  	@@req = {
  		:client_id => cred ? Rails.application.secrets.key_uat : params[:auth][:user_key],
  		:client_secret => cred ? Rails.application.secrets.sec_uat : params[:auth][:user_secret],
  		:scope => scope,
  		:redirect_uri => 'http://localhost:3000/redirect'
  	}
  	p @@base_url + '/authenticate?' + @@req.to_query

  	redirect_to(@@base_url + '/authenticate?' + @@req.to_query)
  end

  def redirect
  	unless params.key?('code')
  		redirect_to '/'
  		flash[:error] = 'We did not receive any useful data from the Dwolla API. Please try again later.'
  	end

  	@@req = @@req.except!(:scope)
  	@@req[:grant_type] = 'authorization_code'
  	@@req[:code] = params[:code]
  	@@req[:redirect_uri] = 'http://localhost:3000/redirect'

  	@@authorization = RestClient.post(@@base_url + '/token', @@req.to_json)
  	p @@authorization
  	render 'home'
  end
end
