package com.projeto.clp.security

import groovy.util.logging.Slf4j
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import com.odobo.grails.plugin.springsecurity.rest.credentials.AbstractJsonPayloadCredentialsExtractor

import javax.servlet.http.HttpServletRequest

@Slf4j
class ProjetoCLPJsonPayloadCredencialsExtractor extends AbstractJsonPayloadCredentialsExtractor {
   
    UsernamePasswordAuthenticationToken extractCredentials(HttpServletRequest httpServletRequest) {
        def jsonBody = getJsonBody(httpServletRequest)

        String username = jsonBody.usuario
        String password = jsonBody.senha
        String imei = jsonBody.imei

        log.debug "Extracted credentials from JSON payload. Username: ${username}, password: ${password?.size()?'[PROTECTED]':'[MISSING]'}, IMEI: ${imei}"

        new UsernamePasswordAuthenticationToken(username, [password, imei])
    }

}