

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'casarural.auth.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'casarural.auth.UserRole'
grails.plugin.springsecurity.authority.className = 'casarural.auth.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',                      access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/error',                 access: ['permitAll']],
	//[pattern: '/index',                 access: ['IS_AUTHENTICATED_FULLY']],
	[pattern: '/index',                 access: ['permitAll']],
	//[pattern: '/index.gsp',             access: ['IS_AUTHENTICATED_FULLY']],
    [pattern: '/index.gsp',             access: ['permitAll']],
	[pattern: '/shutdown',              access: ['permitAll']],
	[pattern: '/assets/**',             access: ['permitAll']],
	[pattern: '/**/js/**',              access: ['permitAll']],
	[pattern: '/**/css/**',             access: ['permitAll']],
	[pattern: '/**/images/**',          access: ['permitAll']],
	[pattern: '/**/favicon.ico',        access: ['permitAll']],
    [pattern: '/dbconsole/**',          access: ['ROLE_ADMIN']],
    [pattern: '/plugins/**',            access: ['ROLE_USER']],
    [pattern: '/user/**',               access: ['ROLE_ADMIN']],
    [pattern: '/role/**',               access: ['ROLE_ADMIN']],
    [pattern: '/securityInfo/**',       access: ['ROLE_ADMIN']],
    [pattern: '/registationCode/**',    access: ['ROLE_ADMIN']],
    [pattern: '/register/**',           access: ['permitAll']],
	[pattern: '/api/login',          	access: ['permitAll']],
	[pattern: '/api/logout',        	access: ['isFullyAuthenticated()']],
//	[pattern: '/api/habitacion',    	access: ['isFullyAuthenticated()']],
    [pattern: '/**',                    access: ['isFullyAuthenticated()']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
//	[pattern: '/**',             filters: 'JOINED_FILTERS']
    [pattern: '/api/**',         filters:'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter'],
    [pattern: '/**',             filters:'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter']
]


grails.plugin.springsecurity.rememberMe.persistent = true
grails.plugin.springsecurity.rememberMe.persistentToken.domainClassName = 'casarural.auth.PersistentLogin'
grails.plugins.springsecurity.ui.register.postRegisterUrl= '/welcome'
grails.plugins.springsecurity.ui.forgotPassword.postResetUrl = '/welcome'

grails.plugin.springsecurity.rest.logout.endpointUrl = '/api/logout'
grails.plugin.springsecurity.rest.token.validation.useBearerToken = false
grails.plugin.springsecurity.rest.token.validation.headerName = 'X-Auth-Token'
grails.plugin.springsecurity.rest.token.storage.memcached.hosts = 'localhost:11211'
grails.plugin.springsecurity.rest.token.storage.memcached.username = ''
grails.plugin.springsecurity.rest.token.storage.memcached.password = ''
grails.plugin.springsecurity.rest.token.storage.memcached.expiration = 86400

grails.plugin.springsecurity.rest.token.storage.useGorm = true
grails.plugin.springsecurity.rest.token.storage.gorm.tokenDomainClassName = 'casarural.auth.AuthenticationToken'

grails.plugin.springsecurity.rest.token.generation.useSecureRandom = true
grails.plugin.springsecurity.rest.token.generation.useUUID = false

