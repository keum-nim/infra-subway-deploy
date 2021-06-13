create table favorite (
    id bigint generated by default as identity,
    created_date timestamp,
    modified_date timestamp,
    member_id bigint,
    source_station_id bigint,
    target_station_id bigint,
    primary key (id)
);

create table line (
    id bigint generated by default as identity,
    created_date timestamp,
    modified_date timestamp,
    color varchar(255),
    name varchar(255),
    primary key (id)
);

create table member (
    id bigint generated by default as identity,
    created_date timestamp,
    modified_date timestamp,
    age integer,
    email varchar(255),
    password varchar(255),
    primary key (id)
);

create table section (
    id bigint generated by default as identity,
    distance integer not null,
    down_station_id bigint,
    line_id bigint,
    up_station_id bigint,
    primary key (id)
);

create table station (
    id bigint generated by default as identity,
    created_date timestamp,
    modified_date timestamp,
    name varchar(255),
    primary key (id)
);

alter table line add constraint line_uk_name unique (name);

alter table station add constraint station_uk_name unique (name);

alter table section add constraint section_fk_up_station foreign key (up_station_id) references station;
alter table section add constraint section_fk_down_station foreign key (down_station_id) references station;
alter table section add constraint section_fk_line foreign key (line_id) references line;
