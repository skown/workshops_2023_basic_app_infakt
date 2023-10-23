class UserMailer < ApplicationMailer
    def loan_created_email(book_loan)
        @title = book_loan.book.title
        @loan_date = book_loan.created_at

        mail(to: book_loan.user.email, subject: @email_subject)
    end

    def due_date(book_loan)
        @title = book_loan.book.title
        @loan_date = book_loan.created_at

        mail(to: book_loan.user.email, subject: @email_subject_due)
    end

end