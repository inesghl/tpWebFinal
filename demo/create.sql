create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(255) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, academic_degrees varchar(255), contact_information varchar(255), department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_diploma varchar(255), last_name varchar(255), original_establishment varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, academic_degrees varchar(255), contact_information varchar(255), department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_diploma varchar(255), last_name varchar(255), original_establishment varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);
create table article (domaine_id bigint, id bigint not null auto_increment, doi varchar(255) not null, mots_cles varchar(255) not null, titre varchar(255) not null, primary key (id)) engine=InnoDB;
create table comment (article_id bigint not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, content varchar(255) not null, status varchar(255), primary key (id)) engine=InnoDB;
create table contribution (article_id bigint not null, date datetime(6), id bigint not null auto_increment, user_id bigint not null, lieu varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table domain (id bigint not null auto_increment, nom_domaine varchar(255) not null, primary key (id)) engine=InnoDB;
create table event (end_date datetime(6) not null, id bigint not null auto_increment, start_date datetime(6) not null, user_id bigint not null, description varchar(255) not null, event_type varchar(255), location varchar(255), status varchar(255), title varchar(255) not null, primary key (id)) engine=InnoDB;
create table event_participants (event_id bigint not null, user_id bigint not null) engine=InnoDB;
create table file (article_id bigint not null, file_size bigint, id bigint not null auto_increment, upload_date datetime(6) not null, user_id bigint not null, file_name varchar(255) not null, file_path varchar(255) not null, file_type varchar(255), primary key (id)) engine=InnoDB;
create table notification (is_read bit not null, creation_date datetime(6) not null, id bigint not null auto_increment, user_id bigint not null, message varchar(255) not null, redirect_url varchar(255), type varchar(255), primary key (id)) engine=InnoDB;
create table statistics (action_date datetime(6) not null, article_id bigint not null, id bigint not null auto_increment, user_id bigint, action_type varchar(20) not null, primary key (id)) engine=InnoDB;
create table user (employment_date datetime(6), id bigint not null auto_increment, dtype varchar(31) not null, department varchar(255), email varchar(255), first_name varchar(255), grade varchar(255), institution varchar(255), last_name varchar(255), password varchar(255), position varchar(255), role enum ('ADMIN','MODERATEUR','UTILISATEUR'), primary key (id)) engine=InnoDB;
alter table article add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);
alter table domain add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);
alter table article add constraint FKjub6abhhh492ypn3j2bi603px foreign key (domaine_id) references domain (id);
alter table comment add constraint FK5yx0uphgjc6ik6hb82kkw501y foreign key (article_id) references article (id);
alter table comment add constraint FK8kcum44fvpupyw6f5baccx25c foreign key (user_id) references user (id);
alter table contribution add constraint FKfcj6d0c7ide4w3yrnghyqwfru foreign key (article_id) references article (id);
alter table contribution add constraint FKl12pusqvyg876q8p3glvovwo8 foreign key (user_id) references user (id);
alter table event add constraint FKi8bsvlthqr8lngsyshiqsodak foreign key (user_id) references user (id);
alter table event_participants add constraint FKhryx6nw9yts41qqpbjmspvb4x foreign key (user_id) references user (id);
alter table event_participants add constraint FK5232w1ta0icpkemgsxyw8a976 foreign key (event_id) references event (id);
alter table file add constraint FKp3x58xt25ld3mrbi37ce04vg2 foreign key (article_id) references article (id);
alter table file add constraint FKinph5hu8ryc97hbs75ym9sm7t foreign key (user_id) references user (id);
alter table notification add constraint FKb0yvoep4h4k92ipon31wmdf7e foreign key (user_id) references user (id);
alter table statistics add constraint FKm2d4w8coxavlvrfd7ki6hqvsp foreign key (article_id) references article (id);
alter table statistics add constraint FK6f62k0fk8of8dux130d6ibc54 foreign key (user_id) references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);

    create table article (
        domaine_id bigint,
        id bigint not null auto_increment,
        doi varchar(255) not null,
        mots_cles varchar(255) not null,
        titre varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table comment (
        article_id bigint not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        content varchar(255) not null,
        status varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table contribution (
        article_id bigint not null,
        date datetime(6),
        id bigint not null auto_increment,
        user_id bigint not null,
        lieu varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table domain (
        id bigint not null auto_increment,
        nom_domaine varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event (
        end_date datetime(6) not null,
        id bigint not null auto_increment,
        start_date datetime(6) not null,
        user_id bigint not null,
        description varchar(255) not null,
        event_type varchar(255),
        location varchar(255),
        status varchar(255),
        title varchar(255) not null,
        primary key (id)
    ) engine=InnoDB;

    create table event_participants (
        event_id bigint not null,
        user_id bigint not null
    ) engine=InnoDB;

    create table file (
        article_id bigint not null,
        file_size bigint,
        id bigint not null auto_increment,
        upload_date datetime(6) not null,
        user_id bigint not null,
        file_name varchar(255) not null,
        file_path varchar(255) not null,
        file_type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table notification (
        is_read bit not null,
        creation_date datetime(6) not null,
        id bigint not null auto_increment,
        user_id bigint not null,
        message varchar(255) not null,
        redirect_url varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB;

    create table statistics (
        action_date datetime(6) not null,
        article_id bigint not null,
        id bigint not null auto_increment,
        user_id bigint,
        action_type varchar(20) not null,
        primary key (id)
    ) engine=InnoDB;

    create table user (
        employment_date datetime(6),
        id bigint not null auto_increment,
        dtype varchar(31) not null,
        department varchar(255),
        email varchar(255),
        first_name varchar(255),
        grade varchar(255),
        institution varchar(255),
        last_name varchar(255),
        password varchar(255),
        position varchar(255),
        role enum ('ADMIN','MODERATEUR','UTILISATEUR'),
        primary key (id)
    ) engine=InnoDB;

    alter table article 
       add constraint UK_qu91ioldkmw947nqals0qv1fs unique (doi);

    alter table domain 
       add constraint UK_ea1n0nkrvsocx95k7y6y78u74 unique (nom_domaine);

    alter table article 
       add constraint FKjub6abhhh492ypn3j2bi603px 
       foreign key (domaine_id) 
       references domain (id);

    alter table comment 
       add constraint FK5yx0uphgjc6ik6hb82kkw501y 
       foreign key (article_id) 
       references article (id);

    alter table comment 
       add constraint FK8kcum44fvpupyw6f5baccx25c 
       foreign key (user_id) 
       references user (id);

    alter table contribution 
       add constraint FKfcj6d0c7ide4w3yrnghyqwfru 
       foreign key (article_id) 
       references article (id);

    alter table contribution 
       add constraint FKl12pusqvyg876q8p3glvovwo8 
       foreign key (user_id) 
       references user (id);

    alter table event 
       add constraint FKi8bsvlthqr8lngsyshiqsodak 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FKhryx6nw9yts41qqpbjmspvb4x 
       foreign key (user_id) 
       references user (id);

    alter table event_participants 
       add constraint FK5232w1ta0icpkemgsxyw8a976 
       foreign key (event_id) 
       references event (id);

    alter table file 
       add constraint FKp3x58xt25ld3mrbi37ce04vg2 
       foreign key (article_id) 
       references article (id);

    alter table file 
       add constraint FKinph5hu8ryc97hbs75ym9sm7t 
       foreign key (user_id) 
       references user (id);

    alter table notification 
       add constraint FKb0yvoep4h4k92ipon31wmdf7e 
       foreign key (user_id) 
       references user (id);

    alter table statistics 
       add constraint FKm2d4w8coxavlvrfd7ki6hqvsp 
       foreign key (article_id) 
       references article (id);

    alter table statistics 
       add constraint FK6f62k0fk8of8dux130d6ibc54 
       foreign key (user_id) 
       references user (id);
