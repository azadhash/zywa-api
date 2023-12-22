# Readme

## Approach
### Database Design approach
I used a simple approach to solve this problem.I created 5 tables 
- `cards` - to store the cards details `card_id`, `contact`, `status`.
after generating the card we can store the `card_id`,`contact` of the `user` and `status` of the card as `generated`.

- `pickups`- to store the pickup details `card_id`, `timestamp` to store the `pickup time`.

- `deliveries` - to store the delivery details `card_id`, `timestamp` to store the `delivery time`.

- `delivery_exceptions` - to store the delivery exceptions `card_id`, `timestamp` to store the `exception time` and `comment` to store the comment.

- `returneds` - to store the returned details `card_id`, `timestamp` to store the `return time`.


#### There is one to one relationship between `cards` and `pickups`, `returneds`,`deliveries` table and one to many relationship between `cards` and  `delivery_exceptions`.Because one card can have multiple delivery exceptions as we can try to deliver the card 2 times.I used seed to have basic data in the database for the `cards` table.

### API Design approach
#### I created two endpoints one is `get` request to `/update_csv` to update the csv files to the database which are in the `data` folder and another is `get` request to `/get_card_status` to get the card status details. `get_card_status` endpoint takes `card_id` and `contact` in body and returns the card status details. In the requst checking the `card_id` or `contact` is valid or not. If the `card_id` or `contact` is valid then it will qury the database and  return the card status details otherwise it will return the error message `card not found`.While uploading the csv files into the database I am also updating the `status` of the card in the `cards` table.

### Technology Stack
- Ruby on Rails
- Postgresql
- Docker
- Docker-compose
#### I used `Ruby on Rails` as a backend framework and `Postgresql` as a database. I used `Docker` and `Docker-compose` to containerize the application. I used `Ruby on Rails` as I have knowledge in this and it is easy for fast devolopment. I used `Postgresql` as it is a relational database and it is easy to maintain the data also opensource and easy to make rails application easily as its orm work only for relational databases.


### How to run the application
#### To run the application we need to have `docker` and `docker-compose` installed in the system.
- `cd zywa-api`
- `docker-compose up --build`
#### After running the above commands the application will be running on `localhost:3000`. 
- To update the csv files to the database we need to hit the endpoint `localhost:3000/update_csv` 

- To get the card status details we need to hit the endpoint `localhost:3000/get_card_status` with `card_id` or `contact` in body as json or form data both are text fields.

