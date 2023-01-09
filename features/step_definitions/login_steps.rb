Quando("eu faço login como {string} e {string}") do |email, password|
visit "/"
find("#emailId").set email
find("#passId").set password
click_button "Entrar"
end
  
Então("devo ser autenticado") do
js_script = 'return window.localStorage.getItem("default_auth_token");'
token = page.execute_script(js_script)
expect(token.length).to be 147
puts token
end
  
Então("devo ver {string} na área logada") do |expect_name|
    expect(page).to have_text expect_name

    user_xpath = find(:xpath, ".//span[contains(.,'#{expect_name}')]")
    user_css = find('.sidebar-wrapper .user .info span')

    expect(user_xpath.text).to  eql expect_name
    expect(user_css.text).to  eql expect_name
end


Então("não devo ser autenticado") do
    js_script = 'return window.localStorage.getItem("default_auth_token");'
    token = page.execute_script(js_script)
    expect(token).to be nil
end
  
Então("devo ver a mensagem {string}") do |expect_mensagem|
    alert_xpath = find(:xpath, ".//div[contains(@class,'alert')]")
    alert_css = find('.alert')
    expect(alert_xpath.text).to eql expect_mensagem  
    expect(alert_css.text).to eql expect_mensagem  
end