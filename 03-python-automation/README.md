Python Server Health Checker

About the Project

This project is part of my Python for DevOps learning path.

The goal is to build a Python script that checks whether a remote server and a selected TCP port are reachable. The script records monitoring results and connection errors in a log file.

Features

Check TCP connectivity to a remote host.

Configure the target hostname and port.

Handle connection errors and timeouts.

Log successful connections and failures.

Build a foundation for automated server monitoring.

Technologies

Python 3

Linux

Git and GitHub

Python standard library: socket, logging

Project Structure

06-server-health-checker/
├── server_health.py
├── README.md
└── logs/
    └── .gitkeep

How to Run

Make sure Python 3 is installed.

Open a terminal in the project directory.

Run the script:

python3 server_health.py

Learning Objectives

Understand TCP connections and ports.

Practice exception handling with try and except.

Learn how to use Python logging.

Understand connection timeouts.

Build practical automation tools for DevOps.

Future Improvements

Accept hostnames and ports as command-line arguments.

Check multiple servers.

Monitor disk usage and system services.

Generate monitoring reports.

Add automated tests with pytest.

Package the application using Docker.

Status

In progress — this project is being developed as part of my DevOps portfolio.