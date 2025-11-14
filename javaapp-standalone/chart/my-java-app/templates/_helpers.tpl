{{- define "my-java-app.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "my-java-app.fullname" -}}
{{- printf "%s-%s" (include "my-java-app.name" .) .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "my-java-app.labels" -}}
app.kubernetes.io/name: {{ include "my-java-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

