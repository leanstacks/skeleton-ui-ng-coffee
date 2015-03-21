# Project Skeleton for Angular.js

## Acknowledgements

This is a [LEAN**STACKS**](http://www.leanstacks.com) solution.

## Getting Started

This is a project skeleton for an [Angular.js](https://angularjs.org/) Single-Page Application, or SPA.  

## Languages

This project is authored in [CoffeeScript](http://coffeescript.org).

## Installation

### Fork the Repository

Fork the [Angular.js project skeleton](https://github.com/mwarman/skeleton-ui-ng-coffee) on GitHub.  Clone the forked project to the host machine.

### Dependencies

The project requires the following dependencies be installed on the host machine:

* Node.js (node)
* Node Package Manager (npm)
* Gulp Command Line Interface (gulp)
* Karma Command Line Interface (karma)

After installing the dependencies, initialize the project.  Open a terminal window, navigate to the project base directory, and issue this command:

```
npm install
```

The node package manager, a.k.a. `npm` retrieves all project dependencies, installing them into the `/node_modules` sub-directory.

## Running

The project uses [Gulp](http://gulpjs.com) for build, package, and test workflow automation.  The following Gulp tasks are defined.

### Default

The default Gulp task performs the following workflow steps:

* cleans the distribution directory
* performs *lint* checks on the CoffeeScript
* compiles and uglifies the CoffeeScript
* minifies the CSS
* copies the HTML to the distribution directory
* copies the images to the distribution directory
* copies the data to the distribution directory
* copies the third-party libraries to the distribution directory

The default Gulp task performs basic project validation and the means to check CoffeeScript for syntax errors without starting a local web server.

To execute the default Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp
```

### Run

The **run** Gulp task performs all of the same workflow steps as the default task and also:

* watches source directories for changes
* republishes source files to the distribution directory when changes occur
* starts a HTTP server on the local host
* reloads the index HTML page when changed source files are republished

The **run** Gulp task is designed to allow engineers the means to rapidly make application changes on their local machines.  This task is not intended for use in a server environment.

To execute the **run** Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp run
```

Open a browser and go to http://localhost:9000/index.html to use the application.

To stop the HTTP server press `ctrl-C` in the terminal window.

### Test

The **test** Gulp task performs all of the same workflow steps as the default task and also:

* executes the unit test suites

The **test** Gulp task is designed to allow engineers the means to run the unit test suites against the main source code.  This task may also be used on continuous integration servers such as Jenkins, etc.

To execute the **test** Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp test
```

### Dist

The **dist** Gulp task performs all of the same workflow steps as the default task and also:

* creates a single, compressed distribution file suitable for server deployment

The **dist** Gulp task is designed to allow development operations, a.k.a. DevOps, staff the means to produce an application artifact prepared for server deployment.

To execute the **dist** Gulp task, type the following command at a terminal prompt in the project base directory.

```
gulp dist
```
