DROP TABLE IF EXISTS comments, likes CASCADE;

CREATE TABLE IF NOT EXISTS comments
(
    id           BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    user_id      BIGINT                                  NOT NULL,
    event_id     BIGINT                                  NOT NULL,
    created_date TIMESTAMP                               NOT NULL,
    description  VARCHAR(2000)                           NOT NULL,
    state_enum   BIGINT                                  NOT NULL,
    CONSTRAINT pk_comment PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS likes
(
    id         BIGINT GENERATED BY DEFAULT AS IDENTITY NOT NULL,
    comment_id BIGINT                                  NOT NULL,
    user_id    BIGINT                                  NOT NULL,
    like_enum  BIGINT                                  NOT NULL,
    CONSTRAINT pk_likes PRIMARY KEY (id),
    CONSTRAINT fk_likes_to_comments FOREIGN KEY (comment_id) REFERENCES comments (id)
);

