create extension if not exists "uuid-ossp"

create table carts (
	id uuid primary key default uuid_generate_v4(),
	created_at date not null,
	updated_at date not null
	)

create table cart_items (
  id uuid primary key default uuid_generate_v4(),
  cart_id uuid,
  product_id uuid,
	count integer,
	foreign key ("cart_id") references "carts" ("id")
)

insert into carts (created_at, updated_at) values
(NOW(), NOW()),
(NOW(), NOW())

insert into cart_items (cart_id, product_id, count) values
('5b52c812-70cb-4b30-9f8c-aeb8ba2f6244','f5750eb6-cd37-47ec-99e1-ed0e3e50f1ee', 2),
('5b52c812-70cb-4b30-9f8c-aeb8ba2f6244','76ae7532-8f5d-4ee7-8ffe-dfaf077925af', 4),
('5b52c812-70cb-4b30-9f8c-aeb8ba2f6244','2f3b3df9-401d-4bf0-a468-54d91dc9c282', 6),
('77760577-e58b-469d-8b46-64113ca2e17e','2f3b3df9-401d-4bf0-a468-54d91dc9c282', 8),
('77760577-e58b-469d-8b46-64113ca2e17e','94f369ee-91db-4423-814b-83e800e380e0', 10)

create table users (
  id uuid  primary key default uuid_generate_v4(),
  name text,
  email text,
  password text
)

create table orders (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid,
  cart_id uuid,
  payment jsonb,
  delivery jsonb,
  comments text,
  status text,
  total integer
  foreign key ("cart_id ") references "carts" ("id")
)
