# LogParser

## About
Simple ruby script to parse web server log files. Returns the list of webpages with the most views ordered from the most pages views to less page views.

## Web server log file format
```
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
/about/2 444.701.448.104
...
```

## Installation

```ruby
bundle install
```

## Usage
```
./log_parser.rb webserver.log
```

## Example
```
$ ./log_parser.rb test/webserver.log
test/webserver.log
  /about/2 90 unique views
  /contact 89 unique views
  /index 82 unique views
  /about 81 unique views
  /help_page/1 80 unique views
  /home 78 unique views
```