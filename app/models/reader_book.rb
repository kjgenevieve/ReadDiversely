class ReaderBook < ApplicationRecord
    belongs_to :reader
    belongs_to :book

    validates :reader_id, :book_id, presence: true


    def article_shift
        books = self.all
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

    def alphabetical
        self.article_shift.sort_by do |book|
            book.title
        end
    end

end
