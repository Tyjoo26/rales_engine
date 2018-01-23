# README

Welcome to Rails Engine! This is a project for Turing Backend Mod 3 class where we build an internal sales engine API using ruby on rails: [docs here](http://backend.turing.io/module3/projects/rails_engine#technical-expectations)

It was built by [Tim Joo](https://github.com/Tyjoo26) & [Max Stackhouse](https://github.com/Maxscores)

Feel free to clone down the repo and give things a try.

## Setup
#### Initial Setup
* `git clone https://github.com/Tyjoo26/rales_engine.git` ((don't have git?)[https://git-scm.com/book/en/v2/Getting-Started-Installing-Git])
* `bundle` ((don't have bundler?)[http://bundler.io/])
* `rails db:create db:migrate` 
* `rails import_csv:load` (imports sample data)
* `rails server` (http://localhost:3000/)
* `rspec` To run our test suite

#### Spec Harness Setup
Initial setup must be done prior to running the [spec harness](https://github.com/turingschool/rales_engine_spec_harness). 
Follow these instructions:
* Boot the rails server in terminal (1): `rails server`
* In another terminal instance (2): `git clone https://github.com/turingschool/rales_engine_spec_harness.git`
* `cd rales_engine_spec_harness`
* `bundle`
* Run test squit: `rake`

## Endpoints
### Record Endpoints
#### Merchants

#### Transactions

#### Customers

#### Invoices
* Return all invoices `/api/v1/invoices`
```
[
  {
    "id": 1,
    "customer_id": 1,
    "merchant_id": 26,
    "status": "shipped"
  },
  {
    "id": 2,
    "customer_id": 1,
    "merchant_id": 75,
    "status": "shipped"
  }
]
```
* Return invoices by id `/api/v1/invoices/:id`
```
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```

Search Field | example parameter
--- | --- 
invoice id | id=27 
customer id | customer_id=24 
merchant id | merchant_id=54 
status | status=shipped 
created at | created_at="2012-03-09T08:57:21.000Z" 
updated at | updated_at="2012-03-09T08:57:21.000Z" 

* Find first invoices by field `/api/v1/invoices/find?parameter`
```
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```
* Find all invoices by field `/api/v1/invoices/find_all?parameter`
```
[
  {
    "id": 20,
    "customer_id": 4,
    "merchant_id": 10,
    "status": "shipped"
  },
  {
    "id": 161,
    "customer_id": 31,
    "merchant_id": 10,
    "status": "shipped"
  }
]
```


#### Items
* Return all items `/api/v1/items`
```
[
  {
    "id": 1,
    "name": "Item Qui Esse",
    "description": "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.",
    "unit_price": "751.07",
    "merchant_id": 1
  },
  {
    "id": 2,
    "name": "Item Autem Minima",
    "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
    "unit_price": "670.76",
    "merchant_id": 1
  }
]
```
* Return item by id `/api/v1/items/:id`
```
{
  "id": 2,
  "name": "Item Autem Minima",
  "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
  "unit_price": "670.76",
  "merchant_id": 1
}
```

Search Field | example parameter
--- | --- 
item id | id=27 
name | name="Item Explicabo Ipsam"
description | description="facilis"
unit_price | unit_price="19.99"
merchant id | merchant_id=54 
created at | created_at="2012-03-09T08:57:21.000Z" 
updated at | updated_at="2012-03-09T08:57:21.000Z" 

* Find first item by field `/api/v1/items/find?parameter`
```
{
  "id": 201,
  "name": "Item Explicabo Ipsam",
  "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
  "unit_price": "774.09",
  "merchant_id": 10
}
```
* Find all items by field `/api/v1/items/find_all?parameter`
```
[
  {
    "id": 201,
    "name": "Item Explicabo Ipsam",
    "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
    "unit_price": "774.09",
    "merchant_id": 10
  },
  {
    "id": 202,
    "name": "Item Molestias Molestiae",
    "description": "Doloremque qui recusandae modi unde. Vitae consequatur commodi recusandae sunt occaecati et. Autem vel sit quos voluptatem excepturi.",
    "unit_price": "814.97",
    "merchant_id": 10
  }
]
```


#### Invoice Items
