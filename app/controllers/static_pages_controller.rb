class StaticPagesController < ApplicationController
  def home
    cookies[:a]=[[255, 255, 255],[255, 255, 255],[255, 255, 255],[255, 255, 255],[255, 255, 255]]
  end

  def choice
    @nailrgb=cookies[:a].gsub(('['),'').gsub((']'),'').split('&');
    @nail=[];
    5.times do |i|
      @nail.append(@nailrgb[i].split(','));
    end
  end

  def random
    @suggeColor = rgb(SuggeColor.offset(rand(SuggeColor.count)).first.rgb.gsub(('['),'').gsub((']'),'').split(','))
  end
  
  def update
    @rgb=[]
    if params[:rgb].kind_of?(Array)
      @color = params[:rgb]
      @rgb = rgb(@color)
    else
      5.times do |i|
        @color = params[:rgb][('color'+i.to_s).intern]
        @rgb[i] = [@color[1..2].hex,@color[3..4].hex,@color[5..6].hex]#hex->16進数を10進数にする
      end
    end
    cookies[:a]=@rgb
    redirect_to new_path
  end

  def saveDB
    @saveColor = Color.new(rgb: cookies[:a].gsub(('['),'').gsub((']'),'').gsub(('&'),','))
    if @saveColor.valid?
      @saveColor.save
    else

    end
    redirect_to new_path
  end

  def deleteColor
    Color.find(params[:id]).destroy
  end

  def rgb(color)
    @rgb = []
    5.times do |i|
      @rgb[i] = [color[i * 3].to_i,color[1 + i * 3].to_i,color[2 + i * 3].to_i]
    end
    return @rgb
  end

  private
  def color_params
    @color = Color.find(params[:id])
  end
end