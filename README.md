# Links - Readme

This app is an Hackernews clone tool to categorize and share links. Use the global search feature to find an old link with ease :)

![Links website screenshot](https://raw.githubusercontent.com/henricazottes/links/master/github/screenshot.png)

## Dependencies

You need both ``docker`` and ``docker-compose`` to build/run this project.
```bash
sudo apt install docker docker-compose
```

## Building instructions

```bash
git clone https://github.com/henricazottes/links.git
cd links/
sudo docker-compose build
```
## Deployment instructions

First we need to create the database and run rails migrations.

```bash
git clone https://github.com/henricazottes/links.git
cd links/
sudo docker-compose run web rake db:create
sudo docker-compose run web rake db:migrate
```

Finally, just launch the container with:

```
sudo docker-compose up -d # -d for running it in background
```

You can now access the app on [http://localhost:3000](http://localhost:3000)

## Manual User validation

If you don't have a transactional email provider, you might want to validate users by hand. You can do it by finding link validations in logs, or more easily by using the Rails console like so:

```bash
sudo docker-compose run web bash  # if container not running
sudo docker-compose exec web bash # if container running
myapp$ rails c
irb(main):> User.first.confirm    # use User.find() to select another user
```


