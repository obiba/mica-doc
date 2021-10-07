Caching
=======

Summary
-------

The Administration menu is available to users with the role ``mica-administrator``. This menu gives access to server configuration and status.

Definitions
-----------

All available caches are listed in the first table under Type . If one or many of these caches becomes desynchronized or do not behave as
expected, you may trash the content of the cache so that it will have to be rebuilt. This is done using the trash can icon under the title Action .

There is also an option to build the cache for Dataset variables statistics by clicking the play icon at the right. This specific cache is, by far, the
biggest of those used by Mica and may take seconds to hours to build depending on the size of the dataset and various other factors. Having a
control over the build is convenient since, for instance, one may want to disconnect Opal from Mica, since the cache is built from the data
contained in Opal, the cache has to be functional before the disconnection so that it may continue to work.
