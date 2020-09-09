apiVersion: apps/v1
kind: Deployment
metadata:
  name: ai-ml
  namespace: ai-test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ai-ml
  template:
    metadata:
      labels:
        app: ai-ml
    spec:
      containers:
      - image: DOCKER_REPO_NAME:DOCKER_IMAGE_TAG
        imagePullPolicy: Always
        name: ai-ml
        ports:
        - containerPort: 8050
          name: web
        readinessProbe:
          httpGet:
            path: /
            port: 8050
          initialDelaySeconds: 30
          periodSeconds: 30
        livenessProbe:
          httpGet:
            path: /
            port: 8050
          periodSeconds: 30
