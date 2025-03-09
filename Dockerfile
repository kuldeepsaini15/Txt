FROM python:3.9.6-alpine3.14

WORKDIR /app

COPY . .

# Update package index and install dependencies
RUN apk update     && apk add --no-cache gcc libffi-dev musl-dev ffmpeg     && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community aria2     && pip install --no-cache-dir -r requirements.txt

# Run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
