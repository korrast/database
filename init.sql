DROP TABLE IF EXISTS users      CASCADE;
DROP TABLE IF EXISTS tables     CASCADE;
DROP TABLE IF EXISTS tasks      CASCADE;
DROP TABLE IF EXISTS columns    CASCADE;
DROP TABLE IF EXISTS milestones CASCADE;
DROP TABLE IF EXISTS labels     CASCADE;

-- ENTITY

CREATE TABLE users (
  id        varchar   PRIMARY KEY NOT NULL,
  username  varchar   UNIQUE NOT NULL,
  password  varchar   NOT NULL
);

CREATE TABLE tables (
  id        varchar   PRIMARY KEY NOT NULL,
  title     varchar   NOT NULL
);

CREATE TABLE milestones (
  id            varchar   PRIMARY KEY NOT NULL,
  title         varchar   NOT NULL,
  description   varchar,
  endDate       date      NOT NULL
);


CREATE TABLE tasks (
  id            varchar   PRIMARY KEY NOT NULL,
  title         varchar   NOT NULL,
  description   varchar,
  milestoneID   varchar,

  FOREIGN KEY (milestoneID) REFERENCES milestones(id)
);

CREATE TABLE columns (
  id          varchar       PRIMARY KEY NOT NULL,
  title       varchar       NOT NULL,
  color       varchar(7)    NOT NULL,
  taskNumber  int
);

CREATE TABLE labels (
  id      varchar     PRIMARY KEY NOT NULL,
  title   varchar     NOT NULL,
  colo    varchar(7)  NOT NULL
);

-- RELATION

DROP TABLE IF EXISTS users_tables;
DROP TABLE IF EXISTS tables_columns;
DROP TABLE IF EXISTS columns_tasks;
DROP TABLE IF EXISTS tables_labels;
DROP TABLE IF EXISTS tasks_labels;

CREATE TABLE users_tables (
  userID    varchar,
  tableID   varchar,

  CONSTRAINT pk_users_tables PRIMARY KEY(userID, tableID),
  FOREIGN KEY (userID)  REFERENCES users(id),
  FOREIGN KEY (tableID) REFERENCES tables(id)
);

CREATE TABLE tables_columns (
  tableID   varchar,
  columnID  varchar,

  CONSTRAINT pk_tables_columns PRIMARY KEY(tableID, columnID),
  FOREIGN KEY (tableID) REFERENCES tables(id),
  FOREIGN KEY (columnID) REFERENCES columns(id)
);

CREATE TABLE columns_tasks (
  columnID  varchar,
  taskID    varchar,

  CONSTRAINT pk_columns_tasks PRIMARY KEY(columnID, taskID),
  FOREIGN KEY (columnID) REFERENCES columns(id),
  FOREIGN KEY (taskID) REFERENCES tasks(id)
);

CREATE TABLE tables_labels (
  tableID   varchar,
  labelID   varchar,

  CONSTRAINT pk_tables_lables PRIMARY KEY(tableID, labelID),
  FOREIGN KEY (tableID) REFERENCES tables(id),
  FOREIGN KEY (labelID) REFERENCES labels(id)
);

CREATE TABLE tasks_labels (
  taskID    varchar,
  labelID   varchar,

  CONSTRAINT pk_tasks_labels PRIMARY KEY(taskID, labelID),
  FOREIGN KEY (taskID) REFERENCES tasks(id),
  FOREIGN KEY (labelID) REFERENCES labels(id)
);
