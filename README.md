Sinatra Application that tracks people, events, and registrations.

Three tables:
Person: name, date-of-birth, gender and zip-code
Events: name, date
Registrations: who is registering (person_id), what they are registering for (event_id), and status: a text field containing: coming, not coming, maybe.

At the url ./persons lists all the persons
At the url ./events lists all the events
At the url ./registrations lists all the registrations
At the url ./person/new: displays a form allowing the creation of a person
At the url ./event/new: displays a form allowing the creation of a event
At the url ./registration/new: displays a form allowing the creation of a registrations
