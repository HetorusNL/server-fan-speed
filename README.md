# Server Fan Speed

Set Dell PowerEdge R210 ii fan speed (automatic/manual/speed) using Python3 with web interface

## Usage

### Recommended

- Install Docker
- Clone the repository
- Modify the environment in config.env
- Run the included docker compose file, e.g.: `sudo docker compose up` or in detached mode: `sudo docker compose up -d`
- After the docker container has started, the website is available at `localhost:8000`

### Alternative (not recommended)

- python3 should be installed, and callable via `/usr/bin/python3`.
- ipmitool should be installed (can be installed by running: `sudo apt install ipmitool`)
- this directory could be moved into the /opt/ directory (optional)
- the server-fan-speed.service should be modified to:
  - have the correct WorkingDirectory specified
  - have the correct ExecStart specified (python3 launchable via `/usr/bin/python3`)
  - change User to `<your-username>`
- the server-fan-speed.service service should be moved to `/etc/systemd/system/`

#### Enabling / Starting the Service

the service can be enabled and started on boot by the following commands:  
`sudo systemctl enable server-fan-speed.service`  
`sudo systemctl start server-fan-speed.service`

after the service is started, the website should be available on `localhost:8000`

## GitHub Actions and container builds

A GitHub Actions workflow is included at [.github/workflows/ci.yml](.github/workflows/ci.yml). It builds the container image on pushes to the default branch, pull requests, and manual runs, and publishes it to GitHub Container Registry and Docker hub when the workflow runs outside pull requests.

## Debugging

logs are shown in the docker logs or in `/var/log/syslog` when not using the recommended method, and more debugging information is available by manually running `uv run main.py` in the root directory of this repository, and observing the output.

## License

MIT License, Copyright (c) 2026 Tim Klein Nijenhuis <tim@hetorus.nl>
