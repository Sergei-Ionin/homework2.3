-- Определить, сколько книг прочитал каждый читатель в текущем году

-- SELECT reader_id, COUNT(book_id) AS total_book FROM cardbook GROUP BY reader_id;

-- или

-- SELECT reader_fullname, COUNT(book_id) AS total_book

-- FROM cardbook

--     JOIN reader ON cardbook.reader_id = reader.reader_id

-- GROUP BY reader_fullname

-- Определить, сколько книг у читателей на руках на текущую дату

-- SELECT COUNT(book_id) FROM cardbook WHERE cardbook_off IS NULL

-- SELECT COUNT(book_id)

-- FROM cardbook

-- WHERE

--     cardbook.cardbook_on < current_date

--     AND cardbook_off IS NULL