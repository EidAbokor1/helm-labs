{{/*
A default message string to be used when checking for a required value
*/}}
{{- define "mylibcharts.default-check-required-msg" -}}
{{- "No value found for '%s' in mylibcharts template" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "mylibcharts.labels" -}}
app: {{ .Values.namespace | quote }}
app.kubernetes.io/name: {{ .Values.deployment.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "mylibcharts.selector-labels" -}}
app.kubernetes.io/name: {{ .Values.deployment.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}