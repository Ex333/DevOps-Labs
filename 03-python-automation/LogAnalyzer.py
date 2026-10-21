logs = [
    "INFO Server started",
    "ERROR Database connection failed",
    "WARNING High memory usage",
    "INFO Health check passed",
    "ERROR Connection timeout",
    "INFO Server stopped"
]
info_couner = 0
error_counter = 0
warning_counter = 0 


for log in logs:
    if log.lower().startswith("info"):
        info_couner += 1
    elif log.lower().startswith("error"):
        error_counter += 1
    elif log.lower().startswith("warning"):
        warning_counter += 1
    else:
        print("invalid value!")

print(info_couner)
print(error_counter)
print(warning_counter)