class PortfoliosController < ApplicationController
    def index 
        @portfolio_items = Portfolio.all
    end

    def new 
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit 
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])

  respond_to do |format|
    if @portfolio_item.update(portfolio_item_params)
      format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
      format.json { render :show, status: :ok, location: @blog }
    else
      format.html { render :edit }
      format.json { render json: @blog.errors, status: :unprocessable_entity }
    end
  end
end

  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end


  private

  def portfolio_item_params
    params.require(:portfolio).permit(:title, :subtitle, :body)
  end


end
