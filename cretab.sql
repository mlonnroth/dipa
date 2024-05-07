drop table POSITION;
drop table STATUS;
drop table BESOK_LOG;
drop table BESOK;
drop table TIDBOK_MATERIAL;
drop table TIDBOK_UTRUSTNING;
drop table TIDBOK_RUM;
drop table TIDBOK_PERSONAL;
drop table TIDBOKNING;
drop table BOKNINGSBAR_TID;
drop table VARDBEGARAN;
drop table PATIENT;
drop table MATERIAL;
drop table UTRUSTNING;
drop table RUM;
drop table PERSONAL;
drop table BESOK_TYP_MATERIAL_TYP;
drop table BESOK_TYP_UTRUSTNING_TYP;
drop table BESOK_TYP_RUM_TYP;
drop table BESOK_TYP_PERSONAL_TYP;
drop table BESOK_TYP_ENHET;
drop table BESOK_TYP;
drop table MATERIAL_TYP;
drop table UTRUSTNING_TYP;
drop table RUM_TYP;
drop table PERSONAL_TYP;
drop table ENHET;
drop table PLATS;
drop sequence idseq;

create sequence idseq;

create or replace table PLATS (
	id int not null,
	namn varchar(32),
	forvaltning varchar(64),
	beskr varchar(255),
	primary key (id)
);

insert into PLATS (id, namn) values (1, 'Angered närsjukhus');
insert into PLATS (id, namn) values (2, 'Högsbo närsjukhus');

create or replace table ENHET (
	id int not null,
	plats_id int,
	namn varchar(32) not null,
	beskr varchar(255),
	primary key (id)
);

insert into ENHET (id, namn, plats_id) values (1, 'Medicin', 1);
insert into ENHET (id, namn, plats_id) values (2, 'Lung', 1);
insert into ENHET (id, namn, plats_id) values (3, 'Psykiatri', 1);
insert into ENHET (id, namn, plats_id) values (4, 'Ortopedi', 1);
insert into ENHET (id, namn, plats_id) values (5, 'Kirurgi', 1);
insert into ENHET (id, namn, plats_id) values (6, 'Gynekologi', 1);
insert into ENHET (id, namn, plats_id) values (7, 'Medicin', 2);
insert into ENHET (id, namn, plats_id) values (8, 'Lung', 2);
insert into ENHET (id, namn, plats_id) values (9, 'Psykiatri', 2);
insert into ENHET (id, namn, plats_id) values (10, 'Ortopedi', 2);
insert into ENHET (id, namn, plats_id) values (11, 'Kirurgi', 2);
insert into ENHET (id, namn, plats_id) values (12, 'Gynekologi', 2);

create or replace table PERSONAL_TYP (
	id int not null,
	namn varchar(32) not null,
	primary key (id)
);

insert into PERSONAL_TYP (id, namn) values (1, 'Sjuksköterska');
insert into PERSONAL_TYP (id, namn) values (2, 'Läkare');
insert into PERSONAL_TYP (id, namn) values (3, 'Undersköterska');
insert into PERSONAL_TYP (id, namn) values (4, 'Kirurg');
insert into PERSONAL_TYP (id, namn) values (5, 'Anestesiläkare');
insert into PERSONAL_TYP (id, namn) values (6, 'Barnmorska');

create or replace table RUM_TYP (
	id int not null,
	namn varchar(32) not null,
	beskr varchar(255),
	primary key (id)
);

insert into RUM_TYP (id, namn) values (1, 'Vårdrum');
insert into RUM_TYP (id, namn) values (2, 'Träningssal');
insert into RUM_TYP (id, namn) values (3, 'Bassäng');

create or replace table UTRUSTNING_TYP (
	id int not null,
	namn varchar(32) not null,
	beskr varchar(255),
	primary key (id)
);

insert into UTRUSTNING_TYP (id, namn) values (1, 'EKG apparat');
insert into UTRUSTNING_TYP (id, namn) values (2, 'Ultraljudsapparat');
insert into UTRUSTNING_TYP (id, namn) values (3, 'Blodtrycksmätare');

create or replace table MATERIAL_TYP (
	id int not null,
	namn varchar(32) not null,
	beskr varchar(255),
	primary key (id)
);

insert into MATERIAL_TYP (id, namn) values (1, 'Handsprit');
insert into MATERIAL_TYP (id, namn) values (2, 'Hudsalva');

create or replace table BESOK_TYP (
	id int not null,
	namn varchar(32) not null,
	antal_patienter int,
	beskr varchar(255),
	primary key (id)
);

insert into BESOK_TYP (id, namn, antal_patienter) values (1, 'Mottagningsbesök', 1);
insert into BESOK_TYP (id, namn, antal_patienter) values (2, 'Teambesök', 1);
insert into BESOK_TYP (id, namn, antal_patienter) values (3, 'Gruppbesök', 4);
insert into BESOK_TYP (id, namn, antal_patienter) values (4, 'Provtagning', 1);
insert into BESOK_TYP (id, namn, antal_patienter) values (5, 'Bilddiagnostik', 1);

