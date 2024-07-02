*** Variables ***
${url}    https://the-internet.herokuapp.com/
${BROWSER}    chrome
${BROWSER_VERSION}    stable
${headless}    ${False}
${menu_add_remove_elements}    //a[text()='Add/Remove Elements']
${menu_dropdown}    //a[text()='Dropdown']
${menu_js_alert}    //a[text()='JavaScript Alerts']
${btn_add_element}    //button[text()='Add Element']
${btn_delete}    //button[text()='Delete']
${msg_authorized}    //p[contains(text(), 'Congratulations')]
${dropdown_select}    id:dropdown 
${API_URL}    https://rahulshettyacademy.com

${btn_js_alert}    //button[text()='Click for JS Alert']
${btn_js_confirm}    //button[text()='Click for JS Confirm']
${btn_js_prompt}    //button[text()='Click for JS Prompt']
${msg_result_locator}    id:result

${msg_js_alert}    I am a JS Alert
${msg_js_confirm}    I am a JS Confirm
${msg_js_prompt}    I am a JS prompt
${msg_success_click}    You successfully clicked an alert
${msg_clicked_ok}    You successfully clicked an alert
${msg_clicked}    You clicked:
${msg_entered}    You entered:


