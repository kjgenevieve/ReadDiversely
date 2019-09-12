class Book < ApplicationRecord
    belongs_to :author
    has_many :reader_books
    has_many :readers, through: :reader_books

    validates :title, presence: true
    validates :author_id, presence: true
    validate :author_id_exists

    def author_id_exists
        return false if Author.find_by_id(self.author_id).nil?
    end

    # Moves articles ("a," "an," and "the") to the end of a title, appending it with a comma; returns all objects with changed titles
    def self.article_shift
        books = Book.all
        books.each do |book|
            title_ary = book.title.split(" ")
            first_word = title_ary.first
            if first_word == "A" || first_word == "An" || first_word == "The"
                title_ary.shift
                new_title = title_ary.join(" ")
                new_title = new_title + ", " + first_word
                book.title = new_title
            end
        end
    end
    
    def self.alphabetical
        Book.article_shift.sort_by do |book|
            book.title
        end
    end
end