# ui_test

For Headless capybara-webkit:


`brew install qt`
`brew linkapps qt`
After that `which qmake` should comes with (/usr/local/bin/qmake)

`bundle update` 


For Firefox:

https://github.com/mozilla/geckodriver/releases
export path to make geckodriver available 

For Chrome:

http://chromedriver.storage.googleapis.com/index.html
(I've downloaded 2.24 - it depends on which version of chrome browser you have installed)


To run tests:

`cucumber TEST_BROWSER=chrome` 
or `cucumber TEST_BROWSER=safari` 
or `cucumber` (dafult)
or `cucumber TEST_BROWSER=headless` 
