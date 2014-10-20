Notes
=========


Three separate pieces to our Sinatra app:

1. Models (data persistence, data logic, validation, associations)
2. Views (Take in variables (arrays or single instances of ActiveRecord objects usually) and produce final HTML response for the browser/request)
3. Actions (request & response. Use models to retreive/save data and then mash them with Views to generate the HTML)

Each has their own resp and shouldn't step on the others' tows.
