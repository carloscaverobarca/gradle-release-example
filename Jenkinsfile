node("docker-slave") {
    List<String> totalBuilds = ['Build', 'Test'] 
    if (env.BRANCH_NAME == "master") {
        totalBuilds = [ 'Build', , 'Test', 'QA', 'Deploy' ]
    }
    if (env.BRANCH_NAME == "release") {
        totalBuilds = ['Build', , 'Test', 'Release', 'Changelog', 'Push' ]
    }
	gitlabBuilds(builds: totalBuilds) {
		// This builds the maven image sharing the maven local repository of the VM
		docker.image("gradle:4.7.0-jdk8").inside("-v gradle-cache:/home/gradle/.gradle") {       
			// Execute the following code inside the container
			stage('Preparation') {
				// Get some code from GitLab in the slave
				git 'https://github.com/carloscaverobarca/gradle-release-example.git'
			}


			stage('Build') {
				// Run the gradle clean and build
				sh "gradle clean build"
			}
		   
			stage('Test') {
				// Run the gradle tests
				sh "gradle test"
			}
			
			withCredentials([string(credentialsId: '1c52929e-8148-421b-8928-7cfb7a0af3da', variable: 'sonarLogin'),
			    string(credentialsId: '3d8b9c9e-1330-40ed-a4d6-95c364a814bd', variable: 'sonarPassword'),
			    string(credentialsId: 'a72d9bef-5bca-4bd0-b476-dc5dd6da375c', variable: 'sonarHostUrl')]) {
		    // withEnv(['sonarHostUrl=https://ciserver.atosresearch.eu/sonar']) {
                if (env.BRANCH_NAME == "master") {
                    stage('QA') {
    			        // Run the gradle sonar analysis
    			        // sh 'printenv'
    			        sh "gradle sonarqube"
    		        }
                }
            // }
			}
			
			// GITHUB_API_TOKEN
			withCredentials([string(credentialsId: 'nexus-user', variable: 'nexusUsername'),
			    string(credentialsId: 'nexus-password', variable: 'nexusPassword'),
			    string(credentialsId: 'nexus-snapshot-url', variable: 'nexusSnapshotUrl'),
			    string(credentialsId: 'nexus-release-url', variable: 'nexusReleaseUrl'),
			    string(credentialsId: 'github-token', variable: 'GITHUB_API_TOKEN')]) {
                if (env.BRANCH_NAME == "master") {
    			    stage('Deploy') {
    				    // Run the gradle test
    				    sh "gradle uploadArchives"
    			    }
                }
    			    
		     withEnv(['GIT_COMMITTER_NAME=Carlos Cavero', 'GIT_COMMITTER_EMAIL=carlos.cavero@atos.net']) {
                if (env.BRANCH_NAME == "release") {
    			    stage('Release') {
    				    // Run the gradle release
						sh "rm -r ?"
    				    sh "gradle clean release -Prelease.useAutomaticVersion=true"
    			    }

            		stage('Changelog') {
            			// Run the automatic changelog generation
            			sh "gradle generateChangelog"
            		}
            
            		stage('Push') {
            			// Commit and push (also tags) with ssh credentials
            			sh "chmod +x ./push.sh && ./push.sh"
            		}
    			}
				}
            }
            
		}
	}
}