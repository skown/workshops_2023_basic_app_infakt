module Publishers
    class LoanBookPublisher < Application
        
        def initialize(message)
            @message = message
        end

        def publish
            ::Publishers::Application.new(
              routing_key: 'basic_app.book_loans',
              exchange_name: 'basic_app',
              message: @message
            ).perform
        end
    end
end