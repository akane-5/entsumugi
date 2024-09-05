crumb :root do
  link 'Home', root_path
end

crumb :user_registration_new do
  link 'ユーザー登録'
  parent :root
end

crumb :user_session_new do
  link 'ログイン'
  parent :root
end

crumb :terms_of_service do
  link '利用規約'
  parent :root
end

crumb :privacy_policy do
  link 'プライバシーポリシー'
  parent :root
end

crumb :shrines_search do
  link '検索',  search_shrines_path
  parent :root
end

crumb :shrines_index do
  link '検索一覧',  shrines_path
  parent :shrines_search
end

crumb :shrines_show do |shrine|
  link "#{shrine.name}"
  parent :shrines_index
end

crumb :users_show do
  link 'マイページ',  users_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).