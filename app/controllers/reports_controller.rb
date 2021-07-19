class ReportsController < ApplicationController
  def index
    if @current_user.role == "owner"
      if params[:date_first].present?
        @orders = Order.where("ordered_at between ? and ?",
                              params[:date_first],
                              DateTime.parse(params[:date_last]) + 1)
      else
        @orders = Order.all
      end
      render "index"
    else
      redirect_to "/"
    end
  end
end
