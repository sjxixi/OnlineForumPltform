create table userinformation
(
    email       varchar(128)                               not null
        primary key,
    nickname    varchar(100) default '未设置昵称'          null,
    password    varchar(128)                               not null,
    type        int          default 0                     null,
    create_time datetime     default '1999-09-09 09:09:09' not null,
    phone       varchar(128)                               null
);

create table files
(
    Fno       varchar(128)                        not null
        primary key,
    filename  varchar(128) default '未命名'       null,
    file_info varchar(128) default '没有描述信息' null,
    file_time datetime                            null,
    email     varchar(128)                        null,
    constraint Files_Fno_uindex
        unique (Fno),
    constraint Files_UserInformation_email_fk
        foreign key (email) references userinformation (email)
);

create table issue
(
    Ino        varchar(128) not null
        primary key,
    email      varchar(128) not null,
    title      text         null,
    issue_time datetime     null,
    constraint Issue_Ino_uindex
        unique (Ino),
    constraint Issue_UserInformation_email_fk
        foreign key (email) references userinformation (email)
);

create table comment
(
    Cno          varchar(128)                           not null,
    Ino          varchar(128)                           not null,
    comment      text                                   null,
    comment_time datetime default '1999-09-09 09:09:09' not null,
    email        varchar(128)                           null,
    primary key (Cno, Ino),
    constraint Comment_Issue_Ino_fk
        foreign key (Ino) references issue (Ino),
    constraint Comment_UserInformation_email_fk
        foreign key (email) references userinformation (email)
);


