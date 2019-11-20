def log_in(user)
  visit new_session_path
  fill_in "Email",with: user.email
  fill_in "Password",with: user.password
  click_button 'Log in'
end

def create_task(user)
  log_in(user)
  visit new_task_path
  fill_in "タスク名",with: "test_01"
  fill_in "タスク内容",with: "test_01"
  fill_in "終了期限",with: "2019-11-14"
  select '高', from: '優先度'
  click_button '登録する'
end

def create_label(user)
  log_in(user)
  visit new_label_path
  fill_in "ラベル名", with: "test_label"
  click_button "ラベルを作成"
end
