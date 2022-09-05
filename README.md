# Viper
Learn about VIPER design

View/ViewController:
- Responsable for user interface
- Maybe you get confuse using ViewController but in this pattern ViewControllers be the view as part of VIPER.
- We need a **reference** in the view to the *presenter*.

Interactor:
- Responsable for the interactor with the app such as Core data services, Netwroking Services, etc
- Should only have a **reference** to *presenter*.
- Interactor's job is to more or less get data or perform type of interaction
- When the interaction completed, interactor hand it to the presenter and then the presenter will take care of what to do with.

Presenter:
- **The glue that ties everything together**
- Has a **reference** to: 
  - Interactor
  - Router
  - View
 - Needs to present the view and tell the view what to do.

Entity:
- Simple as a model which the app is going to show.
- Doesn't have a reference to anything else.

Router:
- Common in other patterns as well
- Responsable of the navigation and route throughout the app.
- Router can route within it's own module.
- Doesn't have a reference to anything else.
- The entry point for the module
- Where the viper architecture starts.

