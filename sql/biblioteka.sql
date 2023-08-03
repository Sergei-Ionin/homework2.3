create table
    if not exists public.reader (
        reader_id integer not null constraint reader_pk primary key,
        reader_fullname varchar not null,
        reader_adress varchar not null,
        reader_phone varchar
    );

alter table public.reader owner to postgres;

create table
    if not exists public.author (
        author_id integer not null constraint author_pk primary key,
        author_fullname varchar not null
    );

alter table public.author owner to postgres;

create table
    if not exists public.isdat (
        isdat_id integer not null constraint isdat_pk primary key,
        isdat_name varchar not null,
        isdat_city varchar not null
    );

alter table public.isdat owner to postgres;

create table
    if not exists public.book (
        book_id integer not null constraint book_pk primary key,
        book_name varchar not null,
        book_list numeric not null,
        book_ex numeric not null,
        book_price numeric not null,
        book_date date not null,
        book_isdat integer not null constraint book_isdat_isdat_id_fk references public.isdat
    );

alter table public.book owner to postgres;

create table
    if not exists public.cardbook (
        cardbook_id integer not null constraint cardbook_pk primary key,
        reader_id integer not null constraint cardbook_reader_reader_id_fk references public.reader,
        book_id integer not null constraint cardbook_book_book_id_fk references public.book,
        cardbook_on date not null,
        cardbook_off date
    );

alter table public.cardbook owner to postgres;

CREATE TABLE
    IF NOT EXISTS public.author_book (
        author_id integer NOT NULL CONSTRAINT author_book_author_author_id_fk REFERENCES public.author,
        book_id integer NOT NULL CONSTRAINT author_book_book_book_id_fk REFERENCES public.book,
        ab_id bigserial CONSTRAINT author_book_pk PRIMARY KEY,
        CONSTRAINT author_book_pk2 UNIQUE (book_id, author_id)
    );

ALTER TABLE public.author_book OWNER TO postgres;

alter table public.author_book owner to postgres;

create table
    if not exists public.lostbook (
        lostbook_id integer not null constraint lostbook_pk primary key,
        reader_id integer not null constraint lostbook_reader_reader_id_fk references public.reader,
        book_id integer not null constraint lostbook_book_book_id_fk references public.book,
        lostbook_data date not null,
        lostbook_col numeric not null
    );

alter table public.lostbook owner to postgres;

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (1, 'AF1');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (2, 'AF2');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (3, 'AF3');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (4, 'AF4');

INSERT INTO
    public.author (author_id, author_fullname)
VALUES (5, 'AF5');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (1, 'Red', 'Moscow');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (2, 'Star', 'New York');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (3, 'Green', 'Dallas');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (4, 'Gray', 'Tula');

INSERT INTO
    public.isdat (
        isdat_id,
        isdat_name,
        isdat_city
    )
VALUES (5, 'Moon', 'Berlin');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (1, 'RAAA', 'A001', '1001');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (2, 'RBBB', 'A002', '1002');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (3, 'RCCC', 'A003', '1003');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (4, 'REEE', 'A004', '1004');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (5, 'RDDD', 'A005', '1005');

INSERT INTO
    public.reader (
        reader_id,
        reader_fullname,
        reader_adress,
        reader_phone
    )
VALUES (6, 'RFFF', 'A006', null);

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        1,
        'BAAA',
        '100',
        5,
        200,
        '2016-07-08',
        1
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        2,
        'BBBB',
        '300',
        5,
        400,
        '2017-07-25',
        2
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        3,
        'BCCC',
        '500',
        5,
        400,
        '2015-07-09',
        3
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        4,
        'BEEE',
        '500',
        5,
        600,
        '2011-07-08',
        4
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        5,
        'BDDD',
        '800',
        5,
        800,
        '2007-07-06',
        5
    );

INSERT INTO
    public.book (
        book_id,
        book_name,
        book_list,
        book_ex,
        book_price,
        book_date,
        book_isdat
    )
VALUES (
        6,
        'BFFF',
        '1000',
        5,
        1000,
        '2018-07-19',
        2
    );

INSERT INTO public.author_book (author_id, book_id) VALUES (1, 2);

INSERT INTO public.author_book (author_id, book_id) VALUES (2, 1);

INSERT INTO public.author_book (author_id, book_id) VALUES (3, 3);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 6);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 5);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 1);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 2);

INSERT INTO public.author_book (author_id, book_id) VALUES (5, 3);

INSERT INTO public.author_book (author_id, book_id) VALUES (4, 3);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        1,
        2,
        1,
        '2023-07-01',
        '2023-07-08'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (2, 2, 3, '2023-07-02', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        3,
        3,
        2,
        '2023-07-03',
        '2023-07-09'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (4, 3, 4, '2023-07-04', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        5,
        3,
        6,
        '2023-07-05',
        '2023-07-13'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        6,
        3,
        5,
        '2023-07-06',
        '2023-07-20'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (7, 4, 1, '2023-07-07', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        8,
        5,
        3,
        '2023-07-08',
        '2023-07-21'
    );

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (9, 5, 4, '2023-07-09', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (10, 6, 2, '2023-07-10', null);

INSERT INTO
    public.cardbook (
        cardbook_id,
        reader_id,
        book_id,
        cardbook_on,
        cardbook_off
    )
VALUES (
        11,
        1,
        2,
        '2022-08-06',
        '2022-08-31'
    );

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (1, 2, 1, '2023-07-25', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (2, 3, 2, '2023-07-26', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (3, 4, 3, '2023-07-27', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (4, 5, 4, '2023-07-28', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (5, 6, 5, '2023-07-29', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (6, 2, 6, '2023-07-27', 1);

INSERT INTO
    public.lostbook (
        lostbook_id,
        reader_id,
        book_id,
        lostbook_data,
        lostbook_col
    )
VALUES (7, 2, 2, '2023-07-25', 1);