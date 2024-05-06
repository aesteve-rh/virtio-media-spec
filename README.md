# virtIO-media-spec

This LaTeX project aims to document the specification of the virtIO-media device.

## Overview

This is a virtio protocol definition, companion Linux guest kernel driver, and set of host-side devices for virtualizing media devices using virtio, following the same model (and structures) as V4L2. It can be used to virtualize cameras, codec devices, or any other device supported by V4L2.

Original specification available at https://github.com/chromeos/virtio-media.

## Building instructions

The project works with definitions extracted from https://github.com/oasis-tcs/virtio-spec.
Therefore, it is compatible with `virtio-spec` and can be either built as a stand-alone project
or as part (i.e., a Section) of the full virtIO specification document.

**Fedora**:

    sudo dnf install texlive-scheme-full

**Ubuntu and other Debian derivatives:**

    sudo apt-get install texlive-full

**To generate the pdf file (standalone):**

    ./makepdf.sh

**To generate the full virtIO specification document:**

Link the `media` folder inside the `device-types` folder of the `virtio-spec`
project and apply this patch:

```
diff --git a/content.tex b/content.tex
index 0a62dce..a0277c0 100644
--- a/content.tex
+++ b/content.tex
@@ -762,6 +762,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/rpmb/description.tex}
 \input{device-types/iommu/description.tex}
 \input{device-types/sound/description.tex}
+\input{device-types/media/description.tex}
 \input{device-types/mem/description.tex}
 \input{device-types/i2c/description.tex}
 \input{device-types/scmi/description.tex}
```

After than you can just run:

    ./makepdf.sh

## License

For definitons coming from `virtio-spec` project, please see the
[OASIS License](https://github.com/oasis-tcs/virtio-spec/blob/master/LICENSE.md)
for terms and policies applicable. This project files are licensed
under the [GPLv3](./LICENSE) license.
