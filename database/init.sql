CREATE TABLE IF NOT EXISTS user_mail_configuration_table
(
    id       uuid,
    mail     varchar,
    password varchar,
    host     varchar,
    port     int,
    primary key (id)
);

CREATE TABLE IF NOT EXISTS user_table
(
    id                    uuid         not null,
    login                 varchar(127) not null,
    password              varchar(127) not null,
    mail_configuration_id uuid,
    primary key (id),
    foreign key (mail_configuration_id)
        references user_mail_configuration_table,
    unique (id)
);

CREATE TABLE IF NOT EXISTS document_table
(
    id        uuid    not null,
    owner_id  uuid    not null,
    file_name varchar not null,
    file      bytea   not null,
    primary key (id),
    unique (id)
)