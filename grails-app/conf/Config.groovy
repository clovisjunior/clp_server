// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
    all:           '*/*', // 'all' maps to '*' or the first available format in withFormat
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    hal:           ['application/hal+json','application/hal+xml'],
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// Legacy setting for codec used to encode data with ${}
grails.views.default.codec = "html"

// The default scope for controllers. May be prototype, session or singleton.
// If unspecified, controllers are prototype scoped.
grails.controllers.defaultScope = 'singleton'

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        filteringCodecForContentType {
            //'text/html' = 'html'
        }
    }
}
 
grails.converters.encoding = "UTF-8"
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
	
	debug  'com.odobo',
		   'grails.app.controllers.com.odobo',
		   'grails.app.services.com.odobo',
		   'org.pac4j',
		   'org.springframework.security'
}


// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.rememberMe.persistent = true
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.projeto.clp.Usuario'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.projeto.clp.UsuarioPapel'
grails.plugin.springsecurity.authority.className = 'com.projeto.clp.Papel'
grails.plugin.springsecurity.securityConfigType = 'InterceptUrlMap'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.interceptUrlMap = [
	'/js/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/css/**':					['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/images/**':				['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/administrador/**': 		['ROLE_ADMIN'],
	'/departamento/**': 		['ROLE_USER'],
	'/dispositivoMovel/**': 	['ROLE_USER'],
	'/entidade/**': 			['ROLE_USER', 'ROLE_ADMIN'],
	'/maquina/**': 				['ROLE_USER'],
	'/unidadeDeNegocio/**': 	['ROLE_USER'],
	'/escravoMaquina/**': 		['ROLE_USER'],
	'/registradorEscravo/**':	['ROLE_USER'],
	'/usuarioMovel/**': 		['ROLE_USER'],
	'/alarme/**':       		['ROLE_USER'],
	'/ocorrenciaAlarme/**':		['ROLE_USER'],
	'/*':            			['ROLE_USER', 'ROLE_ADMIN'],
	'/login/**':				['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/logout/**':				['IS_AUTHENTICATED_ANONYMOUSLY'],
	'/api/**':                  ['ROLE_USER_MOVEL']
]

grails.plugin.springsecurity.filterChain.chainMap = [
	'/api/**': 'JOINED_FILTERS,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter',  // Stateless chain
	'/**': 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter'                                          // Traditional chain
]

grails.plugin.springsecurity.rest.login.active = true
grails.plugin.springsecurity.rest.login.endpointUrl = '/api/login'


grails.plugin.springsecurity.rest.login.useJsonCredentials = true
grails.plugin.springsecurity.rest.login.usernamePropertyName = 'usuario'
grails.plugin.springsecurity.rest.login.passwordPropertyName = 'senha'

grails.plugin.springsecurity.rest.token.storage.useGorm = true
grails.plugin.springsecurity.rest.token.storage.gorm.tokenDomainClassName = 'com.projeto.clp.UsuarioMovelToken'
grails.plugin.springsecurity.rest.token.storage.gorm.tokenValuePropertyName = 'token'
grails.plugin.springsecurity.rest.token.storage.gorm.usernamePropertyName = 'usuarioMovel'

grails.plugin.springsecurity.rest.token.generation.useSecureRandom = true
//
//grails.plugin.springsecurity.providerNames = ['apiAuthenticationProvider', 'daoAuthenticationProvider', 'anonymousAuthenticationProvider', 'rememberMeAuthenticationProvider']