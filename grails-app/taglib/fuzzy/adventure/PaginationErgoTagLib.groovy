package fuzzy.adventure

import org.springframework.web.servlet.support.RequestContextUtils as RCU


class PaginationErgoTagLib {
	
	static namespace = 'custom'
	
    static encodeAsForTags = [tagName: 'raw']
	
	/**
	 * Creates next/previous links to support pagination for the current controller.<br/>
	 *
	 * &lt;g:paginate total="${Account.count()}" /&gt;<br/>
	 *
	 * @emptyTag
	 *
	 * @attr total REQUIRED The total number of results to paginate
	 * @attr action the name of the action to use in the link, if not specified the default action will be linked
	 * @attr controller the name of the controller to use in the link, if not specified the current controller will be linked
	 * @attr id The id to use in the link
	 * @attr params A map containing request parameters
	 * @attr prev The text to display for the previous link (defaults to "Previous" as defined by default.paginate.prev property in I18n messages.properties)
	 * @attr next The text to display for the next link (defaults to "Next" as defined by default.paginate.next property in I18n messages.properties)
	 * @attr omitPrev Whether to not show the previous link (if set to true, the previous link will not be shown)
	 * @attr omitNext Whether to not show the next link (if set to true, the next link will not be shown)
	 * @attr omitFirst Whether to not show the first link (if set to true, the first link will not be shown)
	 * @attr omitLast Whether to not show the last link (if set to true, the last link will not be shown)
	 * @attr max The number of records displayed per page (defaults to 10). Used ONLY if params.max is empty
	 * @attr maxsteps The number of steps displayed for pagination (defaults to 10). Used ONLY if params.maxsteps is empty
	 * @attr offset Used only if params.offset is empty
	 * @attr mapping The named URL mapping to use to rewrite the link
	 * @attr fragment The link fragment (often called anchor tag) to use
	 */
	def paginate = { attrs ->
		
        def writer = out
		
        if (attrs.total == null) {
            throwTagError("Tag [paginate] is missing required attribute [total]")
        }
        def messageSource = grailsAttributes.messageSource
        def locale = RCU.getLocale(request)

        def total = attrs.int('total') ?: 0
        def action = (attrs.action ? attrs.action : (params.action ? params.action : "list"))
        def offset = params.int('offset') ?: 0
        def max = params.int('max')
        def maxsteps = (attrs.int('maxsteps') ?: 10)

        if (!offset) offset = (attrs.int('offset') ?: 0)
        if (!max) max = (attrs.int('max') ?: 10)

        def linkParams = [:]
        if (attrs.params) linkParams.putAll(attrs.params)
        linkParams.offset = offset - max
        linkParams.max = max
        if (params.sort) linkParams.sort = params.sort
        if (params.order) linkParams.order = params.order

        def linkTagAttrs = [action:action]
        if (attrs.controller) {
            linkTagAttrs.controller = attrs.controller
        }
        if (attrs.id != null) {
            linkTagAttrs.id = attrs.id
        }
        if (attrs.fragment != null) {
            linkTagAttrs.fragment = attrs.fragment
        }
        //add the mapping attribute if present
        if (attrs.mapping) {
            linkTagAttrs.mapping = attrs.mapping
        }

        linkTagAttrs.params = linkParams

        def cssClasses = "pagination margin-none"
        if (attrs.class) {
            cssClasses = "pagination " + attrs.class
        }

        // determine paging variables
        def steps = maxsteps > 0
        int currentstep = (offset / max) + 1
        int firststep = 1
        int laststep = Math.round(Math.ceil(total / max))

		writer << "<div class=\"${cssClasses}\">"
        writer << '<ul>'
		
        // display previous link when not on firststep
        if (currentstep > firststep) {
            linkParams.offset = offset - max
            writer << '<li>'
            writer << link(linkTagAttrs.clone()) {
                (attrs.prev ?: messageSource.getMessage('paginate.prev', null, '&laquo;', locale))
            }
			writer << '</li>'
        }
        else {
            writer << '<li class="disabled">'
            writer << '<a href="#">'
			writer << (attrs.prev ?: messageSource.getMessage('paginate.prev', null, '&laquo;', locale))
			writer << '</a>'
            writer << '</li>'
        }

        // display steps when steps are enabled and laststep is not firststep
        if (steps && laststep > firststep) {
            linkTagAttrs.class = 'step'

            // determine begin and endstep paging variables
            int beginstep = currentstep - Math.round(maxsteps / 2) + (maxsteps % 2)
            int endstep = currentstep + Math.round(maxsteps / 2) - 1

            if (beginstep < firststep) {
                beginstep = firststep
                endstep = maxsteps
            }
            if (endstep > laststep) {
                beginstep = laststep - maxsteps + 1
                if (beginstep < firststep) {
                    beginstep = firststep
                }
                endstep = laststep
            }

            // display firststep link when beginstep is not firststep
            if (beginstep > firststep) {
                linkParams.offset = 0
                writer << '<li>'
                writer << link(linkTagAttrs.clone()) {firststep.toString()}
                writer << '</li>'
                writer << '<li class="disabled">...</li>'
            }

            // display paginate steps
            (beginstep..endstep).each { i ->
                if (currentstep == i) {
                    writer << '<li class="active">'
					writer << '<a href="#">'
					writer << i
					writer << '</a>'
                    writer << '</li>'
                }
                else {
                    linkParams.offset = (i - 1) * max
                    writer << '<li>';
                    writer << link(linkTagAttrs.clone()) {i.toString()}
                    writer << '</li>';
                }
            }

            // display laststep link when endstep is not laststep
            if (endstep < laststep) {
                writer << '<li class="disabled">'
                linkParams.offset = (laststep -1) * max
                writer << link(linkTagAttrs.clone()) { laststep.toString() }
                writer << '</li>'
            }
        }

        // display next link when not on laststep
        if (currentstep < laststep) {
            linkParams.offset = offset + max
            writer << '<li class="next">'
            writer << link(linkTagAttrs.clone()) {
                (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, '&raquo;', locale))
            }
            writer << '</li>'
        }
        else {
            linkParams.offset = offset + max
            writer << '<li class="disabled">'
			writer << '<a href="#">'
            writer << (attrs.next ? attrs.next : messageSource.getMessage('paginate.next', null, '&raquo;', locale))
			writer << '</a>'
            writer << '</li>'
        }

        writer << '</ul>'
		writer << '</div>'
	}
}
