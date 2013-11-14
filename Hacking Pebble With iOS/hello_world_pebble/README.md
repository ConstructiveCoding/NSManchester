Pebble Hello World for NSManchester
===================================

This is a Pebble application created for the talk Hacking Pebble with iOS.

To build the application first create a project for the code to reside in.

This command will create a project in the current directory.

```shell
~/pebble-dev/PebbleSDK-1.12/Pebble/tools/create_pebble_project.py ~/pebble-dev/PebbleSDK-1.12/Pebble/sdk hello_world
```

Then replace the src/hello_world.c file in the project with the file from the git repository.

```shell
./waf configure
./waf build
```
Start a webserver to share the application.
```shell
python -m SimpleHTTPServer 8000
```
And on your phone, go to: http://<your computer ip address>:8000/build/. Click on hello_world.pbw and choose to install it with the Pebble application.

Once the applicaiton is installed on your watch, you will be able to communicate with it from the iOS application.