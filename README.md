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