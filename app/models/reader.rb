class Reader < ApplicationRecord
    has_many :reader_books
    has_many :books, through: :reader_books

    validates :name, presence: true, uniqueness: true, length: {in: 2..15}, :format => { :with => /\A(?=.*[a-z])[a-z\d]+\Z/i }


    def self.alphabetical
        Reader.all.sort_by { |reader| reader.name }
    end

    def alpha_books
        reader.books.alphabetize
    end

    def authors
        self.books.map do |book|
            Author.find(book.author_id)
        end
    end

    # for each author.attributes.keys
    #     find all instances of key
    #     find uniq key

    # for each uniq key, do 
    #     uniq key.count / all_key.count
    
    # def tally_attributes
    #     tallies = Hash.new
    #     author.attributes.keys
    #         tallies[attribute] = tally(attribute)
    #     end
    #     return tallies
    # end

    # def tally(attribute)
    #     tally_ = Hash.new
    #     @user.authors.each do |author|
    #         # has the tally seen this before?
    #         # make a new entry with 1
    #         # otherwise increment
    #     end
    #     tally_
    # end
    # gender
    # sexual_orientation
    # race
    # nationality


end