create or replace table BESOK_TYP_ENHET (
	id int not null,
	besok_typ_id int,
	enhet_id int,
	primary key (id),
	foreign key (besok_typ_id) references BESOK_TYP (id),
	foreign key (enhet_id) references ENHET (id)
);

insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (1, 1, 1);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (2, 1, 2);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (3, 1, 3);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (4, 1, 4);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (5, 1, 5);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (6, 1, 6);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (7, 1, 7);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (8, 1, 8);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (9, 1, 9);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (10, 1, 10);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (11, 1, 11);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (12, 1, 12);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (13, 2, 5);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (14, 2, 11);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (15, 3, 3);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (16, 3, 9);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (17, 4, 1);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (18, 4, 1);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (19, 5, 2);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (20, 5, 8);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (21, 5, 4);
insert into BESOK_TYP_ENHET (id, besok_typ_id, enhet_id) values (22, 5, 10);

create or replace table BESOK_TYP_PERSONAL_TYP (
	id int not null,
	besok_typ_id int,
	personal_typ_id int,
	primary key (id),
	foreign key (besok_typ_id) references BESOK_TYP (id)
);

insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (1, 1, 1);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (2, 1, 2);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (3, 2, 1);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (4, 2, 2);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (5, 3, 1);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (6, 4, 1);
insert into BESOK_TYP_PERSONAL_TYP (id, besok_typ_id, personal_typ_id) values (7, 5, 1);

create or replace table BESOK_TYP_RUM_TYP (
	id int not null,
	besok_typ_id int,
	rum_typ_id int,
	primary key (id),
	foreign key (rum_typ_id) references RUM_TYP (id)
);

insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (1, 1, 1);
insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (2, 2, 1);
insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (3, 3, 2);
insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (4, 3, 3);
insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (5, 4, 1);
insert into BESOK_TYP_RUM_TYP (id, besok_typ_id, rum_typ_id) values (6, 5, 1);

create or replace table BESOK_TYP_UTRUSTNING_TYP (
	id int not null,
	besok_typ_id int,
	utrustning_typ_id int,
	primary key (id),
	foreign key (utrustning_typ_id) references UTRUSTNING_TYP (id)
);

insert into BESOK_TYP_UTRUSTNING_TYP (id, besok_typ_id, utrustning_typ_id) values (1, 2, 3);
insert into BESOK_TYP_UTRUSTNING_TYP (id, besok_typ_id, utrustning_typ_id) values (2, 4, 1);
insert into BESOK_TYP_UTRUSTNING_TYP (id, besok_typ_id, utrustning_typ_id) values (3, 4, 3);
insert into BESOK_TYP_UTRUSTNING_TYP (id, besok_typ_id, utrustning_typ_id) values (4, 5, 2);

create or replace table BESOK_TYP_MATERIAL_TYP (
	id int not null,
	besok_typ_id int,
	material_typ_id int,
	primary key (id),
	foreign key (besok_typ_id) references PERSONAL_TYP (id)
);

insert into BESOK_TYP_MATERIAL_TYP (id, besok_typ_id, material_typ_id) values (1, 4, 1);
insert into BESOK_TYP_MATERIAL_TYP (id, besok_typ_id, material_typ_id) values (2, 4, 2);
insert into BESOK_TYP_MATERIAL_TYP (id, besok_typ_id, material_typ_id) values (3, 5, 2);

create or replace table PERSONAL (
	id int not null,
	personal_typ_id int,
	vgrid varchar(8) not null,
	fnamn varchar(64),
	enamn varchar(64),
	personnr varchar(13),
	telefonnr varchar(32),
	email varchar(64),
	primary key (id),
	foreign key (personal_typ_id) references PERSONAL_TYP (id)
);	

insert into PERSONAL (id, personal_typ_id, vgrid, fnamn, enamn, email)
values (1, 1, 'maglo5', 'Magnus', 'Lönnroth', 'magnus.lonnroth@vgregion.se');

insert into PERSONAL (id, personal_typ_id, vgrid, fnamn, enamn, email)
values (2, 2, 'mathu7', 'Mats', 'Hultman', 'mats.hultman@vgregion.se');

insert into PERSONAL (id, personal_typ_id, vgrid, fnamn, enamn, email)
values (3, 1, 'softo5', 'Sofie', 'Törnqvist', 'sofie.tornqvist@vgregion.se');

insert into PERSONAL (id, personal_typ_id, vgrid, fnamn, enamn, email)
values (4, 2, 'chrli64', 'Christer', 'Lindholm', 'christer.lindholm@vgregion.se');

