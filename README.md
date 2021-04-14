# GeoTasks

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Working from terminal

```elixir
input:
curl -X POST http://localhost:4000/api/users/signup \
-H "Content-Type: application/json" -d '{"user": {"name": "nik", "role": "driver"}}'

output:
{"id":10,"name":"nik3","role":"driver","token":"eyJhbGciOi..."}
```

```elixir
Запрос разрешен для driver

input:
curl -X POST http://localhost:4000/api/tasks/11/assigned \
-H "authorization: Bearer eyJhbGci..."  \
-H "Content-Type: application/json -d '{}'"

output:
%{}
```

```elixir
Запрос запрещен для driver

input:
curl -X POST http://localhost:4000/api/tasks \
-H "authorization: Bearer eyJhbGci..."  \
-H "Content-Type: application/json -d '{}'"

output:
invalid_token
```

* Реализована авторизация
* Реализована система ролей
* ~~Все остальное~~
