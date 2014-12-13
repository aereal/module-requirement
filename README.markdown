# Module::Requirement

Conceptual work of early time checking the implementation requirements

## Usage

```ruby
require 'module/requirement'

module Iterable
  include Module::Requirement
  include Enumerable

  requires :each
end

class List
  include Iterable # => Module::Requirement::Error::NotMeetRequirements List must implement required methods: each
end
```

## Install

```
echo 'gem "module-requirement", :git => "git://github.com/aereal/module-requirement.git"' >> Gemfile
```

## License

MIT License

(See also LICENSE.txt)

## Author

aereal
