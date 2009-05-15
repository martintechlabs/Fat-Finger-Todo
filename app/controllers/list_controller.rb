class ListController < ApplicationController
  before_filter :set_facebook_session
  helper_method :facebook_session
  before_filter :auth

  def index
    @mainlist = Todolist.find(:all, :conditions => {:facebook_id => facebook_session.user.to_s, :listname => 'main'}, :order => 'position')
  end

  def add
    td = Todolist.new
    td.facebook_id = facebook_session.user.to_s
    td.listname = 'main'
    td.description = params[:description]
    td.save

    redirect_to :action => 'index'
  end

  def delete
    td = Todolist.find(params[:id])
    td.destroy
    redirect_to :action => 'index'
  end

  def save_order
    p = 0
    params[:mainlist].each do |i|
      td = Todolist.find(i)
      td.position = p
      td.save
      p = p + 1
    end
    redirect_to :action => 'index'
  end

  private
  def auth
    begin
      # this seems to be the best way to check for invalid session
      facebook_session.user.name
    rescue
      session[:redirect_url] = request.path
      redirect_to '/login'
    end
  end
end
