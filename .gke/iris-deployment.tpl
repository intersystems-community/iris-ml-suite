apiVersion: apps/v1
kind: Deployment
metadata:
  name: iris-ml
  namespace: ai-test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: iris-ml
  template:
    metadata:
      labels:
        app: iris-ml
    spec:
      containers:
      - image: DOCKER_REPO_NAME:DOCKER_IMAGE_TAG
        imagePullPolicy: Always
        name: iris-ml
        lifecycle:
          postStart:
            exec:
              command:
              - /bin/bash
              - -c
              - |
                sleep 30
                /opt/iris-ml/post_start_hook
        ports:
        - containerPort: 52773
          name: web
        readinessProbe:
          httpGet:
            path: /csp/sys/UtilHome.csp
            port: 52773
          initialDelaySeconds: 30
          periodSeconds: 30
        livenessProbe:
          httpGet:
            path: /csp/sys/UtilHome.csp
            port: 52773
          periodSeconds: 30
