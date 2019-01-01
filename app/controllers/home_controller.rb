class HomeController < ApplicationController
  before_action :authenticate_user!, :only => "choose_category"
  # require 'will_paginate/array'

  def home

  end

  def choose_category

  end

  def show_category_page
    if params[:child_alias_name].present?
      @category = Category.where(alias_name: params[:child_alias_name]).last      
      category_ids =  [@category.parent_id , @category.id]
      @all_ads = Advertisement.by_categories(category_ids).paginate(page: params[:page],per_page: 6)
    else
      @category = Category.where(alias_name: params[:alias_name]).last
      @all_ads = Advertisement.by_categories([@category.id,@category.child_ids].flatten).paginate(page: params[:page],per_page: 6)
    end
    if @category.present?
      render "show_category_page"
    end
  end 

  def search
    if params[:search].present?
      search_params = params[:search].delete_if{|k,v| v.blank?}
      @all_ads = Advertisement.search do
                   fulltext(search_params["title"])
                   paginate :page => params[:page], :per_page => 6
                 end.results
    end
    render "show_category_page"
  end 
end
