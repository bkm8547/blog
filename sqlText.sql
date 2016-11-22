create table blog_news(no int not null primary key auto_increment,
				title varchar(200) not null,
				imageUrl varchar(200),
				content text,
				writer varchar(30) not null,
				password varchar(50) not null,
				wdate datetime not null default now()				
)default charset=utf8

alter table blog_news add column recommand int not null default 0;

drop table blog_news;

insert into blog_news(title,content,writer,password) values('1234','1234','1234','1234')

select * from blog_news;

delete from blog_news;

insert into user_ip values('1234',default,12);

select * from user_ip;