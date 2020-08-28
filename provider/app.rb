require 'json'

class Application
  def call(env)
    if env['PATH_INFO'] == '/user'
      status  = 200
      headers = { "Content-Type" => "application/json" }
      body    = [{ user: { name: 'Agile', joined_at: Time.now, age: 10 } }.to_json, "\n"]
      [status, headers, body]
    else
      [200, { "Content-Type" => 'text/plain' }, ["Provider\n"]]
    end
  end
end