class BookMailer < ApplicationMailer
  def book_published(book,user)
    @book = book
    @user = book.user

    mail(
      to: @user.email,
      # to: "saurabhskp1001@gmail.com",
      subject: "📚 Your book has been published!"
    )
  end
end
