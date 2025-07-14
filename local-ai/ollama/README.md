curl http://localhost:11434/api/version

curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "Why is the sky blue?"
}'

curl http://localhost:11434/api/generate -d '{
  "model": "deepseek-r1",
  "prompt": "為何天空是藍色的？",
}'

###

ollama pull mistral
ollama pull deepseek-r1
ollama pull gemma3
