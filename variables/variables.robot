*** Variables ***
${url}    https://the-internet.herokuapp.com/
${BROWSER}    chrome
${BROWSER_VERSION}    stable
${headless}    ${False}
${menu_add_remove_elements}    //a[text()='Add/Remove Elements']
${menu_basic_auth}    //a[text()='Basic Auth']
${menu_dropdown}    //a[text()='Dropdown']
${btn_add_element}    //button[text()='Add Element']
${btn_delete}    //button[text()='Delete']
${msg_authorized}    //p[contains(text(), 'Congratulations')]
${dropdown_select}    id:dropdown 
${API_URL}    https://rahulshettyacademy.com