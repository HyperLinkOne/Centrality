## ADR 1:

### Decision
We have decided to use the `Symfony HttpClient` as our HTTP Client for making external api requests

###  Context
The project requires a reliable, flexible and well supported Http Client for communication with external services

### Rationale
- `Symfony HttpClient` offers a straightforward and powerfull abstraction for HTTP requests, while it is well integrated in the symfony eco system
- supports asynchronous requests and easy handling of concurrent requests.


### Consequences
- this decision ties the project mode closley to the symfony framework.
- Simplified maintainance and update since this is part of symfoy core.
