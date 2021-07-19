# Ruby View Template Converters

<a href="https://badge.fury.io/rb/ruby_view_template_converters" target="_blank"><img height="21" style='border:0px;height:21px;' border='0' src="https://badge.fury.io/rb/ruby_view_template_converters.svg" alt="Gem Version"></a>
<a href='https://github.com/westonganger/ruby_view_template_converters/actions' target='_blank'><img src="https://github.com/westonganger/ruby_view_template_converters/workflows/Tests/badge.svg" style="max-width:100%;" height='21' style='border:0px;height:21px;' border='0' alt="CI Status"></a>
<a href='https://rubygems.org/gems/ruby_view_template_converters' target='_blank'><img height='21' style='border:0px;height:21px;' src='https://ruby-gem-downloads-badge.herokuapp.com/ruby_view_template_converters?label=rubygems&type=total&total_label=downloads&color=brightgreen' border='0' alt='RubyGems Downloads' /></a>

Complete solutions to convert ERB, SLIM, AND HAML with the least amount of manual effort.

Features:

- Converts ERB, SLIM, or HAML
- Support conversion in both directions for each view template language

## Installation

```
gem install ruby_view_template_converters
```

Or if you want to download and use the scripts directly you can download from the [`bin/` folder](./bin/)

## Command Line Usage

### Convert from ERB

#### ERB to SLIM

```
ruby_view_template_converters --erb-to-haml <file-path-or-glob>
```

#### ERB to HAML (TBD - Help wanted)

```
ruby_view_template_converters --erb-to-haml <file-path-or-glob>
```

### Convert from SLIM

#### SLIM to ERB

```
ruby_view_template_converters --slim-to-erb <file-path-or-glob>
```

#### SLIM to HAML (TBD - Help wanted)

```
ruby_view_template_converters --slim-to-haml <file-path-or-glob>
```

### Convert from HAML

#### HAML to ERB (TBD - Help wanted)

```
ruby_view_template_converters --haml-to-erb <file-path-or-glob>
```

#### HAML to SLIM (TBD - Help wanted)

```
ruby_view_template_converters --haml-to-slim <file-path-or-glob>
```

## Ruby Usage

```ruby
ViewTemplateConverters.erb_to_slim(file_path_or_glob)
ViewTemplateConverters.erb_to_haml(file_path_or_glob)

ViewTemplateConverters.slim_to_erb(file_path_or_glob)
ViewTemplateConverters.slim_to_haml(file_path_or_glob)

ViewTemplateConverters.haml_to_erb(file_path_or_glob)
ViewTemplateConverters.haml_to_slim(file_path_or_glob)
```

## Credits

Created & Maintained by [Weston Ganger](https://westonganger.com) - [@westonganger](https://github.com/westonganger)
