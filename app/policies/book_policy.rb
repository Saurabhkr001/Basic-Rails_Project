class BookPolicy < ApplicationPolicy


  def update?
    authorize @book # This uses BookPolicy

    if @book.update(book_params)
      user.admin? || record.user == user # Only an admin or the post owner can update
    end

  end

  class Scope < ApplicationPolicy::Scope

    def resolve
      if user.admin?
        scope.all # Admin sees all posts
      else
        scope.where(published: true) # Others see only published posts
      end
    end
  end
end
