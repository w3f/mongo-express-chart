{{/* Returns the full backend domain */}}
{{- define "mongo-express.backend-domain" -}}
{{ .Release.Name }}.{{ .Values.domain }}
{{- end }}

{{/* Returns the name of the TLS secret */}}
{{- define "mongo-express.tls-secret-name" -}}
{{ .Release.Name }}-tls
{{- end }}