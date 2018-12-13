-- we don't know how to generate schema logistics_demo (class Schema) :(
create table if not exists courier_list
(
	id int auto_increment,
	courier_name varchar(10) not null,
	courier_other_info varchar(2) null,
	update_time timestamp default CURRENT_TIMESTAMP not null,
	create_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
	constraint courier_list_id_uindex
		unique (id)
)
comment 'list of couier'
;

alter table courier_list
	add primary key (id)
;

create table if not exists courier_role
(
	id int auto_increment,
	courier_id int not null,
	role_id int not null,
	update_time timestamp default CURRENT_TIMESTAMP not null,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	constraint courier_role_id_uindex
		unique (id)
)
comment 'each courier role list'
;

alter table courier_role
	add primary key (id)
;

create table if not exists goods_name
(
	id int auto_increment,
	goods_type int not null,
	goods_desc varchar(50) not null,
	sender_id int not null,
	sender_name varchar(10) not null,
	sender_path varchar(50) not null,
	receiver_id int not null,
	receiver_name varchar(10) not null,
	receiver_path varchar(50) not null,
	update_time timestamp default CURRENT_TIMESTAMP not null,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	constraint goods_name_id_uindex
		unique (id)
)
comment 'list of the goods'
;

alter table goods_name
	add primary key (id)
;

create table if not exists receiver_list
(
	id int auto_increment,
	receiver_name varchar(10) not null,
	home_path varchar(50) not null,
	goods_id int null,
	update_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	constraint receiver_list_goods_id_uindex
		unique (goods_id),
	constraint receiver_list_id_uindex
		unique (id)
)
comment 'The list of receiver.'
;

alter table receiver_list
	add primary key (id)
;

create table if not exists role_list
(
	id int auto_increment,
	role_type varchar(3) not null,
	role_desc varchar(30) not null,
	update_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	constraint role_list_id_uindex
		unique (id),
	constraint role_list_role_type_uindex
		unique (role_type)
)
comment 'list of the courier role'
;

alter table role_list
	add primary key (id)
;

create table if not exists sender_name
(
	id int auto_increment,
	sender_name varchar(10) not null,
	sender_path varchar(50) not null,
	goods_id int not null,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	update_time timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
	constraint sender_name_goods_id_uindex
		unique (goods_id),
	constraint sender_name_id_uindex
		unique (id)
)
comment 'The sender list'
;

alter table sender_name
	add primary key (id)
;

create table if not exists working_flow
(
	id int auto_increment,
	working_flow varchar(500) default 'waiting confirm' null,
	duty_sender int null,
	update_time timestamp default CURRENT_TIMESTAMP not null,
	create_time timestamp default CURRENT_TIMESTAMP not null,
	constraint working_flow_duty_sender_uindex
		unique (duty_sender),
	constraint working_flow_id_uindex
		unique (id)
)
comment 'goods working flow'
;

alter table working_flow
	add primary key (id)
;

