- [README](#readme)
  - [Setup](#setup)
      - [Initial Setup](#initial-setup)
      - [Spec Harness Setup](#spec-harness-setup)
  - [Endpoints](#endpoints)
    - [Record Endpoints](#record-endpoints)
      - [Merchants](#merchants)
      - [Transactions](#transactions)
      - [Customers](#customers)
      - [Invoices](#invoices)
      - [Items](#items)
      - [Invoice Items](#invoice-items)
    - [Business Intelligence Endpoints](#business-intelligence-endpoints)
      - [Merchants](#merchants-1)
      - [Items](#items-1)



# README

Welcome to Rails Engine! This is a project for Turing Backend Mod 3 class where we build an internal sales engine API using ruby on rails: [docs here](http://backend.turing.io/module3/projects/rails_engine#technical-expectations)

It was built by [Tim Joo](https://github.com/Tyjoo26) & [Max Stackhouse](https://github.com/Maxscores)

Feel free to clone down the repo and give things a try.
You can also [access the api](http://rales-engine-1710.herokuapp.com/) through herokuapp

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [README](#readme)
  - [Setup](#setup)
      - [Initial Setup](#initial-setup)
      - [Spec Harness Setup](#spec-harness-setup)
  - [Endpoints](#endpoints)
    - [Record Endpoints](#record-endpoints)
      - [Merchants](#merchants)
      - [Transactions](#transactions)
      - [Customers](#customers)
      - [Invoices](#invoices)
      - [Items](#items)
      - [Invoice Items](#invoice-items)
    - [Business Intelligence Endpoints](#business-intelligence-endpoints)
      - [Merchants](#merchants-1)
      - [Items](#items-1)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Setup
You'll need [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [bundler](http://bundler.io/).
### Spec Harness
Initial setup must be done prior to running the [spec harness](https://github.com/Maxscores/rales_engine_spec_harness).
Run these commands in terminal:
```
git clone https://github.com/Maxscores/rales_engine_spec_harness.git
cd rales_engine_spec_harness
bundle
export BASE_URL=http://rales-engine-1710.herokuapp.com
```
Run the tests with `bundle exec rake`

### Local Setup
To run our test suite:
```
git clone https://github.com/Tyjoo26/rales_engine.git
bundle
rails db:create db:migrate
rspec
```


## Endpoints
### Record Endpoints
#### Merchants
* Return all merchants `GET /api/v1/merchants`
```
[
  {
    "id": 1,
    "name": "Schroeder-Jerde"
  },
  {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]
```
* Return specific merchant `GET /api/v1/merchants/:id`
```
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}
```

Search Field | Example Parameter
--- | ---
merchant id | id=27
name | name=Merchant
created at | created_at="2012-03-27T14:56:04.000Z"
updated at | updated_at="2012-03-27T14:56:04.000Z"

* Return first merchant by field `GET /api/v1/merchants/find?parameter`
```
{
  "id": 2,
  "name": "Klein, Rempel and Jones"
}
```

* Return all merchant by field `GET /api/v1/merchant/find?parameter`
```
[
  {
    "id": 2,
    "name": "Klein, Rempel and Jones"
  }
]
```

* Return all items for specific merchant `GET /api/v1/merchants/:id/items`
```
[
  {
    "id": 53,
    "name": "Item Sunt Nesciunt",
    "description": "Magni eos cupiditate animi. Ea consequatur saepe quo earum. In magni dolorem maxime tempora. Inventore iure ad delectus quo neque voluptates. Optio repellat occaecati.",
    "unit_price": "711.98",
    "merchant_id": 2
  },
  {
    "id": 52,
    "name": "Item Sit Facere",
    "description": "Vero libero laboriosam qui expedita dignissimos. Deserunt aliquam et aut accusamus aut iure natus. Qui eveniet quidem. Et praesentium quos doloremque quidem aut ab. Eius doloribus aut nisi.",
    "unit_price": "856.42",
    "merchant_id": 2
  }
]
```

* Return all invoices for specific merchant `GET /api/v1/merchants/:id/invoices`
```
[
  {
    "id": 45,
    "customer_id": 10,
    "merchant_id": 2,
    "status": "shipped"
  },
  {
    "id": 77,
    "customer_id": 16,
    "merchant_id": 2,
    "status": "shipped"
  }
]
```

#### Transactions
* Return all transactions `GET /api/v1/transactions`
```
[
  {
    "id": 1,
    "credit_card_number": "4654405418249632",
    "invoice_id": 1,
    "result": "success"
  },
  {
    "id": 2,
    "credit_card_number": "4580251236515201",
    "invoice_id": 2,
    "result": "success"
  }
]
```
* Return specific transaction `GET /api/v1/transactions/:id`
```
{
  "id": 4,
  "credit_card_number": "4515551623735607",
  "invoice_id": 5,
  "result": "success"
}
```

Search Field | Example Parameter
--- | ---
transaction id | id=27
invoice id | invoice_id=2
result | result=success or result=failed
credit card number | credit_card_number=4515551623735607
created at | created_at="2012-03-27T14:56:04.000Z"
updated at | updated_at="2012-03-27T14:56:04.000Z"

* Return first transaction by field `GET /api/v1/transactions/find?parameter`
```
{
  "id": 4,
  "credit_card_number": "4515551623735607",
  "invoice_id": 5,
  "result": "success"
}
```

* Return all transactions by field `GET /api/v1/transactions/find?parameter`
```
[
  {
    "id": 1,
    "credit_card_number": "4654405418249632",
    "invoice_id": 1,
    "result": "success"
  },
  {
    "id": 2,
    "credit_card_number": "4580251236515201",
    "invoice_id": 2,
    "result": "success"
  }
]
```

* Return invoice for specific transaction `GET /api/v1/transactions/:id/invoice`
```
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```

#### Customers
* Return all customers `GET /api/v1/customers`
```
[
  {
    "id": 1,
    "first_name": "Joey",
    "last_name": "Ondricka"
  },
  {
    "id": 2,
    "first_name": "Cecelia",
    "last_name": "Osinski"
  }
]
```
* Return customer by id `GET /api/v1/customers/:id`
```
{
  "id": 5,
  "first_name": "Sylvester",
  "last_name": "Nader"
}
```

Search Field | Example Parameter
--- | ---
customer id | id=27
first name | first_name=Germaine
last name | last_name=Kirlin
created at | created_at="2012-03-27T14:56:04.000Z"
updated at | updated_at="2012-03-27T14:56:04.000Z"

* Find first customer by field `GET /api/v1/customers/find?parameter`
```
{
  "id": 3,
  "first_name": "Mariah",
  "last_name": "Toy"
}
```
* Find all customers by field `GET /api/v1/customers/find_all?parameter`
```
[
  {
    "id": 477,
    "first_name": "Josefina",
    "last_name": "Yost"
  },
  {
    "id": 478,
    "first_name": "Mafalda",
    "last_name": "Labadie"
  }
]
```
* Return all invoices for specific customer `GET /api/v1/customers/:id/invoices`
```
[
  {
    "id": 13,
    "customer_id": 3,
    "merchant_id": 34,
    "status": "shipped"
  },
  {
    "id": 12,
    "customer_id": 3,
    "merchant_id": 8,
    "status": "shipped"
  }
]
```
* Return all transactions for specific customer `GET /api/v1/customers/:id/invoices`
```
[
  {
    "id": 15,
    "credit_card_number": "4869639160798434",
    "invoice_id": 13,
    "result": "failed"
  },
  {
    "id": 13,
    "credit_card_number": "4536896898764278",
    "invoice_id": 12,
    "result": "success"
  }
]
```

#### Invoices
* Return all invoices `GET /api/v1/invoices`
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
* Return specific invoice by id `GET /api/v1/invoices/:id`
```
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```

Search Field | Example Parameter
--- | ---
invoice id | id=27
customer id | customer_id=24
merchant id | merchant_id=54
status | status=shipped
created at | created_at="2012-03-09T08:57:21.000Z"
updated at | updated_at="2012-03-09T08:57:21.000Z"

* Find first invoice by field `GET /api/v1/invoices/find?parameter`
```
{
  "id": 1,
  "customer_id": 1,
  "merchant_id": 26,
  "status": "shipped"
}
```
* Find all invoices by field `GET /api/v1/invoices/find_all?parameter`
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
* Return all items `GET /api/v1/items`
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
* Return specific item by id `GET /api/v1/items/:id`
```
{
  "id": 2,
  "name": "Item Autem Minima",
  "description": "Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.",
  "unit_price": "670.76",
  "merchant_id": 1
}
```

Search Field | Example Parameter
--- | ---
item id | id=27
name | name=Item Explicabo Ipsam
description | description=facilis
unit_price | unit_price=19.99
merchant id | merchant_id=54
created at | created_at="2012-03-09T08:57:21.000Z"
updated at | updated_at="2012-03-09T08:57:21.000Z"

* Find first item by field `GET /api/v1/items/find?parameter`
```
{
  "id": 201,
  "name": "Item Explicabo Ipsam",
  "description": "Est facilis sunt molestias nam praesentium aspernatur. Reiciendis tenetur culpa at repellat. Non illum nesciunt. Sed vel et odio sint. Nemo sequi minima inventore.",
  "unit_price": "774.09",
  "merchant_id": 10
}
```
* Find all items by field `GET /api/v1/items/find_all?parameter`
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
* Return all invoice items `GET /api/v1/invoice_items`
```
[
  {
    "id": 1,
    "item_id": 539,
    "invoice_id": 1,
    "quantity": 5,
    "unit_price": "136.35"
  },
  {
    "id": 2,
    "item_id": 528,
    "invoice_id": 1,
    "quantity": 9,
    "unit_price": "233.24"
  }
]
```
* Return specific invoice item by id `GET /api/v1/invoice_items/:id`
```
{
  "id": 2,
  "item_id": 528,
  "invoice_id": 1,
  "quantity": 9,
  "unit_price": "233.24"
}
```

Search Field | Example Parameter
--- | ---
invoice item id | id=27
item id | item_id=3
invoice id | invoice_id=2
quantity | quantity=54
unit_price | unit_price="19.99"
created at | created_at="2012-03-09T08:57:21.000Z"
updated at | updated_at="2012-03-09T08:57:21.000Z"

* Find first item by field `GET /api/v1/invoice_items/find?parameter`
```
{
  "id": 135,
  "item_id": 1,
  "invoice_id": 29,
  "quantity": 2,
  "unit_price": "751.07"
}
```
* Find all items by field `GET /api/v1/items/find_all?parameter`
```
[
  {
    "id": 135,
    "item_id": 1,
    "invoice_id": 29,
    "quantity": 2,
    "unit_price": "751.07"
  },
  {
    "id": 645,
    "item_id": 1,
    "invoice_id": 137,
    "quantity": 7,
    "unit_price": "751.07"
  }
]
```


### Business Intelligence Endpoints
#### Merchants
* Return top `X` Merchants ranked by total revenue `GET /api/v1/merchants/most_revenue?quantity=X`
```
[
  {
    "id": 14,
    "name": "Dicki-Bednar"
  },
  {
    "id": 89,
    "name": "Kassulke, O'Hara and Quitzon"
  }
]
```
* Return total revenue by date (YYYY-MM-DD) `GET /api/v1/merchants/revenue?date=x`
```
{
  "total_revenue": "2495397.37"
}
```
* Return a single Merchants favorite customer `GET /api/v1/merchants/:id/favorite_customer`
```
{
  "id": 988,
  "first_name": "Efren",
  "last_name": "Smith"
}
```


#### Items
* Return top `X` Items ranked by total_revenue `GET /api/v1/items/most_revenue?quantity=X`
```
[
  {
    "id": 227,
    "name": "Item Dicta Autem",
    "description": "Fugiat est ut eum impedit vel et. Deleniti quia debitis similique. Sint atque explicabo similique est. Iste fugit quis voluptas. Rerum ut harum sed fugiat eveniet ullam ut.",
    "unit_price": "853.19",
    "merchant_id": 14
  },
  {
    "id": 2174,
    "name": "Item Nam Magnam",
    "description": "Eligendi quibusdam eveniet temporibus sed ratione ut magnam. Sit alias et. Laborum dignissimos quos impedit excepturi molestiae.",
    "unit_price": "788.08",
    "merchant_id": 89
  }
]
```
