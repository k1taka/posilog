crumb :root do
  link "Home", root_path
end

crumb :new_log do|new_log|
  link "新規投稿", new_log_path
  parent :root
end

crumb :new_store_session do|new_store_session|
  link "ストアログイン", new_store_session_path
  parent :root
end

crumb :new_store_registration do|new_store_registration|
  link "ストア新規登録", new_store_registration_path
  parent :root
end

crumb :edit_store_registration do|edit_store_registration|
  link "ストア登録個人情報エディット", edit_store_registration_path
  parent :root
end

crumb :new_user_session do|new_user_session|
  link "ユーザーログイン", new_user_session_path
  parent :root
end

crumb :new_user_registration do|new_user_registration|
  link "ユーザー新規登録", new_user_registration_path
  parent :root
end

crumb :edit_user_registration do|edit_user_registration|
  link "ユーザー登録個人情報エディット", edit_user_registration_path
  parent :root
end

crumb :new_log do|new_log|
  link "新規投稿", new_log_path
  parent :root
end

crumb :edit_log do|edit_log|
  link "投稿編集", edit_log_path
  parent :root
end

crumb :log do|log|
  log = Log.find(params[:id])
  link log.title, log_path
  parent :root
end

crumb :stores do|stores|
  link "サービス名", stores_path
  parent :root
end

crumb :store do|store|
  link "マイストア", store_path
  parent :root
end

crumb :new_store_cupon do|new_store_cupon|
  link "クーポン発行", new_store_cupon_path
  parent :root
end

crumb :edit_store do|edit_store|
  link "クーポン編集", edit_store_path
  parent :root
end

crumb :user do|user|
  link "マイページ", user_path
  parent :root
end

crumb :edit_user do|edit_user|
  link "マイページ編集", edit_user_path
  parent :root
end

