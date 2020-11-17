class PostsController < ApplicationController
  
  def index 
    @posts = Post.all.order(id: "DESC")
  end

  #def new
  #end

  def create
    post = Post.create(content: params[:content], checked: false)
    render json: { post: post }
    #redirect_to action: :index
  end

  def checked
    #既読メモidが渡される設定、該当レコードを取得
    post = Post.find(params[:id])
    #既読ならば
    if post.checked
      #既読解除の為falseへ変更
      post.update(checked: false)
          #↑ActiveRecordのupdateで更新
    else
      #既読のためtrueへ変更
      post.update(checked: true)  
    end
    #更新後レコードを取得し直す
    item = Post.find(params[:id])
    #JSON形式でchecked.jsに返却
    render json: { post: item }
  end
end
