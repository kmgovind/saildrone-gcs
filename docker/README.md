# Ground-station containers

The Compose stack has three services:

- `mavlink-router` owns the RFD900+ serial device and exposes TCP port 5760.
- `mavros` converts the PX4 MAVLink stream into ROS 2 Lyrical topics.
- `foxglove-bridge` serves ROS data at `ws://localhost:8765`.

Foxglove Desktop and QGroundControl run natively. QGroundControl receives the
router's UDP stream on localhost port 14550.

## Configure the radio

Find the persistent device path:

```bash
ls -l /dev/serial/by-id/
```

Copy `.env.example` to `.env` and replace the placeholder, or export the value:

```bash
export RFD900_DEVICE=/dev/serial/by-id/your-rfd900-device
./tools/gcs-up.sh
```

The default serial baud is 57600. It must match the local RFD900+ serial setting
and can be changed in `config/mavlink-router.conf` after hardware verification.

Stop the stack with:

```bash
./tools/gcs-down.sh
```

The stack uses host networking and Linux device passthrough. It is intended for
the supported Ubuntu 26.04 deployment laptop, not Docker Desktop on macOS or
Windows.
