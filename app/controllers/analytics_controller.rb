class AnalyticsController < ApplicationController
  before_action :set_user_ip

  def index
    @search_queries = SearchQuery.where(user_ip: @user_ip).group(:query).order('count_id DESC').count('id')
    @queries_by_ip = SearchQuery.where(user_ip: @user_ip).group(:user_ip).order('count_id DESC').count(:id)
  end

  private

  def set_user_ip
    @user_ip = request.remote_ip
  end
end
