#!/usr/bin/env python
import pyudev

print 'Partitions: '
for device in pyudev.Context().list_devices(subsystem='block', DEVTYPE='partition'):
	print('\t{0} ({1})'.format(device.device_node, device.get('ID_FS_TYPE')))