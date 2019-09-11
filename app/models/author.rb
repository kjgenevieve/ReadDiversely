class Author < ApplicationRecord
    has_many :books

    validates :last_name, :first_name, :gender, :sexual_orientation, :race, :nationality, presence: true

    def self.by_last
        Author.all.sort_by { |author| author.last_name }
    end

    def name
        self.first_name + " " + self.last_name
    end

    def alpha_books
        Book.where(author_id: self.id).alphabetical
    end

end