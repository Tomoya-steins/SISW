class PersonalController < ApplicationController
  def show
    @temporary_image = "no-image-people.jpg"
    @personal = User.find(params[:id])
    @posts = Post.where(firm_name: "#{@personal.belonging}").limit(4)
    @posts_count = Post.where(firm_name: "#{@personal.belonging}").count

    like_firm = Like.where(user_id: params[:id])
    like_firm_up = like_firm.order(post_id: "ASC")
    #@firm = Post.where(id: like_firm.post_id)
    unless like_firm_up.blank?
      array_firm = []
      array_firm_name =[]

      like_firm_up.each do |a|
        array_firm.push(a.post_id)
      end
      firms = Post.where(id: array_firm)
      #3月10日突破　ここはまじで難しかった
      #firms = Post.where(id: like_firm_up.first.post_id..like_firm_up.last.post_id)
      @firm = firms.select(:firm_name).distinct
      
      # firm.each do |f|
      #   array_firm_name.push(f.firm_name)
      # end
      # @firm = User.where(belonging: "#{array_firm_name}")

    end
    #@firms = Post.all.order(created_at: :desc).limit(3)
    #@firm = firms.distinct.pluck(:firm_name, :title)
    #@firm = Post.where(firm_name: "#{firms2}")
    #my = @posts.order(id: "ASC")

      my_array_firm = []
      like_array = []

      @posts.each do |post|
        my_array_firm.push(post.id)
      end

      my_post = Like.where(post_id: my_array_firm)

      #統計
      my_like = my_post.select(:user_id).distinct

      my_like.each do |like|
        like_array.push(like.user_id)
      end
      @like_user = User.where(id: like_array)

  end

  def edit
    @personal = User.find(params[:id])
  end

  def update

    @personal = User.find(params[:id])
    if @personal.update(user_params)
      redirect_to personal_path, notice: "更新されました"
    else
      render :edit
      flash[:alert] = "保存できませんでした"
    end
  end

  def password_update
    @personal = User.find(params[:id])
    if cureent_user.name == @personal.name && cureent_user.belonging == @personal.belonging
      if @personal.update(user_password_params)
        redirect_to personal_path
      else
        flash.now[:danger] = "編集に失敗しました"
        render :edit
      end
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :belonging, :email, :firm_sambnail)
  end

end
