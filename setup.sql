CREATE TABLE subjects (
   id SERIAL PRIMARY KEY,
   author_id INTEGER,
   subject VARCHAR(50) NOT NULL,
   description VARCHAR(200) NOT NULL, 
   created_at timestamp NOT NULL,
   updated_at timestamp NOT NULL,
   subject_image VARCHAR(80) DEFAULT 'default_subject.png' NOT NULL 
);

CREATE TABLE topics (
   id SERIAL PRIMARY KEY,
   author_id INTEGER,
   topic VARCHAR(50) NOT NULL,
   description VARCHAR(200) NOT NULL, 
   topic_image VARCHAR(80) DEFAULT 'default_subject.jpg' NOT NULL,
   subject_id INTEGER NOT NULL REFERENCES subjects(id)
);

CREATE TABLE posts (
   id SERIAL PRIMARY KEY,
   resource VARCHAR(50) NOT NULL,
   resource_url VARCHAR(2048) NOT NULL,
   author_id INTEGER NOT NULL, 
   author_name VARCHAR(50) NOT NULL,
   subject_name VARCHAR(50) NOT NULL,
   topic_name VARCHAR(50) NOT NULL,
   subject_id INTEGER NOT NULL, 
   description VARCHAR(240) NOT NULL,
   upvote INTEGER DEFAULT 0,
   upvote_count INTEGER DEFAULT 0,
   post_image VARCHAR(80) DEFAULT 'default_subject.jpg' NOT NULL,
   author_image VARCHAR(80) DEFAULT 'default.png' NOT NULL,
   created_at timestamp NOT NULL,
   updated_at timestamp NOT NULL,
   topic_id INTEGER NOT NULL REFERENCES topics(id)
);

CREATE TABLE upvoteposts (
   id SERIAL PRIMARY KEY,
   user_id INTEGER NOT NULL,
   post_id INTEGER NOT NULL REFERENCES posts(id),
   vote_choice INTEGER DEFAULT 0 NOT NULL 
);

CREATE TABLE reports (
   id SERIAL PRIMARY KEY,
   author_id VARCHAR(50),
   reported_post_id INTEGER NOT NULL,
   description VARCHAR(400) NOT NULL,
   created_at timestamp NOT NULL,
   updated_at timestamp NOT NULL,
   resolved_by VARCHAR(50) DEFAULT 'unresolved' NOT NULL 
);

CREATE TABLE users (
   id SERIAL PRIMARY KEY,
   username varchar(80) NOT NULL UNIQUE,
   email varchar(100) NOT NULL UNIQUE,
   firstname varchar(80) NOT NULL,
   lastname varchar(80) NOT NULL,
   password bytea NOT NULL,
   school varchar(80) NOT NULL,
   profile_image varchar(80) DEFAULT 'default.png' NOT NULL,
   created_at timestamp NOT NULL,
   updated_at timestamp NOT NULL,
   is_active boolean DEFAULT TRUE,
   is_staff boolean DEFAULT FALSE
);