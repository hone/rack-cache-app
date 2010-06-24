class NoVarnish
  def initialize(app)
    @app = app
  end

  def call(env)
    code, headers, response = @app.call(env)
    headers.delete('Cache-Control')
    [code, headers, response]
  end
end
