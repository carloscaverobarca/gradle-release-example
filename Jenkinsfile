/**
 * Copyright (C) 2017 the original author or authors.
 * 
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 * http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * @author 	Carlos Cavero
 *
 * Triggered when PR to develop. CI for gradle including build, tests and sonar QA
 */

node {
	def gradleHome
	gitlabBuilds(builds: ['Build', 'Test', 'QA']) {
		stage('Preparation') { // for display purposes
      // Get some code from GitLab
			git branch: "develop", url: "https://github.com/carloscaverobarca/gradle-release-example.git"

			// Get the Gradle tool.
			// ** NOTE: This 'Gradle 4.0' Gradle tool is the name configured
			// **       in the jenkins global configuration.           
			gradleHome = tool 'Gradle 4.0'
		}
   
		stage('Build') {
			gitlabCommitStatus(name: 'Build') {
				// Run the gradle build
				sh "'${gradleHome}/bin/gradle' clean build"
			}
		}
   
		stage('Test') {
			gitlabCommitStatus(name: 'Test') {
				// Run the gradle test
				sh "'${gradleHome}/bin/gradle' test"
			}
		}
   
		stage('QA') {
			gitlabCommitStatus(name: 'QA') {
				// Run the gradle sonar analysis
				sh "'${gradleHome}/bin/gradle' sonarqube"
			}
		}
	}
}