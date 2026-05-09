# <% name %>

<% description %>

## Ports

<% for port in ports %>
- `<% port %>` — <% if port == "8080" %>Web UI<% elif port == "8989" %>Web UI<% elif port == "7878" %>Web UI<% elif port == "8686" %>Web UI<% elif port == "6767" %>Web UI<% elif port == "8000" %>Web UI<% elif port == "9200" %>Web UI<% elif port == "3306" %>MySQL protocol<% else %>Application port<% endif %>
<% endfor %>

## Volumes

<% for volume in volumes %>
- `<% volume %>` — <% if volume == "/config" %>Configuration and database<% elif volume == "/data" %>Data directory<% elif volume == "/var/lib/mysql" %>Database storage<% else %>Application data<% endif %>
<% endfor %>

## Environment Variables

<!-- Add environment variables specific to <% name %> here -->
