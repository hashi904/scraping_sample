# README
## why
- provide web scraping data as csv, json.
- this app can show us scraping in admin page. and you can set the scraping motion(date, )
## todo list
- [x] scraping_service
- [x] db setting
- [x] model  => feeds model saving html elements
- [x] admin model => saving settings for scraping (id, url, node, status, (user_id))
- [x] admin view index : you can confirm scraping status
- [x] admin view new : you can submit scraping settings, status
- [x] admin view show; you can view scraping settings, status details
- [ ] admin controller : new/index/create/show/edit
  - [ ] get: index action
  - [ ] get: new action
  - [ ] post: create action => scraping start, validation
  - [ ] post: save => save settings for scraping, validation
- [ ] user authentication
  - [ ] sigin up with session

- [ ] csv
  - [x] brew install redis
  - [x] gem install
    - start as deamon process `brew services start redis`
    - start sidekiq `bundle exec sidekiq -C config/sidekiq.yml`
  - [ ] create worker
  - implements csv as sidekiq
    - [ ] api
      - [ ] create ExportFeeds
        - [ ] index
    - [ ] view
      - [ ] create ExportFeeds
        - [ ] index

- [x] api
- [x] application controller
  - error code
  - user authentication
    - [x] sigin in
      - token authentication

  - provide_controller => provide feed data
    - [x] index
    - [x] create
    - [x] delete
    - [x] show
- [ ] refactoring matapro form object
- [ ] nokogiri misconversion so i must modify text code

## Test User In Development
- user1
  - id: 1
  - name: hoge
  - email: hoge@gmail.com
  - password: hogehoge