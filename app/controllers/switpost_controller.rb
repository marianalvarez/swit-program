class SwitpostController < ApplicationController
  def new
  end

  def show
  @article = Switpost.find(params[:id])
  end
 

def create
  @switpost = Switpost.new(switpost_params)
 
  @switpost.save
  redirect_to @switpost
end
 
private
  def switpost_params
    params.require(:switpost).permit(:text)
  end

end