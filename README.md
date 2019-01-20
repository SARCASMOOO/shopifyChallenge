# Shopify Challenge

Marketplace rails API for shopify job submission.
https://github.com/SARCASMOOO/shopifyChallenge

## Getting Started

Instructions to setup and run rails server api

* bundle install
* rails db:migrate
* rails db:seed
* rails test
* rails server

### Prerequisites

Rails installation is required

## Thought process and notes
In general I try to follow the red, green, refactor approach.

Following TDD we create tests which when run get red, wright implementation till test pass which give green, then refactor using the written test suite to catch regression.

I used table association to enforce relationships between cart, orders, and products

See the linked github repository for confirmation of TDD approach.

When working on a feature I will separate them into branches to avoid propagating
any potential errors.

## Running the tests

To run test suite type "rails test"

For running controller tests type "rails test:controllers"

For running model tests type "rails test:models"

For running integration tests type "rails test:integration"

### API Documentation
####     get "/order", params: {productName: productname, cartName: cartname, amount: #}
Add a given product to your shopping cart

####     get '/buy',  params: {cartName: cartname}
Purchase all products in your shopping cart

####     get "/purchase", params: {name: productname, amount: #}
To purchase one product directly simply put 1 in the amount

####     get "/product", params: {name: productname}
Retrieve product by name

####     get "/products", params: {option: true}
Retrieve all products with inventory

####     get "/products", params: {option: false}
Retrieve all products with or without inventory

####     post "/cart", params: {name: cartname}
Create a new cart


### Break down into integration tests
#### purchase flow tests
##### test "validate checkout total"
Check that buying items takes affect on products

##### test "check invalid purchases"
Try to make purchases such as a negative amount or nil then check no purchases took affect

##### test "check product inventory does not change before checking out"
Check adding to cart does not affect inventory until buying cart

##### test "Check that buying will change inventory"
Check that buying cart will affect products

### Break down into model tests
#### Cart Model tests
##### test "valid cart"
Test we can save a valid cart

##### test "carts should be unique"
Check that we can not have duplicate carts

##### test "check if we can add a cart without a name"
Check data validation on cart creation

##### test "check if name is too long"
Check data validation on cart creation

#### Product tests
##### test "valid product"
Test we can save a valid product

##### test "products should be unique"
Check that we can not have duplicate products

##### test "check if we can add a product with a negative price or zero"
Check cart data validation

##### test "check if we can add a product without a name, price, or quantity"
Check cart data validation

##### test "check if name is too long"
Check cart data validation

### Break down into controller tests
#### Cart controller tests
##### test "create a new cart"
Check creating cart works and takes affect

##### test "create a new cart with too long of a name "
Check Model validation from controller

#### Order controller tests
##### test "Add a valid item to order"
Check cart can add valid items

##### test "Add a invalid item to order"
Check cart can will not add an invalid order

##### test "Add a order which is out of stock"
Check cart will not add items which are out of stock

#### Product controller tests
##### test "purchase a product"
Check we can purchase a product directly ignoring carts

##### test "purchase too much of a product"
Check we can't purchase a product which does not have enough in stock

##### test "purchase a negative amount of a product"
Check data validation on controller

##### test "purchase a product which does not exist"
Check we can handle purchases which do not exist

##### test "select a specific product which exists"
Check we can grab a product which exists

##### test "select a specific product which does not exist"
Check we handle grabbing a product which does not exist

##### test "select all products which have inventory"
Check we can grab all products which have inventory

##### test "select all products" do
Check we can grab all products which do not have inventory

## Built With
* [Rails](https://rubyonrails.org/) - Web Framework
* [Repository](https://github.com/SARCASMOOO/shopifyChallenge) - Repository used for Shopify Challenge
* [Clone](git@github.com:SARCASMOOO/shopifyChallenge.git) - Clone link for Shopify Challenge

## Versioning

Used rails version 5.1.6.1

## Author

* **Steven Stapleton ** - [SARCASMOOO](https://github.com/SARCASMOOO)

## Acknowledgments

* Thank to puprplebooth for the readme template (https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
