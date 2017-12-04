# Contributions Guidelines

## Where to start
Read the documentation available at the README and the wiki in order to get use to the project. Communicate with the responsible in case of doubts.

## Code of Conduct

Please try to follow the Kant’s Categorical imperative “act only according to that maxim whereby you can at the same time will that it should become a universal law” (Kant, Immanuel, (1785). Grounding for the Metaphysics of Morals). Follow the code of conduct described in the [Contributor Covenant](http://contributor-covenant.org/).

## Contributing to the repository
We are using [Gitflow workflow](https://atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) using develop branch for the features and master for the bug fixes. We get ideas from the [Github](https://guides.github.com/introduction/flow/index.html) and [GitLab](https://docs.gitlab.com/ce/workflow/gitlab_flow.html) workflow. The [workflow](gitBranchingModel) is adapted to be used with [Merge Requests](https://gitlab.atosresearch.eu/ari/pocket-mhealth/wikis/mergeRequestsAndCodeReview). Master and develop are [protected branches](https://docs.gitlab.com/ee/user/project/protected_branches.html) so this the only way of integrating the feature into develop. 

The Jenkins CI is automatically executed to build the source code, unit testing and [QA (using SonarQube) with those metrics](https://gitlab.atosresearch.eu/ari/pocket-mhealth/wikis/qualityAssuranceAndMetrics). It is advisable to include two Code Reviewers as second line of defence to integrate the modifications.

Follow the [message conventions for the commits](https://gitlab.atosresearch.eu/ari/pocket-mhealth/wikis/gitBranchingModel#git-commit) and the [Code Conventions](https://gitlab.atosresearch.eu/ari/pocket-mhealth/wikis/codeConventionsAndQuality). In any case the administrator and the code reviewers will contact the developer through the Merge Request open. Remember to commit and integrate early and often to ease the integration process.

Features and bug fixes must be linked to an issue, so the first step before contributing is the **creation of an issue**. The issue then must have **its own branch starting from develop branch** (master branch in case of bug fixes).

Please [do not ignore Exceptions](https://source.android.com/source/code-style.html), use documentation and comments, unit testing and coverage, include pending work using // TODO and be consistent learning as much as possible from the source code already available.

Another important thing when you are contributing to the repository is the language. Please write everything in english, comments, documentation, issues, commits and merge requests.

##	License
**IMPORTANT!** List all the third party licenses in the file THIRD-PARTY-LICENSES in order to avoid restrictions from them and readjust your implementation. We found good documentation about licenses [here](https://wiki.duraspace.org/display/DSPACE/Code+Contribution+Guidelines).
