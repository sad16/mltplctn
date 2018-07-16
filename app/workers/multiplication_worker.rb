class MultiplicationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :multiplication, retry: true

  def perform(multiplication_id)
    multiplication = Multiplication.find(multiplication_id)
    multiplication.start
  end
end
