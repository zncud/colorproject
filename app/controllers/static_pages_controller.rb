class StaticPagesController < ApplicationController
  def home
    cookies[:a]=[[255, 255, 255],[255, 255, 255],[255, 255, 255],[255, 255, 255],[255, 255, 255]]
  end

  def choice
    @nail=cookies[:a].gsub(('['),'').gsub((']'),'').gsub(('&'),',').split(',')
  end

  def random
    @suggeColor = rgb(SuggeColor.offset(rand(SuggeColor.count)).first.rgb.gsub(('['),'').gsub((']'),'').split(',')).split(',')
  end
  
  def update
    @rgb=''
    #保存した色を呼び出す
    if params[:rgb].kind_of?(Array)
      @color = params[:rgb]
      @rgb = rgb(@color)
    #選択した色を呼び出す
    else
      5.times do |i|
        @color = params[:rgb][('color'+i.to_s).intern] #:color iに変換
        @rgb = @rgb + @color[1..2].hex.to_s + ',' + @color[3..4].hex.to_s + ',' + @color[5..6].hex.to_s + ','#hex->16進数を10進数にする
      end
    end
    cookies[:a]=@rgb
    redirect_to choice_path
  end

  def saveDB
    @saveColor = Color.new(rgb: cookies[:a].gsub(('['),'').gsub((']'),'').gsub(('&'),','))
    if @saveColor.valid?
      @saveColor.save
    else
      
    end
    redirect_to choice_path
  end

  def deleteColor
    Color.find(params[:id]).destroy
    redirect_to choice_path
  end

  def rgb(color)
    @rgb = ""
    5.times do |i|
      @rgb = @rgb + color[i * 3].to_s+','+color[1 + i * 3].to_s+','+color[2 + i * 3].to_s + ','
    end
    return @rgb
  end
end