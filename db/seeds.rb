Author.destroy_all
Book.destroy_all
ReaderBook.destroy_all
Reader.destroy_all

### Authors ###
a1 = Author.create(last_name: "McCarthy", first_name: "Cormac", gender: "Male", sexual_orientation: "Straight", race: "White", nationality: "American")
a2 = Author.create(last_name: "Han", first_name: "Kang", gender: "Female", sexual_orientation: "Unknown", race: "Korean", nationality: "South Korean")
a3 = Author.create(last_name: "Wilde", first_name: "Oscar", gender: "Male", sexual_orientation: "Gay", race: "White", nationality: "Irish")
a4 = Author.create(last_name: "Anders", first_name: "Charlie Jane", gender: "Trans Female", sexual_orientation: "Unknown", race: "White", nationality: "American")
a5 = Author.create(last_name: "Morrison", first_name: "Toni", gender: "Female", sexual_orientation: "Straight", race: "African American", nationality: "American")

### Books ###
b1 = Book.create(title: "No Country for Old Men", author_id: (Author.find_by(last_name: "McCarthy").id))
b2 = Book.create(title: "All the Pretty Horses", author_id: (Author.find_by(last_name: "McCarthy").id))
b3 = Book.create(title: "The Road", author_id: (Author.find_by(last_name: "McCarthy").id))
b4 = Book.create(title: "The Vegetarian", author_id: (Author.find_by(last_name: "Han").id))
b5 = Book.create(title: "The Picture of Dorian Gray", author_id: (Author.find_by(last_name: "Wilde").id))
b6 = Book.create(title: "The Importance of Being Earnest", author_id: (Author.find_by(last_name: "Wilde").id))
b7 = Book.create(title: "Salome", author_id: (Author.find_by(last_name: "Wilde").id))
b8 = Book.create(title: "All the Birds in the Sky", author_id: (Author.find_by(last_name: "Anders").id))
b9 = Book.create(title: "The City in the Middle of the Night", author_id: (Author.find_by(last_name: "Anders").id))
b10 = Book.create(title: "Beloved", author_id: (Author.find_by(last_name: "Morrison").id))
b11 = Book.create(title: "The Bluest Eye", author_id: (Author.find_by(last_name: "Morrison").id))
b12 = Book.create(title: "Song of Solomon", author_id: (Author.find_by(last_name: "Morrison").id))
b13 = Book.create(title: "Sula", author_id: (Author.find_by(last_name: "Morrison").id))

### Readers ###
r1 = Reader.create(name: "Genevieve")
r2 = Reader.create(name: "Grace")
r3 = Reader.create(name: "Catherine")
r4 = Reader.create(name: "Jaime")
r5 = Reader.create(name: "Leslie")

### ReaderBooks ###
rb1 = ReaderBook.create(reader_id: (Reader.find_by(name: "Genevieve")).id, book_id: (Book.find_by(title: "No Country for Old Men").id))
rb2 = ReaderBook.create(reader_id: (Reader.find_by(name: "Genevieve")).id, book_id: (Book.find_by(title: "The Vegetarian").id))
rb3 = ReaderBook.create(reader_id: (Reader.find_by(name: "Genevieve")).id, book_id: (Book.find_by(title: "The Picture of Dorian Gray").id))
rb4 = ReaderBook.create(reader_id: (Reader.find_by(name: "Genevieve")).id, book_id: (Book.find_by(title: "All the Birds in the Sky").id))
rb5 = ReaderBook.create(reader_id: (Reader.find_by(name: "Grace")).id, book_id: (Book.find_by(title: "No Country for Old Men").id))
rb6 = ReaderBook.create(reader_id: (Reader.find_by(name: "Grace")).id, book_id: (Book.find_by(title: "The City in the Middle of the Night").id))
rb7 = ReaderBook.create(reader_id: (Reader.find_by(name: "Grace")).id, book_id: (Book.find_by(title: "Beloved").id))
rb8 = ReaderBook.create(reader_id: (Reader.find_by(name: "Grace")).id, book_id: (Book.find_by(title: "Song of Solomon").id))
rb9 = ReaderBook.create(reader_id: (Reader.find_by(name: "Catherine")).id, book_id: (Book.find_by(title: "All the Pretty Horses").id))
rb10 = ReaderBook.create(reader_id: (Reader.find_by(name: "Catherine")).id, book_id: (Book.find_by(title: "The Importance of Being Earnest").id))
rb11 = ReaderBook.create(reader_id: (Reader.find_by(name: "Catherine")).id, book_id: (Book.find_by(title: "Beloved").id))
rb12 = ReaderBook.create(reader_id: (Reader.find_by(name: "Catherine")).id, book_id: (Book.find_by(title: "Song of Solomon").id))
rb13 = ReaderBook.create(reader_id: (Reader.find_by(name: "Jaime")).id, book_id: (Book.find_by(title: "The Road").id))
rb14 = ReaderBook.create(reader_id: (Reader.find_by(name: "Jaime")).id, book_id: (Book.find_by(title: "Salome").id))
rb15 = ReaderBook.create(reader_id: (Reader.find_by(name: "Jaime")).id, book_id: (Book.find_by(title: "The Bluest Eye").id))
rb16 = ReaderBook.create(reader_id: (Reader.find_by(name: "Jaime")).id, book_id: (Book.find_by(title: "Sula").id))
rb17 = ReaderBook.create(reader_id: (Reader.find_by(name: "Leslie")).id, book_id: (Book.find_by(title: "The Vegetarian").id))
rb18 = ReaderBook.create(reader_id: (Reader.find_by(name: "Leslie")).id, book_id: (Book.find_by(title: "The Picture of Dorian Gray").id))
rb19 = ReaderBook.create(reader_id: (Reader.find_by(name: "Leslie")).id, book_id: (Book.find_by(title: "All the Birds in the Sky").id))
rb20 = ReaderBook.create(reader_id: (Reader.find_by(name: "Leslie")).id, book_id: (Book.find_by(title: "Sula").id))