--create the database

DROP DATABASE IF EXISTS hu_social;

CREATE DATABASE hu_social;



--select the database

USE hu_social;



--create tables

CREATE TABLE users

(

  hu_id INT NOT NULL PRIMARY KEY,

  hu_email VARCHAR(500) NOT NULL UNIQUE,

  first_name VARCHAR(200) NOT NULL,

  last_name VARCHAR(200) NOT NULL

);



CREATE TABLE login

(

  username VARCHAR(500) NOT NULL,

  password VARCHAR(100) NOT NULL,

  CONSTRAINT login_fk_users

    FOREIGN KEY (username)

    REFERENCES users (hu_email)

);



CREATE TABLE profile

(

  profile_id INT NOT NULL PRIMARY KEY,

  phone_number VARCHAR(14) UNIQUE,

  user_bio VARCHAR(250),

  user_status VARCHAR(7) NOT NULL,

  user_major VARCHAR(200) NOT NULL,

  user_grade VARCHAR(8) NOT NULL,

  user_subject VARCHAR(200),

  CONSTRAINT profile_fk_users

    FOREIGN KEY (profile_id)

    REFERENCES users (hu_id)

);



CREATE TABLE friends

(

  table_id INT NOT NULL,

  friend_id INT NOT NULL AUTO_INCREMENT

  CONSTRAINT friends_fk_profile

    FOREIGN KEY (table_id)

    REFERENCES profile (profile_id)

); 



CREATE TABLE posts

(
  
  post_id INT NOT NULL,
  
  -- Announcement, Comment
  post_type VARCHAR(12) NOT NULL,
  
  message VARCHAR (500), 
  
  date_posted DATE NOT NULL
  
  CONSTRAINT posts_fk_profile
    
    FOREIGN KEY (post_id)
  
    REFERENCES profile (profile_id)

);
