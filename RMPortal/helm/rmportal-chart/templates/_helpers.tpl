{{/*
Expand the name of the chart.
*/}}
{{- define "rmportal-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rmportal-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rmportal-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rmportal-chart.labels" -}}
app: {{ include "rmportal-chart.fullname" . }}
{{- if .Values.labels }}
{{- range $key, $value := .Values.labels }}
{{ $key }}: {{ $value }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rmportal-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rmportal-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rmportal-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rmportal-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "helpers.secret-env-variables"}}
{{- range .Values.secretRef }}
- secretRef:
    name: {{ . }}
{{- end}}
{{- end }}

{{- define "helpers.configmap-env-variables"}}
{{- range .Values.configmapRef }}
- configMapRef:
    name: {{ . }}
{{- end}}
{{- end }}

{{/* Create Environment variables file */}}
{{- define "helpers.env-variables"}}
{{- range $key, $val := .Values.env }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end}}
{{- end }}