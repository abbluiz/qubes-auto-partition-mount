# qubes-auto-partition-mount

## Motivation

If you want partitions to be automatically mounted on your qube in Qubes OS, you'll have to manually do so. You'll also have to unmount it when you are done using it. This can be very inconvenient if you think about assigning different partitions to each of your qubes and have them be nicely mounted for you each time.

## Purpose

This collection of Shell Scripts should be useful to configure your VMs to accept a list of partitions or other mass storage devices by label or uuid and mount them every time they're attached, as well as unmount them every time they are no longer there.

## Status

It is in early development. See issues page for more information.
