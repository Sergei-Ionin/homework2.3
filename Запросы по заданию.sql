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

-- Определить читателей, у которых на руках определенная книга.

-- select

--     reader_fullname,

--     book_name

-- from cardbook

--     join public.reader r on r.reader_id = cardbook.reader_id

--     join public.book b on b.book_id = cardbook.book_id

-- where book_name like 'BCCC'

-- Определите, какие книги на руках читателей.

-- select

--     reader_fullname,

--     book_name

-- from cardbook

--     join public.reader r on r.reader_id = cardbook.reader_id

--     join public.book b on b.book_id = cardbook.book_id

-- where cardbook_off is null

-- Вывести количество должников на текущую дату.

-- select

--     reader_fullname,

--     book_name

-- from cardbook

--     join public.reader r on r.reader_id = cardbook.reader_id

--     join public.book b on b.book_id = cardbook.book_id

-- where

--     cardbook_on + interval '14 day' < current_date

--     and cardbook_off is null

-- Книги какого издательства были самыми востребованными у читателей ? Отсортируйте издательства по убыванию востребованности книг

-- SELECT

--     count(cardbook.book_id) as total,

--     book_name,

--     isdat_name

-- from cardbook

--     JOIN public.book b ON b.book_id = cardbook.book_id

--     JOIN public.isdat i ON i.isdat_id = b.book_isdat

-- GROUP BY

--     cardbook.book_id,

--     book_name,

--     isdat_name

-- ORDER BY total DESC

-- Определить самого издаваемого автора.

-- select

--     author.author_fullname,

--     count(author.author_fullname) as total

-- FROM book

--     LEFT JOIN author_book ON book.book_id = author_book.book_id

--     LEFT JOIN author ON author_book.author_id = author.author_id

-- GROUP BY

--     author.author_fullname

-- ORDER BY total DESC

-- Определить среднее количество прочитанных страниц читателем за день.

-- SELECT

--     reader_fullname,

--     book_name,

--     book_list / avg( (

--             DATE_PART('day', cardbook.cardbook_off) - date_part('day', cardbook.cardbook_on)

--         )

--     ) AS total_day

-- FROM cardbook

--     JOIN public.book b ON b.book_id = cardbook.book_id

--     JOIN public.reader r ON r.reader_id = cardbook.reader_id

-- WHERE cardbook_off IS NOT NULL

-- GROUP BY

--     reader_fullname,

--     book_name,

--     book_list,

--     r.reader_id

-- ORDER BY r.reader_id

-- Про

-- Напишите sql запрос, который определяет, терял ли определенный читатель книги

-- SELECT

--     reader_fullname,

--     book_name

-- FROM lostbook

--     JOIN public.book b ON b.book_id = lostbook.book_id

--     JOIN public.reader r ON r.reader_id = lostbook.reader_id

-- При потере книг количество доступных книг фонда меняется.Напишите sql запрос на обновление соответствующей информации.

-- UPDATE book

-- SET

--     book_ex = book_ex - lostbook_col

-- FROM lostbook

-- WHERE book.book_id = lostbook.book_id

-- Определить сумму потерянных книг по каждому кварталу в течение года

-- SELECT sum(book_price)

-- FROM book

--     JOIN public.lostbook l ON book.book_id = l.book_id

-- WHERE

--     lostbook_data BETWEEN '2023-07-01' AND '2023-09-30'

-- Здесь не смог понять как сделать, подскажите пожалуста