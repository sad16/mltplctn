class MultiplicationWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :multiplication, :retry => true

  def perform(multiplication_id)
    Multiplication.find(multiplication_id).start
  end
end
