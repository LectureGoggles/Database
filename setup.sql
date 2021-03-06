CREATE TABLE subjects (
   id int IDENTITY(1,1) PRIMARY KEY,
   author_id INTEGER NOT NULL,
   subject VARCHAR(50) NOT NULL,
   description VARCHAR(250) NOT NULL, 
   created_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   subject_image VARCHAR(2084) DEFAULT 'default_subject.png' NOT NULL 
);

CREATE TABLE topics (
   id int IDENTITY(1,1) PRIMARY KEY,
   author_id INTEGER NOT NULL,
   topic VARCHAR(50) NOT NULL,
   description VARCHAR(250) NOT NULL, 
   topic_image VARCHAR(2084) DEFAULT 'default_subject.jpg' NOT NULL,
   subject_id INTEGER NOT NULL REFERENCES subjects(id)
);

CREATE TABLE posts (
   id int IDENTITY(1,1) PRIMARY KEY,
   resource VARCHAR(100) NOT NULL,
   resource_url VARCHAR(2084) NOT NULL,
   author_id INTEGER NOT NULL, 
   author_name VARCHAR(100) NOT NULL,
   subject_name VARCHAR(100) NOT NULL,
   topic_name VARCHAR(100) NOT NULL,
   subject_id INTEGER NOT NULL, 
   description VARCHAR(400) NOT NULL,
   upvote INTEGER DEFAULT 0,
   upvote_count INTEGER DEFAULT 0,
   post_image VARCHAR(2084) DEFAULT 'Image.svg' NOT NULL,
   author_image VARCHAR(2084) DEFAULT 'Avatar.svg' NOT NULL,
   created_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   topic_id INTEGER NOT NULL REFERENCES topics(id)
);

CREATE TABLE upvoteposts (
   id int IDENTITY(1,1) PRIMARY KEY,
   user_id INTEGER NOT NULL,
   post_id INTEGER NOT NULL REFERENCES posts(id),
   vote_choice INTEGER DEFAULT 0 NOT NULL 
);

CREATE TABLE reports (
   id int IDENTITY(1,1) PRIMARY KEY,
   author_id INTEGER,
   description VARCHAR(250) NOT NULL,
   created_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   reported_post_id INTEGER,
   reported_content_extension VARCHAR(200),
   resolved bit NOT NULL DEFAULT 0,
   resolved_by VARCHAR(100) DEFAULT 'unresolved' NOT NULL,
   teacher_created bit NOT NULL DEFAULT 0
);

CREATE TABLE users (
   id int IDENTITY(1,1) PRIMARY KEY,
   username varchar(80) NOT NULL UNIQUE,
   email varchar(320) NOT NULL UNIQUE,
   firstname varchar(80) NOT NULL,
   lastname varchar(80) NOT NULL,
   password varbinary(max) NOT NULL,
   school varchar(80) NOT NULL,
   profile_image varchar(2084) DEFAULT 'default.png' NOT NULL,
   created_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   updated_at datetimeoffset(7) NOT NULL DEFAULT CURRENT_TIMESTAMP,
   is_active bit NOT NULL DEFAULT 1,
   is_teacher bit NOT NULL DEFAULT 0,
   is_staff bit NOT NULL DEFAULT 0
);

CREATE TABLE subject_subscription (
   id int IDENTITY(1,1) PRIMARY KEY,
   user_id INTEGER NOT NULL REFERENCES users(id),
   subject_id INTEGER NOT NULL 
);

CREATE TABLE topic_subscription (
   id int IDENTITY(1,1) PRIMARY KEY,
   user_id INTEGER NOT NULL REFERENCES users(id),
   topic_id INTEGER NOT NULL
);