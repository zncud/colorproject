class StaticPagesController < ApplicationController
  def home
  end

  def new
    @nailrgb=cookies[:a].gsub(('['),'').gsub((']'),'').split('&');
    @nail=[];
    5.times do |i|
      @nail.append(@nailrgb[i].split(','));
    end
  end
  
  def update
    @rgb=[]
    5.times do |i|
      @color = params[:rgb][('color'+i.to_s).intern]
      @rgb[i] = [@color[1..2].hex,@color[3..4].hex,@color[5..6].hex]
    end
    cookies[:a]=@rgb
    redirect_to new_path
  end
end
