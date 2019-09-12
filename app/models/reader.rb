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

    def reader_diversity
        div_hash = Author.diversity_hash
        
        ### Update Gender Values ###
        gender_ary = self.authors.map do |author|
            author.gender
        end

        gender_ary.each do |gender|
            if div_hash[:gender].keys.include? gender
                div_hash[:gender][gender] += 1
            else
                    puts "There's been an error in the reader_diversity method in reader.rb."
            end
        end

        ### Update SO Values ###
        so_ary = self.authors.map do |author|
            author.sexual_orientation
        end

        so_ary.each do |so|
            if div_hash[:sexual_orientation].keys.include? so
                div_hash[:sexual_orientation][so] += 1
            else
                    puts "There's been an error in the reader_diversity method in reader.rb."
            end
        end

        ### Update Race Values ###
        race_ary = self.authors.map do |author|
            author.race
        end

        race_ary.each do |race|
            if div_hash[:race].keys.include? race
                div_hash[:race][race] += 1
            else
                    puts "There's been an error in the reader_diversity method in reader.rb."
            end
        end

        ### Update Nationality Values ###
        nation_ary = self.authors.map do |author|
            author.nationality
        end

        nation_ary.each do |nation|
            if div_hash[:nationality].keys.include? nation
                div_hash[:nationality][nation] += 1
            else
                    puts "There's been an error in the reader_diversity method in reader.rb."
            end
        end
    
        return div_hash
    end

end
