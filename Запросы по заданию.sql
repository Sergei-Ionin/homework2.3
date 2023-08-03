-- Определить, сколько книг прочитал каждый читатель в текущем году

-- SELECT reader_id, COUNT(book_id) AS total_book FROM cardbook GROUP BY reader_id;