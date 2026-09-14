-- Seed from Teacher Wise Timetable 2026-27 (26 July)
-- Clears prior sample data then loads parsed timetable
truncate table public.arrangements, public.absences, public.timetable_slots, public.teacher_subjects, public.teachers, public.subjects, public.class_sections, public.periods restart identity cascade;

insert into public.periods (id, name, sort_order, start_time, end_time) values ('25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'Period 1', 1, '08:00', '08:40');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('3adb6068-e346-574e-b450-4b2ea07142ea', 'Period 2', 2, '08:45', '09:25');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'Period 3', 3, '09:30', '10:10');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('d7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'Period 4', 4, '10:30', '11:10');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('c41de133-6c77-5ea1-bf8a-9358425af125', 'Period 5', 5, '11:15', '11:55');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'Period 6', 6, '12:00', '12:40');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('60670075-125e-5e56-8f49-12f920730ca2', 'Period 7', 7, '12:45', '13:25');
insert into public.periods (id, name, sort_order, start_time, end_time) values ('dd4fa2e3-46df-583c-8992-34748bdfb329', 'Period 8', 8, '13:30', '14:10');

insert into public.subjects (id, name, code) values ('7da94c20-6084-56ac-b7c5-8d7623ee9765', 'Arts', 'ARTS');
insert into public.subjects (id, name, code) values ('8a184480-9ac0-586b-a8cb-99f76aa375ae', 'B', 'B');
insert into public.subjects (id, name, code) values ('34de9069-8349-59c0-9ed4-cce3a295169c', 'Biology', 'BIOLOGY');
insert into public.subjects (id, name, code) values ('1f9f9452-47f2-5477-808f-56f86370410b', 'Chemistry', 'CHEMISTRY');
insert into public.subjects (id, name, code) values ('ab339ea9-cc9f-5409-be1c-d8246dca4f06', 'Circle Time', 'CIRCLETIME');
insert into public.subjects (id, name, code) values ('0d99f6ad-e506-52e1-859d-68cc6d2d69a3', 'Computer', 'COMPUTER');
insert into public.subjects (id, name, code) values ('dab0c79c-a2ff-5a5e-bcea-aef4da49164a', 'ECA/CCA/SRM', 'ECACCASRM');
insert into public.subjects (id, name, code) values ('4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'English', 'ENGLISH');
insert into public.subjects (id, name, code) values ('1e318371-a5de-5921-9012-859112da54e6', 'GK Project', 'GKPROJECT');
insert into public.subjects (id, name, code) values ('548c14be-c6b3-5607-b274-31ce9d59e7fa', 'General Knowledge', 'GENERALKNOWL');
insert into public.subjects (id, name, code) values ('2b06d138-a3d2-5c39-b107-a9eb8d878dd0', 'General Science', 'GENERALSCIEN');
insert into public.subjects (id, name, code) values ('16a2dcd2-d638-5a83-9c05-99e65b3c7575', 'Greetings', 'GREETINGS');
insert into public.subjects (id, name, code) values ('ada19497-bed5-559f-a620-6155fc16b72e', 'History/Geography', 'HISTORYGEOGR');
insert into public.subjects (id, name, code) values ('b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'Home Economics', 'HOMEECONOMIC');
insert into public.subjects (id, name, code) values ('d4ea68fe-9839-5735-bef3-8dba484e6c94', 'I', 'I');
insert into public.subjects (id, name, code) values ('10c07f93-d95b-5ac0-8d54-8d1ec394dd81', 'ISL+Nazra', 'ISLNAZRA');
insert into public.subjects (id, name, code) values ('181a1465-0b1b-54db-9011-f05d3233a734', 'ISL+TQ', 'ISLTQ');
insert into public.subjects (id, name, code) values ('56a643f3-fc23-5b63-b9b2-df975c061135', 'Islamiyat', 'ISLAMIYAT');
insert into public.subjects (id, name, code) values ('77e8c902-97d1-50d1-aeee-8ae148556d2b', 'Mathematics', 'MATHEMATICS');
insert into public.subjects (id, name, code) values ('5c3b6dd5-f4ec-5330-8ea7-7c37d3cc94fc', 'Mental Maths', 'MENTALMATHS');
insert into public.subjects (id, name, code) values ('aec9103a-752f-57ad-9768-cccf311476b5', 'Nazra', 'NAZRA');
insert into public.subjects (id, name, code) values ('dbf21572-facd-5f00-ae68-01a967596074', 'Pakistan Studies', 'PAKISTANSTUD');
insert into public.subjects (id, name, code) values ('381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', 'Physics', 'PHYSICS');
insert into public.subjects (id, name, code) values ('351260f0-b023-54e5-891b-1ff43f5f5e11', 'STEAM', 'STEAM');
insert into public.subjects (id, name, code) values ('6391d0cc-9da0-5b57-927c-77daeb89ec5c', 'Sc', 'SC');
insert into public.subjects (id, name, code) values ('5b00ab83-3221-567d-b94d-3f796b20d502', 'Social Studies', 'SOCIALSTUDIE');
insert into public.subjects (id, name, code) values ('49b9ffab-938e-5ece-ae96-211fd995c57e', 'Srm', 'SRM');
insert into public.subjects (id, name, code) values ('5730c87e-337d-598d-b7f7-610a901e1f70', 'Tarjuma Quran', 'TARJUMAQURAN');
insert into public.subjects (id, name, code) values ('1319d966-5598-5252-af73-99c08f6c037a', 'Urdu', 'URDU');
insert into public.subjects (id, name, code) values ('930f7254-efe1-550b-a1ba-9c678ae10b38', 'WAU', 'WAU');

insert into public.class_sections (id, name, grade) values ('366a83ee-fd67-5086-983f-c4303d0bfd90', '1', '1');
insert into public.class_sections (id, name, grade) values ('95f1cb76-b0b0-584a-a93e-191f863bd60f', '10A', '10');
insert into public.class_sections (id, name, grade) values ('18057905-1ce3-5abf-a2d2-c9b909346993', '10B', '10');
insert into public.class_sections (id, name, grade) values ('edd0eac5-1dab-5621-989e-ef6be55dcde4', '2', '2');
insert into public.class_sections (id, name, grade) values ('19d9c498-c44e-5299-b4df-84686bf3663e', '3', '3');
insert into public.class_sections (id, name, grade) values ('348b66e4-4dbc-58be-8697-a069635575d8', '4A', '4');
insert into public.class_sections (id, name, grade) values ('e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4B', '4');
insert into public.class_sections (id, name, grade) values ('22fbf4aa-5822-559f-b18b-609f2c6c6878', '5A', '5');
insert into public.class_sections (id, name, grade) values ('82e1e310-364d-55b2-9b15-f0959be83700', '5B', '5');
insert into public.class_sections (id, name, grade) values ('c5c288de-9e78-5a68-b10c-46c07476b0c5', '6A', '6');
insert into public.class_sections (id, name, grade) values ('5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6B', '6');
insert into public.class_sections (id, name, grade) values ('f027cd52-8ace-51ab-8995-0325d0cb7990', '7A', '7');
insert into public.class_sections (id, name, grade) values ('8383b335-4f87-525a-863e-3d8d72ce8033', '7B', '7');
insert into public.class_sections (id, name, grade) values ('20b4b07c-4518-5ed2-9c2d-4531ae919628', '8A', '8');
insert into public.class_sections (id, name, grade) values ('f2314410-4056-5d51-a49d-127a5ef7e952', '8B', '8');
insert into public.class_sections (id, name, grade) values ('b335b894-17a5-585e-ada7-2f057bd83b65', '9A', '9');
insert into public.class_sections (id, name, grade) values ('496297c1-6ab6-52a3-aeb5-e84642bb38df', '9B', '9');
insert into public.class_sections (id, name, grade) values ('1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'General', null);
insert into public.class_sections (id, name, grade) values ('961b736a-0309-5ed4-bdb5-26feaec73d2b', 'Nursery', null);
insert into public.class_sections (id, name, grade) values ('78db52ab-0b84-5df7-8f7a-63e21719adc2', 'Playgroup', null);
insert into public.class_sections (id, name, grade) values ('dc028c8d-2ea3-5324-95f5-e7a2ec903a02', 'Prep', null);

insert into public.teachers (id, name, email) values ('566a9fe8-2871-5b12-a693-cdf1a01f9978', 'Ms. Musarrat', null);
insert into public.teachers (id, name, email) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', 'Ms. Naila', null);
insert into public.teachers (id, name, email) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', 'Ms. Rohila', null);
insert into public.teachers (id, name, email) values ('81f7da22-a36d-517f-aa74-b940dbbf348d', 'Ms. Sajida Parveen', 'sajidaparveen43@gmail.com');
insert into public.teachers (id, name, email) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', 'Ms. Samina Mazhar', null);
insert into public.teachers (id, name, email) values ('666b3489-23b6-524b-9234-aa1f806e29bc', 'Ms. Fauzia Rehmat', null);
insert into public.teachers (id, name, email) values ('56e6aa79-1b15-5571-9f17-89054b2c96b9', 'Ms. Rimsha', null);
insert into public.teachers (id, name, email) values ('718b14db-f015-53f8-a4b8-75cc2c55c69a', 'Ms. Hanfa Ahsan', null);
insert into public.teachers (id, name, email) values ('2ae7d533-f422-5808-9ed0-00d843647181', 'Ms. Aqsa Batool', null);
insert into public.teachers (id, name, email) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', 'Ms. Sabeena', null);
insert into public.teachers (id, name, email) values ('0e7d113d-3ea6-504c-9139-387564e55d55', 'Ms. Kiran', null);
insert into public.teachers (id, name, email) values ('9c906cb9-3a60-582d-af85-8e59bb67238a', 'Ms. Samina Bibi', null);
insert into public.teachers (id, name, email) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', 'Ms. Shaista', null);
insert into public.teachers (id, name, email) values ('b16cfb51-dc9c-5864-b955-df837b268fce', 'Ms. Warda', null);
insert into public.teachers (id, name, email) values ('d2a7c4f0-1f3d-5fef-b436-e988677a6cf4', 'Ms. Hamra', null);
insert into public.teachers (id, name, email) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', 'Ms. Kaneez', null);
insert into public.teachers (id, name, email) values ('3af7c3b5-544f-5843-bd49-69754bd0baf6', 'Ms. Madeeha', null);
insert into public.teachers (id, name, email) values ('f021166a-1534-508f-9852-8a237362ef0a', 'Ms. Shumaila Shaheen', null);
insert into public.teachers (id, name, email) values ('3645caad-bb95-5179-9c3e-1f355715a7dc', 'Ms. Saira', null);
insert into public.teachers (id, name, email) values ('bd8ba919-18f9-5a24-b73a-14d9266a2f55', 'Ms. Iqra', null);
insert into public.teachers (id, name, email) values ('b0ae117d-1809-59e4-8290-587d9b7f92c1', 'Ms. Saima', null);
insert into public.teachers (id, name, email) values ('883347a9-0f16-5e34-9ad4-b3cf6e135c12', 'Ms. MAHDIA', null);
insert into public.teachers (id, name, email) values ('7002812e-7224-5bd5-9a05-07bf268e3fa8', 'Ms. Beenish', null);
insert into public.teachers (id, name, email) values ('30be831a-099e-55b1-923b-75d6d05d920a', 'Ms. Sadia', null);
insert into public.teachers (id, name, email) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', 'Ms. AMBREEN Kausar', null);
insert into public.teachers (id, name, email) values ('249c210a-f115-5660-9dcf-e8067090ef06', 'Ms. Shumaila', null);
insert into public.teachers (id, name, email) values ('64940e3e-d820-5274-a451-944932440907', 'Ms. Samana', null);
insert into public.teachers (id, name, email) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', 'Ms. Tabassum', null);

insert into public.teacher_subjects (teacher_id, subject_id) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', '548c14be-c6b3-5607-b274-31ce9d59e7fa') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', '49b9ffab-938e-5ece-ae96-211fd995c57e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2ae7d533-f422-5808-9ed0-00d843647181', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2ae7d533-f422-5808-9ed0-00d843647181', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2ae7d533-f422-5808-9ed0-00d843647181', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2ae7d533-f422-5808-9ed0-00d843647181', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2ae7d533-f422-5808-9ed0-00d843647181', '49b9ffab-938e-5ece-ae96-211fd995c57e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('7002812e-7224-5bd5-9a05-07bf268e3fa8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('7002812e-7224-5bd5-9a05-07bf268e3fa8', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('7002812e-7224-5bd5-9a05-07bf268e3fa8', '5b00ab83-3221-567d-b94d-3f796b20d502') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('666b3489-23b6-524b-9234-aa1f806e29bc', '181a1465-0b1b-54db-9011-f05d3233a734') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('666b3489-23b6-524b-9234-aa1f806e29bc', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('666b3489-23b6-524b-9234-aa1f806e29bc', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('666b3489-23b6-524b-9234-aa1f806e29bc', '5730c87e-337d-598d-b7f7-610a901e1f70') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('d2a7c4f0-1f3d-5fef-b436-e988677a6cf4', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('d2a7c4f0-1f3d-5fef-b436-e988677a6cf4', '5730c87e-337d-598d-b7f7-610a901e1f70') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('d2a7c4f0-1f3d-5fef-b436-e988677a6cf4', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('718b14db-f015-53f8-a4b8-75cc2c55c69a', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('718b14db-f015-53f8-a4b8-75cc2c55c69a', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('718b14db-f015-53f8-a4b8-75cc2c55c69a', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('718b14db-f015-53f8-a4b8-75cc2c55c69a', 'd4ea68fe-9839-5735-bef3-8dba484e6c94') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('bd8ba919-18f9-5a24-b73a-14d9266a2f55', 'd4ea68fe-9839-5735-bef3-8dba484e6c94') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('bd8ba919-18f9-5a24-b73a-14d9266a2f55', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', 'd4ea68fe-9839-5735-bef3-8dba484e6c94') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e045aa8f-bde4-515b-8fb8-66ca257b9bbd', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('0e7d113d-3ea6-504c-9139-387564e55d55', '1f9f9452-47f2-5477-808f-56f86370410b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('0e7d113d-3ea6-504c-9139-387564e55d55', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('0e7d113d-3ea6-504c-9139-387564e55d55', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('0e7d113d-3ea6-504c-9139-387564e55d55', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('0e7d113d-3ea6-504c-9139-387564e55d55', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('883347a9-0f16-5e34-9ad4-b3cf6e135c12', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('883347a9-0f16-5e34-9ad4-b3cf6e135c12', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('883347a9-0f16-5e34-9ad4-b3cf6e135c12', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('883347a9-0f16-5e34-9ad4-b3cf6e135c12', '5b00ab83-3221-567d-b94d-3f796b20d502') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3af7c3b5-544f-5843-bd49-69754bd0baf6', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3af7c3b5-544f-5843-bd49-69754bd0baf6', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3af7c3b5-544f-5843-bd49-69754bd0baf6', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3af7c3b5-544f-5843-bd49-69754bd0baf6', '351260f0-b023-54e5-891b-1ff43f5f5e11') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('566a9fe8-2871-5b12-a693-cdf1a01f9978', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('566a9fe8-2871-5b12-a693-cdf1a01f9978', '181a1465-0b1b-54db-9011-f05d3233a734') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('566a9fe8-2871-5b12-a693-cdf1a01f9978', 'dbf21572-facd-5f00-ae68-01a967596074') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('566a9fe8-2871-5b12-a693-cdf1a01f9978', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', '1f9f9452-47f2-5477-808f-56f86370410b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', '181a1465-0b1b-54db-9011-f05d3233a734') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', '49b9ffab-938e-5ece-ae96-211fd995c57e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('1e964d41-e197-55a5-a9c9-56fdf2a69387', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('56e6aa79-1b15-5571-9f17-89054b2c96b9', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('56e6aa79-1b15-5571-9f17-89054b2c96b9', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('56e6aa79-1b15-5571-9f17-89054b2c96b9', '49b9ffab-938e-5ece-ae96-211fd995c57e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', '34de9069-8349-59c0-9ed4-cce3a295169c') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', 'dbf21572-facd-5f00-ae68-01a967596074') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', '6391d0cc-9da0-5b57-927c-77daeb89ec5c') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('5c0d1449-e51d-5038-b72c-8a4c3bfdba92', '5730c87e-337d-598d-b7f7-610a901e1f70') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', '49b9ffab-938e-5ece-ae96-211fd995c57e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('fe7fb020-d4b6-5077-8876-b20b687eb7c2', '5730c87e-337d-598d-b7f7-610a901e1f70') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('30be831a-099e-55b1-923b-75d6d05d920a', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('30be831a-099e-55b1-923b-75d6d05d920a', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('30be831a-099e-55b1-923b-75d6d05d920a', '5c3b6dd5-f4ec-5330-8ea7-7c37d3cc94fc') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('b0ae117d-1809-59e4-8290-587d9b7f92c1', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('b0ae117d-1809-59e4-8290-587d9b7f92c1', 'd4ea68fe-9839-5735-bef3-8dba484e6c94') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('b0ae117d-1809-59e4-8290-587d9b7f92c1', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('b0ae117d-1809-59e4-8290-587d9b7f92c1', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3645caad-bb95-5179-9c3e-1f355715a7dc', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3645caad-bb95-5179-9c3e-1f355715a7dc', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3645caad-bb95-5179-9c3e-1f355715a7dc', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('3645caad-bb95-5179-9c3e-1f355715a7dc', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('81f7da22-a36d-517f-aa74-b940dbbf348d', '8a184480-9ac0-586b-a8cb-99f76aa375ae') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('81f7da22-a36d-517f-aa74-b940dbbf348d', '34de9069-8349-59c0-9ed4-cce3a295169c') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('81f7da22-a36d-517f-aa74-b940dbbf348d', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('81f7da22-a36d-517f-aa74-b940dbbf348d', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '7da94c20-6084-56ac-b7c5-8d7623ee9765') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '16a2dcd2-d638-5a83-9c05-99e65b3c7575') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('64940e3e-d820-5274-a451-944932440907', '930f7254-efe1-550b-a1ba-9c678ae10b38') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('9c906cb9-3a60-582d-af85-8e59bb67238a', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('9c906cb9-3a60-582d-af85-8e59bb67238a', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('9c906cb9-3a60-582d-af85-8e59bb67238a', '5b00ab83-3221-567d-b94d-3f796b20d502') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('9c906cb9-3a60-582d-af85-8e59bb67238a', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', '181a1465-0b1b-54db-9011-f05d3233a734') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('e271545d-4ee9-5af9-afb7-61c8d667abe0', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', '1f9f9452-47f2-5477-808f-56f86370410b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', 'ada19497-bed5-559f-a620-6155fc16b72e') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('2dbdb35d-4273-596a-ae2b-d87e0705194d', '5b00ab83-3221-567d-b94d-3f796b20d502') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '7da94c20-6084-56ac-b7c5-8d7623ee9765') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '16a2dcd2-d638-5a83-9c05-99e65b3c7575') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('249c210a-f115-5660-9dcf-e8067090ef06', '930f7254-efe1-550b-a1ba-9c678ae10b38') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('f021166a-1534-508f-9852-8a237362ef0a', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('f021166a-1534-508f-9852-8a237362ef0a', 'd4ea68fe-9839-5735-bef3-8dba484e6c94') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('f021166a-1534-508f-9852-8a237362ef0a', '56a643f3-fc23-5b63-b9b2-df975c061135') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('f021166a-1534-508f-9852-8a237362ef0a', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('f021166a-1534-508f-9852-8a237362ef0a', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '7da94c20-6084-56ac-b7c5-8d7623ee9765') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '16a2dcd2-d638-5a83-9c05-99e65b3c7575') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '1319d966-5598-5252-af73-99c08f6c037a') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('54e06dd1-a3a2-56be-ac87-32b874e25fbb', '930f7254-efe1-550b-a1ba-9c678ae10b38') on conflict do nothing;
insert into public.teacher_subjects (teacher_id, subject_id) values ('b16cfb51-dc9c-5864-b955-df837b268fce', '77e8c902-97d1-50d1-aeee-8ae148556d2b') on conflict do nothing;

insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '18057905-1ce3-5abf-a2d2-c9b909346993', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '18057905-1ce3-5abf-a2d2-c9b909346993', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '18057905-1ce3-5abf-a2d2-c9b909346993', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '18057905-1ce3-5abf-a2d2-c9b909346993', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '18057905-1ce3-5abf-a2d2-c9b909346993', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '8383b335-4f87-525a-863e-3d8d72ce8033', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '8383b335-4f87-525a-863e-3d8d72ce8033', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '8383b335-4f87-525a-863e-3d8d72ce8033', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '8383b335-4f87-525a-863e-3d8d72ce8033', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '8383b335-4f87-525a-863e-3d8d72ce8033', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '181a1465-0b1b-54db-9011-f05d3233a734', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '181a1465-0b1b-54db-9011-f05d3233a734', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '181a1465-0b1b-54db-9011-f05d3233a734', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '181a1465-0b1b-54db-9011-f05d3233a734', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '181a1465-0b1b-54db-9011-f05d3233a734', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '18057905-1ce3-5abf-a2d2-c9b909346993', 'dbf21572-facd-5f00-ae68-01a967596074', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '18057905-1ce3-5abf-a2d2-c9b909346993', 'dbf21572-facd-5f00-ae68-01a967596074', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '18057905-1ce3-5abf-a2d2-c9b909346993', 'dbf21572-facd-5f00-ae68-01a967596074', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '18057905-1ce3-5abf-a2d2-c9b909346993', 'dbf21572-facd-5f00-ae68-01a967596074', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '18057905-1ce3-5abf-a2d2-c9b909346993', 'dbf21572-facd-5f00-ae68-01a967596074', '566a9fe8-2871-5b12-a693-cdf1a01f9978', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '181a1465-0b1b-54db-9011-f05d3233a734', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '181a1465-0b1b-54db-9011-f05d3233a734', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '181a1465-0b1b-54db-9011-f05d3233a734', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '181a1465-0b1b-54db-9011-f05d3233a734', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '181a1465-0b1b-54db-9011-f05d3233a734', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '18057905-1ce3-5abf-a2d2-c9b909346993', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '18057905-1ce3-5abf-a2d2-c9b909346993', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '18057905-1ce3-5abf-a2d2-c9b909346993', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '18057905-1ce3-5abf-a2d2-c9b909346993', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1319d966-5598-5252-af73-99c08f6c037a', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '49b9ffab-938e-5ece-ae96-211fd995c57e', '1e964d41-e197-55a5-a9c9-56fdf2a69387', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'dbf21572-facd-5f00-ae68-01a967596074', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'dbf21572-facd-5f00-ae68-01a967596074', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'dbf21572-facd-5f00-ae68-01a967596074', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'dbf21572-facd-5f00-ae68-01a967596074', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', 'dbf21572-facd-5f00-ae68-01a967596074', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6391d0cc-9da0-5b57-927c-77daeb89ec5c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6391d0cc-9da0-5b57-927c-77daeb89ec5c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6391d0cc-9da0-5b57-927c-77daeb89ec5c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6391d0cc-9da0-5b57-927c-77daeb89ec5c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '6391d0cc-9da0-5b57-927c-77daeb89ec5c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '5730c87e-337d-598d-b7f7-610a901e1f70', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '5730c87e-337d-598d-b7f7-610a901e1f70', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '5730c87e-337d-598d-b7f7-610a901e1f70', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '34de9069-8349-59c0-9ed4-cce3a295169c', '5c0d1449-e51d-5038-b72c-8a4c3bfdba92', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'b335b894-17a5-585e-ada7-2f057bd83b65', '34de9069-8349-59c0-9ed4-cce3a295169c', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'b335b894-17a5-585e-ada7-2f057bd83b65', '34de9069-8349-59c0-9ed4-cce3a295169c', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'b335b894-17a5-585e-ada7-2f057bd83b65', '34de9069-8349-59c0-9ed4-cce3a295169c', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'b335b894-17a5-585e-ada7-2f057bd83b65', '34de9069-8349-59c0-9ed4-cce3a295169c', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'b335b894-17a5-585e-ada7-2f057bd83b65', '34de9069-8349-59c0-9ed4-cce3a295169c', '81f7da22-a36d-517f-aa74-b940dbbf348d', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '18057905-1ce3-5abf-a2d2-c9b909346993', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '18057905-1ce3-5abf-a2d2-c9b909346993', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '18057905-1ce3-5abf-a2d2-c9b909346993', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '18057905-1ce3-5abf-a2d2-c9b909346993', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '18057905-1ce3-5abf-a2d2-c9b909346993', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '8a184480-9ac0-586b-a8cb-99f76aa375ae', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '8383b335-4f87-525a-863e-3d8d72ce8033', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '81f7da22-a36d-517f-aa74-b940dbbf348d', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '8383b335-4f87-525a-863e-3d8d72ce8033', '1319d966-5598-5252-af73-99c08f6c037a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '8383b335-4f87-525a-863e-3d8d72ce8033', '1319d966-5598-5252-af73-99c08f6c037a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '8383b335-4f87-525a-863e-3d8d72ce8033', '1319d966-5598-5252-af73-99c08f6c037a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '8383b335-4f87-525a-863e-3d8d72ce8033', '1319d966-5598-5252-af73-99c08f6c037a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '8383b335-4f87-525a-863e-3d8d72ce8033', '1319d966-5598-5252-af73-99c08f6c037a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '8383b335-4f87-525a-863e-3d8d72ce8033', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '8383b335-4f87-525a-863e-3d8d72ce8033', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '8383b335-4f87-525a-863e-3d8d72ce8033', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '8383b335-4f87-525a-863e-3d8d72ce8033', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '8383b335-4f87-525a-863e-3d8d72ce8033', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '18057905-1ce3-5abf-a2d2-c9b909346993', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '181a1465-0b1b-54db-9011-f05d3233a734', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '181a1465-0b1b-54db-9011-f05d3233a734', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '181a1465-0b1b-54db-9011-f05d3233a734', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '181a1465-0b1b-54db-9011-f05d3233a734', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '181a1465-0b1b-54db-9011-f05d3233a734', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '8383b335-4f87-525a-863e-3d8d72ce8033', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', 'e271545d-4ee9-5af9-afb7-61c8d667abe0', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '56a643f3-fc23-5b63-b9b2-df975c061135', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '56a643f3-fc23-5b63-b9b2-df975c061135', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '56a643f3-fc23-5b63-b9b2-df975c061135', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '56a643f3-fc23-5b63-b9b2-df975c061135', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '56a643f3-fc23-5b63-b9b2-df975c061135', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '8383b335-4f87-525a-863e-3d8d72ce8033', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'f2314410-4056-5d51-a49d-127a5ef7e952', '181a1465-0b1b-54db-9011-f05d3233a734', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'f2314410-4056-5d51-a49d-127a5ef7e952', '181a1465-0b1b-54db-9011-f05d3233a734', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'f2314410-4056-5d51-a49d-127a5ef7e952', '181a1465-0b1b-54db-9011-f05d3233a734', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'f2314410-4056-5d51-a49d-127a5ef7e952', '181a1465-0b1b-54db-9011-f05d3233a734', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'f2314410-4056-5d51-a49d-127a5ef7e952', '181a1465-0b1b-54db-9011-f05d3233a734', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '5730c87e-337d-598d-b7f7-610a901e1f70', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '5730c87e-337d-598d-b7f7-610a901e1f70', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '5730c87e-337d-598d-b7f7-610a901e1f70', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f2314410-4056-5d51-a49d-127a5ef7e952', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '666b3489-23b6-524b-9234-aa1f806e29bc', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f2314410-4056-5d51-a49d-127a5ef7e952', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f2314410-4056-5d51-a49d-127a5ef7e952', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f2314410-4056-5d51-a49d-127a5ef7e952', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f2314410-4056-5d51-a49d-127a5ef7e952', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f2314410-4056-5d51-a49d-127a5ef7e952', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '82e1e310-364d-55b2-9b15-f0959be83700', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '82e1e310-364d-55b2-9b15-f0959be83700', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '82e1e310-364d-55b2-9b15-f0959be83700', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f2314410-4056-5d51-a49d-127a5ef7e952', '49b9ffab-938e-5ece-ae96-211fd995c57e', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '56e6aa79-1b15-5571-9f17-89054b2c96b9', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '18057905-1ce3-5abf-a2d2-c9b909346993', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '18057905-1ce3-5abf-a2d2-c9b909346993', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '18057905-1ce3-5abf-a2d2-c9b909346993', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '18057905-1ce3-5abf-a2d2-c9b909346993', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '18057905-1ce3-5abf-a2d2-c9b909346993', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '8383b335-4f87-525a-863e-3d8d72ce8033', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '8383b335-4f87-525a-863e-3d8d72ce8033', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '8383b335-4f87-525a-863e-3d8d72ce8033', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '8383b335-4f87-525a-863e-3d8d72ce8033', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '8383b335-4f87-525a-863e-3d8d72ce8033', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '718b14db-f015-53f8-a4b8-75cc2c55c69a', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f2314410-4056-5d51-a49d-127a5ef7e952', 'ada19497-bed5-559f-a620-6155fc16b72e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '49b9ffab-938e-5ece-ae96-211fd995c57e', '2ae7d533-f422-5808-9ed0-00d843647181', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '496297c1-6ab6-52a3-aeb5-e84642bb38df', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '496297c1-6ab6-52a3-aeb5-e84642bb38df', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '496297c1-6ab6-52a3-aeb5-e84642bb38df', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '496297c1-6ab6-52a3-aeb5-e84642bb38df', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '496297c1-6ab6-52a3-aeb5-e84642bb38df', 'b1f9e470-5fee-53d6-9460-d4f3e43198ad', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'b335b894-17a5-585e-ada7-2f057bd83b65', '56a643f3-fc23-5b63-b9b2-df975c061135', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'b335b894-17a5-585e-ada7-2f057bd83b65', '56a643f3-fc23-5b63-b9b2-df975c061135', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'b335b894-17a5-585e-ada7-2f057bd83b65', '56a643f3-fc23-5b63-b9b2-df975c061135', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'b335b894-17a5-585e-ada7-2f057bd83b65', '56a643f3-fc23-5b63-b9b2-df975c061135', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'b335b894-17a5-585e-ada7-2f057bd83b65', '56a643f3-fc23-5b63-b9b2-df975c061135', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'b335b894-17a5-585e-ada7-2f057bd83b65', '5730c87e-337d-598d-b7f7-610a901e1f70', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'b335b894-17a5-585e-ada7-2f057bd83b65', '5730c87e-337d-598d-b7f7-610a901e1f70', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'b335b894-17a5-585e-ada7-2f057bd83b65', '5730c87e-337d-598d-b7f7-610a901e1f70', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '49b9ffab-938e-5ece-ae96-211fd995c57e', 'fe7fb020-d4b6-5077-8876-b20b687eb7c2', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f2314410-4056-5d51-a49d-127a5ef7e952', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f2314410-4056-5d51-a49d-127a5ef7e952', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f2314410-4056-5d51-a49d-127a5ef7e952', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f2314410-4056-5d51-a49d-127a5ef7e952', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'f2314410-4056-5d51-a49d-127a5ef7e952', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '1f9f9452-47f2-5477-808f-56f86370410b', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', 'ada19497-bed5-559f-a620-6155fc16b72e', '0e7d113d-3ea6-504c-9139-387564e55d55', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '82e1e310-364d-55b2-9b15-f0959be83700', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '82e1e310-364d-55b2-9b15-f0959be83700', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '82e1e310-364d-55b2-9b15-f0959be83700', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '82e1e310-364d-55b2-9b15-f0959be83700', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '82e1e310-364d-55b2-9b15-f0959be83700', '56a643f3-fc23-5b63-b9b2-df975c061135', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '348b66e4-4dbc-58be-8697-a069635575d8', '1319d966-5598-5252-af73-99c08f6c037a', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '5b00ab83-3221-567d-b94d-3f796b20d502', '9c906cb9-3a60-582d-af85-8e59bb67238a', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1f9f9452-47f2-5477-808f-56f86370410b', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1f9f9452-47f2-5477-808f-56f86370410b', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1f9f9452-47f2-5477-808f-56f86370410b', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1f9f9452-47f2-5477-808f-56f86370410b', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'b335b894-17a5-585e-ada7-2f057bd83b65', '1f9f9452-47f2-5477-808f-56f86370410b', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '8383b335-4f87-525a-863e-3d8d72ce8033', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '82e1e310-364d-55b2-9b15-f0959be83700', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '20b4b07c-4518-5ed2-9c2d-4531ae919628', 'ada19497-bed5-559f-a620-6155fc16b72e', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '82e1e310-364d-55b2-9b15-f0959be83700', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '82e1e310-364d-55b2-9b15-f0959be83700', '5b00ab83-3221-567d-b94d-3f796b20d502', '2dbdb35d-4273-596a-ae2b-d87e0705194d', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'b335b894-17a5-585e-ada7-2f057bd83b65', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '82e1e310-364d-55b2-9b15-f0959be83700', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b16cfb51-dc9c-5864-b955-df837b268fce', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f2314410-4056-5d51-a49d-127a5ef7e952', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f2314410-4056-5d51-a49d-127a5ef7e952', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f2314410-4056-5d51-a49d-127a5ef7e952', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f2314410-4056-5d51-a49d-127a5ef7e952', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'f2314410-4056-5d51-a49d-127a5ef7e952', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'f027cd52-8ace-51ab-8995-0325d0cb7990', 'ada19497-bed5-559f-a620-6155fc16b72e', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '18057905-1ce3-5abf-a2d2-c9b909346993', '5730c87e-337d-598d-b7f7-610a901e1f70', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '18057905-1ce3-5abf-a2d2-c9b909346993', '5730c87e-337d-598d-b7f7-610a901e1f70', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '18057905-1ce3-5abf-a2d2-c9b909346993', '5730c87e-337d-598d-b7f7-610a901e1f70', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'd2a7c4f0-1f3d-5fef-b436-e988677a6cf4', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '496297c1-6ab6-52a3-aeb5-e84642bb38df', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'b335b894-17a5-585e-ada7-2f057bd83b65', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'b335b894-17a5-585e-ada7-2f057bd83b65', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'b335b894-17a5-585e-ada7-2f057bd83b65', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'b335b894-17a5-585e-ada7-2f057bd83b65', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'b335b894-17a5-585e-ada7-2f057bd83b65', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '82e1e310-364d-55b2-9b15-f0959be83700', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '22fbf4aa-5822-559f-b18b-609f2c6c6878', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (5, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'e045aa8f-bde4-515b-8fb8-66ca257b9bbd', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'b335b894-17a5-585e-ada7-2f057bd83b65', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'b335b894-17a5-585e-ada7-2f057bd83b65', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'b335b894-17a5-585e-ada7-2f057bd83b65', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'b335b894-17a5-585e-ada7-2f057bd83b65', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'b335b894-17a5-585e-ada7-2f057bd83b65', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '381e3109-95b7-54a7-bb2e-d9f8b44bf7c9', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '351260f0-b023-54e5-891b-1ff43f5f5e11', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '351260f0-b023-54e5-891b-1ff43f5f5e11', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '351260f0-b023-54e5-891b-1ff43f5f5e11', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '351260f0-b023-54e5-891b-1ff43f5f5e11', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '351260f0-b023-54e5-891b-1ff43f5f5e11', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'f2314410-4056-5d51-a49d-127a5ef7e952', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (5, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3af7c3b5-544f-5843-bd49-69754bd0baf6', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '19d9c498-c44e-5299-b4df-84686bf3663e', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '19d9c498-c44e-5299-b4df-84686bf3663e', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '19d9c498-c44e-5299-b4df-84686bf3663e', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '19d9c498-c44e-5299-b4df-84686bf3663e', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '19d9c498-c44e-5299-b4df-84686bf3663e', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '19d9c498-c44e-5299-b4df-84686bf3663e', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '19d9c498-c44e-5299-b4df-84686bf3663e', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '19d9c498-c44e-5299-b4df-84686bf3663e', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '19d9c498-c44e-5299-b4df-84686bf3663e', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '19d9c498-c44e-5299-b4df-84686bf3663e', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '348b66e4-4dbc-58be-8697-a069635575d8', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '19d9c498-c44e-5299-b4df-84686bf3663e', '1319d966-5598-5252-af73-99c08f6c037a', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '19d9c498-c44e-5299-b4df-84686bf3663e', '1319d966-5598-5252-af73-99c08f6c037a', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '19d9c498-c44e-5299-b4df-84686bf3663e', '1319d966-5598-5252-af73-99c08f6c037a', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '19d9c498-c44e-5299-b4df-84686bf3663e', '1319d966-5598-5252-af73-99c08f6c037a', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '19d9c498-c44e-5299-b4df-84686bf3663e', '1319d966-5598-5252-af73-99c08f6c037a', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (5, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '1729c979-3b9a-5fb6-bbe5-c6d071a255c1', '56a643f3-fc23-5b63-b9b2-df975c061135', 'f021166a-1534-508f-9852-8a237362ef0a', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '95f1cb76-b0b0-584a-a93e-191f863bd60f', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '348b66e4-4dbc-58be-8697-a069635575d8', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '348b66e4-4dbc-58be-8697-a069635575d8', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '348b66e4-4dbc-58be-8697-a069635575d8', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '18057905-1ce3-5abf-a2d2-c9b909346993', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '20b4b07c-4518-5ed2-9c2d-4531ae919628', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '348b66e4-4dbc-58be-8697-a069635575d8', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '3645caad-bb95-5179-9c3e-1f355715a7dc', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '1319d966-5598-5252-af73-99c08f6c037a', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '1319d966-5598-5252-af73-99c08f6c037a', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '1319d966-5598-5252-af73-99c08f6c037a', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '1319d966-5598-5252-af73-99c08f6c037a', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '1319d966-5598-5252-af73-99c08f6c037a', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'bd8ba919-18f9-5a24-b73a-14d9266a2f55', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'edd0eac5-1dab-5621-989e-ef6be55dcde4', '77e8c902-97d1-50d1-aeee-8ae148556d2b', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'd4ea68fe-9839-5735-bef3-8dba484e6c94', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '22fbf4aa-5822-559f-b18b-609f2c6c6878', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '82e1e310-364d-55b2-9b15-f0959be83700', '1319d966-5598-5252-af73-99c08f6c037a', 'b0ae117d-1809-59e4-8290-587d9b7f92c1', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'c5c288de-9e78-5a68-b10c-46c07476b0c5', 'ada19497-bed5-559f-a620-6155fc16b72e', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '5ff4e23d-3096-5797-b4b7-6b55be43ab34', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (2, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '5b00ab83-3221-567d-b94d-3f796b20d502', '883347a9-0f16-5e34-9ad4-b3cf6e135c12', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '348b66e4-4dbc-58be-8697-a069635575d8', '5b00ab83-3221-567d-b94d-3f796b20d502', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (5, 'e55d08d1-1193-56d3-bdfd-ab76a5807e12', '348b66e4-4dbc-58be-8697-a069635575d8', '2b06d138-a3d2-5c39-b107-a9eb8d878dd0', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '348b66e4-4dbc-58be-8697-a069635575d8', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '348b66e4-4dbc-58be-8697-a069635575d8', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '348b66e4-4dbc-58be-8697-a069635575d8', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '348b66e4-4dbc-58be-8697-a069635575d8', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '348b66e4-4dbc-58be-8697-a069635575d8', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (1, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '366a83ee-fd67-5086-983f-c4303d0bfd90', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '366a83ee-fd67-5086-983f-c4303d0bfd90', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (3, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '366a83ee-fd67-5086-983f-c4303d0bfd90', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '366a83ee-fd67-5086-983f-c4303d0bfd90', '56a643f3-fc23-5b63-b9b2-df975c061135', '7002812e-7224-5bd5-9a05-07bf268e3fa8', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '366a83ee-fd67-5086-983f-c4303d0bfd90', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '366a83ee-fd67-5086-983f-c4303d0bfd90', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '366a83ee-fd67-5086-983f-c4303d0bfd90', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '366a83ee-fd67-5086-983f-c4303d0bfd90', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '366a83ee-fd67-5086-983f-c4303d0bfd90', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '366a83ee-fd67-5086-983f-c4303d0bfd90', '5c3b6dd5-f4ec-5330-8ea7-7c37d3cc94fc', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '366a83ee-fd67-5086-983f-c4303d0bfd90', '5c3b6dd5-f4ec-5330-8ea7-7c37d3cc94fc', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '366a83ee-fd67-5086-983f-c4303d0bfd90', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '366a83ee-fd67-5086-983f-c4303d0bfd90', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '366a83ee-fd67-5086-983f-c4303d0bfd90', '0d99f6ad-e506-52e1-859d-68cc6d2d69a3', '30be831a-099e-55b1-923b-75d6d05d920a', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '19d9c498-c44e-5299-b4df-84686bf3663e', '548c14be-c6b3-5607-b274-31ce9d59e7fa', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '19d9c498-c44e-5299-b4df-84686bf3663e', '548c14be-c6b3-5607-b274-31ce9d59e7fa', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '19d9c498-c44e-5299-b4df-84686bf3663e', '548c14be-c6b3-5607-b274-31ce9d59e7fa', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '19d9c498-c44e-5299-b4df-84686bf3663e', '548c14be-c6b3-5607-b274-31ce9d59e7fa', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '19d9c498-c44e-5299-b4df-84686bf3663e', '548c14be-c6b3-5607-b274-31ce9d59e7fa', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'f027cd52-8ace-51ab-8995-0325d0cb7990', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (1, '60670075-125e-5e56-8f49-12f920730ca2', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (2, '60670075-125e-5e56-8f49-12f920730ca2', '366a83ee-fd67-5086-983f-c4303d0bfd90', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (5, '60670075-125e-5e56-8f49-12f920730ca2', '366a83ee-fd67-5086-983f-c4303d0bfd90', 'dab0c79c-a2ff-5a5e-bcea-aef4da49164a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (3, '60670075-125e-5e56-8f49-12f920730ca2', '366a83ee-fd67-5086-983f-c4303d0bfd90', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, '60670075-125e-5e56-8f49-12f920730ca2', '366a83ee-fd67-5086-983f-c4303d0bfd90', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (4, 'dd4fa2e3-46df-583c-8992-34748bdfb329', '348b66e4-4dbc-58be-8697-a069635575d8', '49b9ffab-938e-5ece-ae96-211fd995c57e', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (2, 'dd4fa2e3-46df-583c-8992-34748bdfb329', 'e2f3b7e6-98ab-56c4-9cd8-d63c023a35a0', '1319d966-5598-5252-af73-99c08f6c037a', 'ce431e9c-d7b5-570e-a6e5-bd3c8081ff07', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '16a2dcd2-d638-5a83-9c05-99e65b3c7575', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '961b736a-0309-5ed4-bdb5-26feaec73d2b', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '961b736a-0309-5ed4-bdb5-26feaec73d2b', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '1319d966-5598-5252-af73-99c08f6c037a', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '1319d966-5598-5252-af73-99c08f6c037a', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '1319d966-5598-5252-af73-99c08f6c037a', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '1319d966-5598-5252-af73-99c08f6c037a', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '1319d966-5598-5252-af73-99c08f6c037a', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '930f7254-efe1-550b-a1ba-9c678ae10b38', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '930f7254-efe1-550b-a1ba-9c678ae10b38', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '961b736a-0309-5ed4-bdb5-26feaec73d2b', '7da94c20-6084-56ac-b7c5-8d7623ee9765', '249c210a-f115-5660-9dcf-e8067090ef06', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '16a2dcd2-d638-5a83-9c05-99e65b3c7575', '64940e3e-d820-5274-a451-944932440907', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '78db52ab-0b84-5df7-8f7a-63e21719adc2', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '64940e3e-d820-5274-a451-944932440907', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '78db52ab-0b84-5df7-8f7a-63e21719adc2', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '64940e3e-d820-5274-a451-944932440907', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '64940e3e-d820-5274-a451-944932440907', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '64940e3e-d820-5274-a451-944932440907', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '64940e3e-d820-5274-a451-944932440907', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '64940e3e-d820-5274-a451-944932440907', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '64940e3e-d820-5274-a451-944932440907', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '64940e3e-d820-5274-a451-944932440907', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '64940e3e-d820-5274-a451-944932440907', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '1319d966-5598-5252-af73-99c08f6c037a', '64940e3e-d820-5274-a451-944932440907', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '1319d966-5598-5252-af73-99c08f6c037a', '64940e3e-d820-5274-a451-944932440907', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '1319d966-5598-5252-af73-99c08f6c037a', '64940e3e-d820-5274-a451-944932440907', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '1319d966-5598-5252-af73-99c08f6c037a', '64940e3e-d820-5274-a451-944932440907', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '1319d966-5598-5252-af73-99c08f6c037a', '64940e3e-d820-5274-a451-944932440907', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '64940e3e-d820-5274-a451-944932440907', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '64940e3e-d820-5274-a451-944932440907', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '64940e3e-d820-5274-a451-944932440907', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '64940e3e-d820-5274-a451-944932440907', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '64940e3e-d820-5274-a451-944932440907', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '930f7254-efe1-550b-a1ba-9c678ae10b38', '64940e3e-d820-5274-a451-944932440907', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '930f7254-efe1-550b-a1ba-9c678ae10b38', '64940e3e-d820-5274-a451-944932440907', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '64940e3e-d820-5274-a451-944932440907', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '64940e3e-d820-5274-a451-944932440907', null),
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', '78db52ab-0b84-5df7-8f7a-63e21719adc2', '7da94c20-6084-56ac-b7c5-8d7623ee9765', '64940e3e-d820-5274-a451-944932440907', null),
  (1, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '16a2dcd2-d638-5a83-9c05-99e65b3c7575', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (2, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (3, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', 'ab339ea9-cc9f-5409-be1c-d8246dca4f06', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (4, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (5, '25aff6f9-9059-552d-9d7c-fcf2352eacc0', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (1, '3adb6068-e346-574e-b450-4b2ea07142ea', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (2, '3adb6068-e346-574e-b450-4b2ea07142ea', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (3, '3adb6068-e346-574e-b450-4b2ea07142ea', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (4, '3adb6068-e346-574e-b450-4b2ea07142ea', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (5, '3adb6068-e346-574e-b450-4b2ea07142ea', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '4d95fee2-ce0d-53ce-8ed4-e6622094eef4', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (1, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '1319d966-5598-5252-af73-99c08f6c037a', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (2, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '1319d966-5598-5252-af73-99c08f6c037a', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (3, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '1319d966-5598-5252-af73-99c08f6c037a', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (4, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '1319d966-5598-5252-af73-99c08f6c037a', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (5, '008570f2-e2ff-5f55-8fa0-d27ab107e5d6', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '1319d966-5598-5252-af73-99c08f6c037a', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (1, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (2, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (3, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (4, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (5, 'd7072b19-42bf-52a5-9c82-47c99bbdfd5c', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '77e8c902-97d1-50d1-aeee-8ae148556d2b', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (1, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '930f7254-efe1-550b-a1ba-9c678ae10b38', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (2, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '930f7254-efe1-550b-a1ba-9c678ae10b38', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (3, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null),
  (4, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '10c07f93-d95b-5ac0-8d54-8d1ec394dd81', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null);
insert into public.timetable_slots (day_of_week, period_id, class_section_id, subject_id, teacher_id, room) values
  (5, 'c41de133-6c77-5ea1-bf8a-9358425af125', 'dc028c8d-2ea3-5324-95f5-e7a2ec903a02', '7da94c20-6084-56ac-b7c5-8d7623ee9765', '54e06dd1-a3a2-56be-ac87-32b874e25fbb', null);
