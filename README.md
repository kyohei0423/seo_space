# データベース設計

- users
  - name
  - email
  - password
  - profile
  - work
  - avatar

- prototypes
  - title
  - catchcopy
  - concept
  - user_id

- images
  - image
  - user_id
  - prototype_id

- comments
  - text
  - user_id
  - prototype_id

- likes
  - user_id
  - prototype_id

- tags
  - name

- prototypes_tags
  - prototype_id
  - tag_id
