script.module.web-pdb
#####################

``script.module.web-pdb`` is a port of my `Web-PDB`_ Python package modified for using in `Kodi mediacenter`_.
It is a web-interface for Python's built-in `PDB`_ debugger that can be used for remote debugging of
Python addons *in vivo*, that is, while running inside Kodi.
Except for modifications needed to run inside Kodi, all other Web-PDB/PDB functionality is left intact
so you can use all available documentation and tutorials for the PDB debugger
to learn how to debug your Python code.

.. figure:: https://raw.githubusercontent.com/romanvm/python-web-pdb/master/screenshot.jpg
  :alt: Web-PDB screenshot

  *Web-PDB console in Chrome browser*

Usage
=====

First you need to install ``script.module.web-pdb`` addon in your Kodi instance where you want to debug your addon.
An installable ZIP can be downloaded from `Releases`_ tab of this repository.

Then include ``script.module.web-pdb`` in your ``addon.xml`` as a dependency:

.. code-block:: xml

  <requires>
    ...
    <import addon="script.module.web-pdb" version="1.0"/>
  </requires>

Insert the following line into your addon code at the point where you want
to start debugging:

.. code-block:: python

  import web_pdb; web_pdb.set_trace()

The ``set_trace()`` call will suspend your program and open a web-UI at the default port ``5555``
(port value can be changed). Enter in your browser's address bar:
``http://<your Kodi machine hostname or IP>:5555``,
for example ``http://monty-python:5555``,
and you should see the Web-PDB UI. Now you can use all PDB commands and features.
Additional **Current file** and **Variables** information boxes help you better track your program runtime state.

**Warning**: it is strongly recommended to work with the Web-PDB web-UI only in one browser session.
With more than one browser window accessing the web-UI it can display incorrect data in one or more
browser sessions.

Subsequent ``set_trace()`` calls can be used as hardcoded breakpoints.

Additionally, Web-PDB provides ``catch_post_mortem`` context manager that can catch
unhandled exceptions raised within its scope and automatically start PDB post-mortem debugging session.
For example:

.. code-block:: python

  import web_pdb

  with web_pdb.catch_post_mortem():
      # Some error-prone code
      raise RuntimeError('Oops!')

For more detailed info about the Web-PDB API read docstrings in the ``/libs/web_pdb/__init__.py`` file.

License
=======

MIT license, see ``LICENSE.txt``.

.. _Web-PDB: https://github.com/romanvm/python-web-pdb
.. _Kodi mediacenter: https://kodi.tv
.. _PDB: https://docs.python.org/2/library/pdb.html
.. _Releases: https://github.com/romanvm/kodi.web-pdb/releases

