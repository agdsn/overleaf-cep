FROM overleafcep/sharelatex:6.3.0-ext-v5.1

RUN tlmgr update --self --all && \
	tlmgr install scheme-full

COPY patches/ /tmp/patches/
RUN patch /overleaf/services/web/app/src/Features/Project/ProjectGetter.mjs < /tmp/patches/ProjectGetter.mjs.patch
RUN patch /overleaf/services/web/app/src/Features/Authorization/AuthorizationManager.mjs < /tmp/patches/AuthorizationManager.mjs.patch
