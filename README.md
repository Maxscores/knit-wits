# README

## Basic Setup
* Clone the repo down to local machine.
* Navigate into project root directory.
* run `rails db:create db:migrate db:seed`
* run `rails server`
* open browser


## Seed File
Load data with:
`rails db:seed`

Create new Dataset with:
`ruby db/seed_runner.rb`

or specify number of users, orders and line items:
`ruby db/seed_runner.rb #_of_users #_of_orders #_of_line_items`

The seed_runner.rb file controls the number of users, orders and order_items. It utilizes the faker gem to create dummy data. To generate a new dataset of users, orders and order_items you need to run `ruby db/seed_runner.rb` from the root directory. The script can also be run to generate a dataset with a specified set of values `ruby db/seed_runner.rb #_of_users #_of_orders #_of_line_items`.

items.csv and categories.csv were items added to the webapp manually, then exported into a csv. The images for products are connected to images in assets/images/products. There are no generators for items, the need to be added through the web app.
