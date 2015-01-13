MyMoney
=======

MyMoney is a example/showcase project that focuses on [Apache Sling](http://sling.apache.org/) with the use of [AngularJS](https://angularjs.org/).

How to build?
-------------
The app is tested with [Sling Standalone Application 7](http://sling.apache.org/downloads.cgi). 
Dependencies - Servlets Compat	1.0.2 needs to be installed in OSGi.

Build it using Java 7 and Maven 3:

    mvn clean install -PautoInstallBundle
    
'autoInstallBundle' profile will install the app on Sling instance running on default port.
