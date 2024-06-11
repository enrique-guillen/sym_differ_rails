# sym_differ_rails
This is a decoupled web interface for the SymDiffer project.

## Development instructions & commands
- There is a .ruby-version file that indicates with which Ruby version this project was developed. You can use `rbenv`
  or another method to install this Ruby version.
- Run `bundle install` to install all dependencies.
- To run RSpec tests: `bundle exec rspec spec`. The `spec/` folder contains typical unit tests.
- `rubocop` and `reek` should be executed for static analysis.
- For locally running along with [sym_differ_vue](https://github.com/enrique-guillen/sym_differ_vue), define a
  `.env.development.local` file or manually set environment variables and set `DEFAULT_ACCESS_CONTROL_ALLOW_ORIGIN` to
  the appropriate value (usually the base URL of the web application from which the request originated).

## See also
- [sym_differ_vue](https://github.com/enrique-guillen/sym_differ_vue) which is the main frontend for the SymDiffer application.
- [sym_differ](https://github.com/enrique-guillen/sym_differ) for the application code that carries out all the relevant mathematical operations
- [sym_differ_cli](https://github.com/enrique-guillen/sym_differ_cli/) for a CLI alternative to this web implementation.
