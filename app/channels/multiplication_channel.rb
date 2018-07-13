class MultiplicationChannel < ApplicationCable::Channel

  def subscribed
    stream_from "multiplication:#{params[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end