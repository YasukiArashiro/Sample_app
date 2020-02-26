class TodolistsController < ApplicationController
	def new
  		@list = List.new
	end

	def create
        # ストロングパラメーターを使用
         list = List.new(list_params)
        # DBへ保存する
         list.save
        # 詳細画面へリダイレクト
        redirect_to todolist_path(list.id)
    end

    def index
    	@lists = List.all
        #allはデータベース内全てのデータを取り出す。
    end

    def show
    	@list = List.find(params[:id])
        #URLが/todolist/1の場合、params[:id] と記述すると、
        #id==1を取り出せます。id==1のデータをfindメソッドを利用して
        #データベースから取得し、@listへ格納します。
    end

    def edit
    	@list = List.find(params[:id])
    end

    def update
    	list = List.find(params[:id])
    	list.update(list_params)
    	redirect_to todolist_path(list.id)
    end

    def destroy
        list = List.find(params[:id])#データ(レコード)を１件取得
        list.destroy #データ(レコード)を削除
        redirect_to todolists_path #List一覧画面へリダイレクト
    end

    private

    def list_params
        params.require(:list).permit(:title, :body, :image)
    end
end
