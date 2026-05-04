$url = 'https://api.sgsseguranca.com.br/storage/download/eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXAiOiJkb2N1bWVudF9kb3dubG9hZCIsImdpZCI6IjVlNzA0MzBjLWU1MDMtNDI0NC04MzA2LTA3NTAyZDk4ZDcyOSIsImNvbXBhbnlJZCI6IjIyNTMyOTI0LTA1NWMtNDFhMC1iMGIyLTIwY2E5MWE3MWIzMSIsImtleSI6ImRvY3VtZW50cy8yMjUzMjkyNC0wNTVjLTQxYTAtYjBiMi0yMGNhOTFhNzFiMzEvYXBycy9zaXRlcy8yNjFhMmMzYi0zYjRlLTQyOWQtOTE0OC0zYTA4ZDBlNGFhYTYvM2I2ZjNiYjktMTY4NS00NTU2LTlmZTEtYTNhNzk1Njk1ZmI5LzE3Nzc4NjI0MDk1NzQtMDAxX3YxLnBkZiIsImlhdCI6MTc3Nzg2MjQxNiwiZXhwIjoxNzc3ODYzMzE2fQ.P3FbXZ2iXM-9oE60gZgP__coATnPatXJAGTVXkTymiw'
$response = Invoke-WebRequest -Uri $url -Method Head
Write-Output ('HEAD=' + $response.StatusCode)
Write-Output ('TYPE=' + $response.Headers['Content-Type'])
Write-Output ('LENGTH=' + $response.Headers['Content-Length'])
