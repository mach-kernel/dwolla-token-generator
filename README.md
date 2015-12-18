# dwolla-token-generator
The new Dwolla OAuth token generator, powered by [rest-client](https://github.com/rest-client/rest-client), [redcarpet](https://github.com/vmg/redcarpet) and [rouge](https://github.com/jneen/rouge).

![Ooh! Pretty!](http://puu.sh/m0gb9/641508ebbf.png)

## Requirements
- Rails 4+
- Bundler

This application does not require any database access as all the data is processed via the Dwolla API. ActiveRecord has been removed from this project. 

## Getting Started

### Fetch & Run

The default application key and secret bundled with the application are for you to use with the UAT environment, so you can just run it!

```bash
git clone https://github.com/mach-kernel/dwolla-token-generator.git
cd dwolla-token-generator
bundle install && rails s
```

Afterwards, just visit your default Rails URL, which is probably `localhost:3000`.

### Run in docker
```
docker build -t dwolla-token-generator .
docker run -e development
```

## Contributors

- Rails app by [David Stancu](http://davidstancu.me) for [Dwolla Inc.](https://developers.dwolla.com)
- [Gordon Zheng](https://github.com/capablemonkey) for edits, QA, and implementing Dwolla styling tiles
- [Christopher Knutson](https://github.com/canuteson) for Dockerization

## License

Copyright (C) 2015 David Stancu, Dwolla Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.