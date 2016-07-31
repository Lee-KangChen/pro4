class AddUserTable < ActiveRecord::Migration
# posts新增t.string :title；把connections的comment_id改為post_id
# 執行 $rake db:migrate 後SQLite有了
def change
 	create_table :users do |t|	# 用來記錄使用者的資料:一對多post,comment
 			# 命名規則？首字大小寫，要加S
    	t.string :name
    	t.string :phone
  	    t.integer :age
    	t.timestamps null: false	# 每個都要？yes
    end	# 每一個create_table都要有個end
 		# 空行才好分辨

 	create_table :posts do |t| # 用來記錄貼文的資料,1對多 comment
    	t.string :user_id
    	t.string :content
    	t.string :title
  	  t.timestamps null: false
  	end
    
    create_table :comments do |t|	# 用來記錄留言的資料,和Category多對多,so jontable
    	t.string :post_id
    	t.string :user_id
    	t.string :content
    	t.timestamps null: false
    end
    
    create_table :categories do |t|	# 用來記錄貼文"類別"的資料,和connection
    	t.string :title
    	t.timestamps null: false
    end

    create_table :connections do |t|	# jontable to Category and post
    	t.string :post_id   # 應該post_id.rb才對，在另一個檔裡改了
    	t.string :category_id
    	t.timestamps null: false
    end

  end
end
