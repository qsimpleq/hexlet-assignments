class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start_time = Time.now
    status, headers, response = @app.call(env)
    end_time = Time.now
    execution_time = end_time - start_time

    headers['X-Execution-Time'] = execution_time.to_s

    [status, headers, response]
    # END
  end
end