insert into PERSONAL (id, personal_typ_id, vgrid, fnamn, enamn, email)
values (5, 5, 'terwi1', 'Terese', 'Wikman', 'terese.wikman@vgregion.se');

create or replace table RUM (
	id int not null,
	rum_typ_id int,
	rnamn varchar(64) not null,
	beskr varchar(255),
	primary key (id),
	foreign key (rum_typ_id) references RUM_TYP (id)
);	

insert into RUM (id, rum_typ_id, rnamn) values (1, 1, 'A1');
insert into RUM (id, rum_typ_id, rnamn) values (2, 1, 'A2');
insert into RUM (id, rum_typ_id, rnamn) values (3, 1, 'A3');
insert into RUM (id, rum_typ_id, rnamn) values (4, 2, 'B1');
insert into RUM (id, rum_typ_id, rnamn) values (5, 3, 'C1');

create or replace table UTRUSTNING (
	id int not null,
	utrustning_typ_id int,
	unamn varchar(64) not null,
	beskr varchar(255),
	asset_tag varchar(64),
	primary key (id),
	foreign key (utrustning_typ_id) references UTRUSTNING_TYP (id)
);	

insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (1, 1, 'Philips PageWriter TC20', 'W12345');
insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (2, 1, 'Philips PageWriter TC50', 'W12346');
insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (3, 1, 'GE MAC 5000', 'W12347');
insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (4, 2, 'Mindray DP-10', 'W12348');
insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (5, 3, 'Omron M7', 'W12349');
insert into UTRUSTNING (id, utrustning_typ_id, unamn, asset_tag) values (6, 3, 'Beurer BM 54', 'W12350');

create or replace table MATERIAL (
	id int not null,
	material_typ_id int,
	mnamn varchar(64) not null,
	beskr varchar(255),
	primary key (id),
	foreign key (material_typ_id) references MATERIAL_TYP(id)
);	

insert into MATERIAL (id, material_typ_id, mnamn) values (1, 1, 'Salubrin handsprit');
insert into MATERIAL (id, material_typ_id, mnamn) values (2, 1, 'DAX Alcogel 85');
insert into MATERIAL (id, material_typ_id, mnamn) values (3, 2, 'Idomin salva');

create or replace table PATIENT (
	id int not null,
	fnamn varchar(64) not null,
	enamn varchar(64) not null,
	personnr varchar(13) not null,
	telefonnr varchar(32),
	email varchar(64),
	primary key (id)
);	

insert into PATIENT (id, fnamn, enamn, personnr) values (1, 'Tim', 'Berners-Lee', '19111111-1116');
insert into PATIENT (id, fnamn, enamn, personnr) values (2, 'Sergey', 'Brin', '19222222-2222');
insert into PATIENT (id, fnamn, enamn, personnr) values (3, 'Larry', 'Page', '19330313-3338');
insert into PATIENT (id, fnamn, enamn, personnr) values (4, 'Mark', 'Zuckerberg', '19440414-4448');
insert into PATIENT (id, fnamn, enamn, personnr) values (5, 'Bill', 'Gates', '19550515-5555');
insert into PATIENT (id, fnamn, enamn, personnr) values (6, 'Grace', 'Hopper', '19660616-6665');
insert into PATIENT (id, fnamn, enamn, personnr) values (7, 'Radia', 'Joy Perlman', '19770717-7775');
insert into PATIENT (id, fnamn, enamn, personnr) values (8, 'Shafi', 'Goldwasser', '19880818-8885');
insert into PATIENT (id, fnamn, enamn, personnr) values (9, 'Barbara', 'Liskov', '19990919-9995');
insert into PATIENT (id, fnamn, enamn, personnr) values (10, 'Sophie', 'Wilson', '19101010-1010');

create or replace table VARDBEGARAN (
	id int not null,
	patient_id int,
	besok_typ_id int,
	bokad boolean,
	primary key (id),
	foreign key (patient_id) references PATIENT (id),
	foreign key (besok_typ_id) references BESOK_TYP (id)
);

insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(1, 1, 1, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(2, 2, 1, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(3, 3, 2, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(4, 4, 2, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(5, 5, 3, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(6, 6, 3, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(7, 7, 4, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(8, 8, 4, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(9, 9, 5, false);
insert into VARDBEGARAN (id, patient_id, besok_typ_id, bokad) values(10, 10, 5, false);

create or replace table BOKNINGSBAR_TID (
	id int not null,
	besok_typ_id int,
	tid datetime not null,
	minuter int not null,
	bokad boolean not null,
	primary key (id),
	foreign key (besok_typ_id) references BESOK_TYP (id)
);

insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (1, 1, '2024-09-02 10:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (2, 1, '2024-09-02 11:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (3, 1, '2024-09-03 10:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (4, 1, '2024-09-03 11:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (5, 1, '2024-09-04 10:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (6, 1, '2024-09-04 11:00', 30, false);

insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (7, 2, '2024-09-02 13:00', 40, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (8, 2, '2024-09-02 14:00', 40, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (9, 2, '2024-09-03 13:00', 40, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (10, 2, '2024-09-03 14:00', 40, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (11, 2, '2024-09-04 13:00', 40, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (12, 2, '2024-09-04 14:00', 40, false);

insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (13, 3, '2024-09-02 10:00', 60, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (14, 3, '2024-09-02 11:00', 60, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (15, 3, '2024-09-03 10:00', 60, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (16, 3, '2024-09-03 11:00', 60, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (17, 3, '2024-09-04 10:00', 60, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (18, 3, '2024-09-04 11:00', 60, false);

insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (19, 4, '2024-09-02 8:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (20, 4, '2024-09-02 9:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (21, 4, '2024-09-03 8:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (22, 4, '2024-09-03 9:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (23, 4, '2024-09-04 8:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (24, 4, '2024-09-04 9:00', 30, false);

insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (25, 5, '2024-09-02 15:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (26, 5, '2024-09-02 16:00', 30, true);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (27, 5, '2024-09-03 15:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (28, 5, '2024-09-03 16:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (29, 5, '2024-09-04 15:00', 30, false);
insert into BOKNINGSBAR_TID (id, besok_typ_id, tid, minuter, bokad) values (30, 5, '2024-09-04 16:00', 30, false);

create or replace table TIDBOKNING (
	id int not null,
	patient_id int,
	besok_typ_id int,
	bokningsbar_tid_id int,
	bokad_tid datetime,
	bokad_minuter int,
	primary key (id),
	foreign key (patient_id) references PATIENT (id),
	foreign key (besok_typ_id) references BESOK_TYP (id),
	foreign key (bokningsbar_tid_id) references BOKNINGSBAR_TID (id)
);

insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (1, 1, 1, 1);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (2, 2, 1, 2);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (3, 3, 2, 7);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (4, 4, 2, 8);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (5, 5, 3, 15);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (6, 6, 3, 14);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (7, 7, 4, 19);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (8, 8, 4, 20);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (9, 9, 5, 25);
insert into TIDBOKNING (id, patient_id, besok_typ_id, bokningsbar_tid_id) values (10, 10, 5, 26);

update TIDBOKNING t set t.bokad_tid = (select b.tid from BOKNINGSBAR_TID b where b.id = t.bokningsbar_tid_id);

create or replace table TIDBOK_PERSONAL (
	id int not null,
	tidbok_id int not null,
	personal_id int not null,
	primary key (id),
	foreign key (personal_id) references PERSONAL (id)
);

insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (1, 1, 1);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (2, 1, 2);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (3, 2, 3);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (4, 2, 4);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (5, 3, 1);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (6, 3, 2);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (7, 4, 3);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (8, 4, 4);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (9, 5, 1);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (10, 6, 2);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (11, 7, 1);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (12, 8, 2);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (13, 9, 1);
insert into TIDBOK_PERSONAL (id, tidbok_id, personal_id) values (14, 10, 2);

create or replace table TIDBOK_RUM (
	id int not null,
	tidbok_id int not null,
	rum_id int not null,
	primary key (id),
	foreign key (rum_id) references RUM (id)
);

create or replace table TIDBOK_UTRUSTNING (
	id int not null,
	tidbok_id int not null,
	utrustning_id int not null,
	primary key (id),
	foreign key (utrustning_id) references UTRUSTNING (id)
);

create or replace table TIDBOK_MATERIAL (
	id int not null,
	tidbok_id int not null,
	material_id int not null,
	primary key (id),
	foreign key (tidbok_id) references TIDBOKNING (id),
	foreign key (material_id) references MATERIAL (id)
);

create or replace table BESOK (
	id int not null,
	tidbok_id int,
	patient_id int,
	besok_typ_id int,
	primary key (id),
	foreign key (tidbok_id) references TIDBOKNING (id),
	foreign key (patient_id) references PATIENT (id),
	foreign key (besok_typ_id) references BESOK_TYP (id)
);
	
create or replace table BESOK_LOG (
	id int not null,
	besok_id int,
	aktivitet varchar(64) not null,
	start_tid datetime,
	slut_tid datetime,
	primary key (id),
	foreign key (besok_id) references BESOK (id)
);

create or replace table STATUS (
	id int not null,
	patient_id int,
	tid datetime,
	stext varchar(32),
	primary key (id),
	foreign key (patient_id) references PATIENT (id)
);

create or replace table POSITION (
	id int not null,
	patient_id int,
	tid datetime,
	ptext varchar(32),
	primary key (id),
	foreign key (patient_id) references PATIENT (id)
);
