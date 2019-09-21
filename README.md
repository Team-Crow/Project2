
# Application Lifecycle Management

The ALM used for this project was a package model, updating package with new metadata from Scratch orgs and then tested and pushed to the production org. The version control system used was Git, with Github as a resource.
### Package Development Model

We implemented the package development model which allowed us to create self-contained applications that we deployed to our production org as a single package. These packages are typically developed against source-tracked orgs called scratch orgs. This development model is geared toward a more modern type of software development process that uses org source tracking, source control, and continuous integration and deployment.



when we started our intial developing we used scratch orgs, use the command `SFDX: Create Project` (VS Code) or `sfdx force:project:create` (Salesforce CLI)  to create your project. If you used another command, you might want to start over with that command.

When working with source-tracked orgs, use the commands `SFDX: Push Source to Org` (VS Code) or `sfdx force:source:push` (Salesforce CLI) and `SFDX: Pull Source from Org` (VS Code) or `sfdx force:source:pull` (Salesforce CLI). Do not use the `Retrieve` and `Deploy` commands with scratch orgs.

### Org Development Model

Our org development model allows you to connect directly to a non-source-tracked org ( Developer Edition (DE) org, and a production org) to retrieve and deploy code directly.  Using tools such as Force.com IDE and Visual Code.



## The `sfdx-project.json` File

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

The most important parts of this file for getting started are the `sfdcLoginUrl` and `packageDirectories` properties.

The `sfdcLoginUrl` specifies the default login URL to use when authorizing an org.

The `packageDirectories` filepath tells VS Code and Salesforce CLI where the metadata files for your project are stored. You need at least one package directory set in your file. The default setting is shown below. If you set the value of the `packageDirectories` property called `path` to `force-app`, by default your metadata goes in the `force-app` directory. If you want to change that directory to something like `src`, simply change the `path` value and make sure the directory you’re pointing to exists.

```json
"packageDirectories" : [
    {
      "path": "force-app",
      "default": true
    }
]
```

## Part 2: Working with Source

For developing purposes we used scratch orgs. [Package Development Model with VS Code](https://forcedotcom.github.io/salesforcedx-vscode/articles/user-guide/package-development-model).


## Deploying to Production


 WE deployed our changes to production using [packaging](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_dev2gp.htm).

# Data Model
**![](https://lh6.googleusercontent.com/AovijzxV_iXdhye3wMZVNupK5CzlkPjI-VS9XqM6oR2XUdvFJt_rlUtE1NB6LcehpiA6n-z9UhNKy2zWCxSgqVm_c-E7vfOmXQV1p85svaWre1COuW_YUd0xAcb6RNuc0oabWgL9gaY)**


- The standard **Users Object**  is a Many -to- Many loosely coupled ***Look-up*** relationship to the **Team Object** with a ***junction*** object **Player** which allows users to also create a player name outside of using their username and join a team.
- The **Player object** has a one to many ***Master-Detail*** relationship with the **Attempt Object**.
- The **Attempt object** has a one to many ***Master-Detail***  relationship with the **Answer object**, each attempt can have many answers. 
- The **Quiz object** has a one to many ***look-up*** relationship to the **Attempt object** allowing fields on the attempt to be referenced  and a **Master-detail**  relationship with **Question object** as each quiz is closely related to the Question object allowing for roll-up summaries.  ***Each quiz can have many questions and each quiz can be attempted multiple times*** .
- The **Question object** has a one to many ***look-up*** relationship to the Answer object as each Question object can have many answers associated to it.

# Design
For design of the communities page, we leveraged **Visual Force Pages** (VFP) and the **Community page builder** to create a player and management community with multiple linked pages. The design process incorporated ***VFP components*** such as ***apex:page*** and ***apex:dataTable*** as well as **HTML elements** to take advantage of placement with ***DIV***  and ***flex-box model***. **Bootstrap** was also used to implement the table designs for the leaderboards and player information boards as well as the power behind the flex-box model. We also implemented a custom **CSS** file to manipulate the colors and fonts especially for ***dataTables***. Each page was created individually and uploaded to the development org and then put together for a uniformed look and feel. Data that is displayed on the VFP are retrieved from controllers with get methods to query the database for player scores, teams, names, and averages. 
Pages consist of 
* Home page
* Player-create page
* Knowledge articles
* Team information page.
***
# Flow
***enter info here*** 
****
# Support Process
***enter info here***
***
# Knowledge Articles 
***Info here***
***
