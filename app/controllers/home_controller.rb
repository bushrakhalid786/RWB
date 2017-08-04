class HomeController < ApplicationController
  before_action :authenticate_user!, :only => "choose_category"
  require 'will_paginate/array'

  def home
    @latest_ad = Advertisement.order("updated_at desc").limit(6)
  end

  def choose_category

  end

  def show_category_page
    if params[:child_alias_name].present?
      @category = Category.where(alias_name: params[:child_alias_name]).last      
      category_ids =  [@category.parent_id , @category.id]
      @all_ads = Advertisement.by_categories(category_ids).paginate(page: params[:page],per_page: 10)
    else
      @category = Category.where(alias_name: params[:alias_name] || params[:category]).last
      @all_ads = Advertisement.by_categories([@category.id,@category.child_ids].flatten).paginate(page: params[:page],per_page: 10)
    end
    if @category.present?
      render "show_category_page"
    end
  end 

  def search
    @category = Category.where(id: params[:search][:parent_category_id]).last
    category_ids = []
    if params[:search].present?
      @category = Category.where(id: params[:search][:parent_category_id]).last
      search_params = params[:search].delete_if{|k,v| v.blank?}
      if search_params[:category_id].blank? and @category.present?
        category_ids = @category.children.pluck("id")
      end
      advertisements = Advertisement.search do
                         fulltext(search_params["title"]) if search_params[:title].present?
                         any_of do
                           with(:category_id, search_params[:category_id].to_i) if search_params[:category_id].present?
                           category_ids.each do |id|
                             with(:category_id, id.to_i) if id.present?
                           end 
                         end
                         with(:make, search_params[:make]) if search_params[:make].present?
                         with(:year, search_params[:year]) if search_params[:year].present?
                       end
      @all_ads = advertisements.results.paginate(page: params[:page],per_page: 10)
    end
    render "show_category_page"
  end 
end