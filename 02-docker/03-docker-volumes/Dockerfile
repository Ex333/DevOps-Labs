
FROM python:3.13-slim

LABEL maintainer="Exx"

WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

RUN useradd -m appuser

# Copy application and assign ownership
COPY --chown=appuser:appuser . .


RUN mkdir -p /data && chown appuser:appuser /data


USER appuser

EXPOSE 5000

CMD ["python", "app.py"]
