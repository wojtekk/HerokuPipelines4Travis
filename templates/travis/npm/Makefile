deploy:
	hp4t init
	hp4t package build.tgz
	hp4t provision stage
	hp4t deploy-tarball build.tgz ${HP4T_HEROKU_APPNAME_STAGE}
#   hp4t run ${HP4T_HEROKU_APPNAME_STAGE} "npm run migrate-database"
	hp4t provision production
	hp4t promote ${HP4T_HEROKU_APPNAME_STAGE}
#   hp4t run ${HP4T_HEROKU_APPNAME_PRODUCTION} "npm run migrate-database"
