# LogParser

## About
Simple ruby script to parse web server log files. Returns the list of webpages with the most views ordered from the most pages views to less page views.

## Installation

```ruby
$ bundle install
```

## Usage
```
$ ./log_parser.rb [options] file
```

## Options
```
    -p, --parser=PARSER              Select parser (default: basic)
    -r, --reader=READER              Select reader (default: memory)
    -s, --style=STYLE                Select output style (default: default)
    -h, --help                       Displays help
```

### Parser
There is only one parser `basic`.

### File readers
You can select between two file readers:
- `memory` - loads all file to the memory
- `sequential` - reads the file line by line

### Style
You can get list of webpages:
- `default` - with most page views, ordered from most page views to less page views
- `unique` - with most unique page views, ordered from most page views to less page views

## Examples
All views
```
$ ./log_parser.rb spec/fixtures/webserver-full.log
spec/fixtures/webserver-full.log
  /about/2 90 views
  /contact 89 views
  /index 82 views
  /about 81 views
  /help_page/1 80 views
  /home 78 views
```

Unique views
```
$ ./log_parser.rb -s unique spec/fixtures/webserver-full.log
spec/fixtures/webserver-full.log
  /help_page/1 23 unique views
  /contact 23 unique views
  /home 23 unique views
  /index 23 unique views
  /about/2 22 unique views
  /about 21 unique views
```

## Web server log file format
```
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
/about/2 444.701.448.104
...
```