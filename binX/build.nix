{pkgs, nozzle}:

self: super:
{
  binX = nozzle.add-subdirectory ./binX;
}
