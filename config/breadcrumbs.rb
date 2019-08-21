crumb :root do
  link "Home", root_path
end

crumb :new_log do|new_log|
  link "新規投稿", new_log_path
  parent :root
end

crumb :new_log do|new_log|
  link "新規投稿", new_log_path
  parent :root
end