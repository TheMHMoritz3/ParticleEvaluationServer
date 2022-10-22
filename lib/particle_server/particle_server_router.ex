defmodule ParticleServer.ParticleServer.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger
  plug(Plug.Logger, log: :debug)

  plug(:match)

  plug(:dispatch)


  # Simple GET Request handler for path /
  get "/" do
      send_resp(conn, 200, "In the future will here be values and access to all evaluations displayed")
  end

  # Basic example to handle POST requests with a JSON body
  post "/post" do
    {:ok, body, conn} = read_body(conn)
    body = Poison.decode!(body)
    IO.inspect(body)
    send_resp(conn, 201, "created: #{get_in(body, ["message"])}")
  end

  get "/data" do
    send_resp(conn, 200, "In the future will here be values and access to all evaluations displayed")
  end
  # "Default" route that will get called when no other route is matched
  match _ do
    send_resp(conn, 404, "not found")
  end
end
