begin
    threads = []
    receiver = Communicator::Receiver.new
  
    threads << Thread.start do
      signals = receiver.receive
      message = receiver.get_message(signals)
      puts "receive: #{message}"
    end
  
    threads.each{|t| t.join }
  ensure
    receiver.disconnect
  end
  