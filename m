Received: from hillosipuli.retiisi.eu (retiisi.eu [95.216.213.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91F572
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 11:16:54 +0000 (UTC)
Received: from lanttu.localdomain (unknown [192.168.2.193])
	by hillosipuli.retiisi.eu (Postfix) with ESMTP id 05F57634C87;
	Mon, 12 Apr 2021 14:10:35 +0300 (EEST)
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mitali Borkar <mitaliborkar810@gmail.com>,
	bingbu.cao@intel.com,
	tian.shu.qiu@intel.com,
	mchehab@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in,
	laurent.pinchart@ideasonboard.com
Subject: [PATCH 1/1] staging: ipu3-imgu: Move the UAPI header from include under include/uapi
Date: Mon, 12 Apr 2021 14:11:20 +0300
Message-Id: <20210412111120.31625-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The header defines the user space interface but may be mistaken as
kernel-only header due to its location. Add "uapi" directory under
driver's include directory and move the header there.

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/admin-guide/media/ipu3.rst      | 35 ++++++++++---------
 .../media/v4l/pixfmt-meta-intel-ipu3.rst      |  2 +-
 .../ipu3/include/{ => uapi}/intel-ipu3.h      |  0
 drivers/staging/media/ipu3/ipu3-abi.h         |  2 +-
 4 files changed, 20 insertions(+), 19 deletions(-)
 rename drivers/staging/media/ipu3/include/{ => uapi}/intel-ipu3.h (100%)

diff --git a/Documentation/admin-guide/media/ipu3.rst b/Documentation/admin-guide/media/ipu3.rst
index f59697c7b374..d6454f637ff4 100644
--- a/Documentation/admin-guide/media/ipu3.rst
+++ b/Documentation/admin-guide/media/ipu3.rst
@@ -234,22 +234,23 @@ The IPU3 ImgU pipelines can be configured using the Media Controller, defined at
 Running mode and firmware binary selection
 ------------------------------------------
 
-ImgU works based on firmware, currently the ImgU firmware support run 2 pipes in
-time-sharing with single input frame data. Each pipe can run at certain mode -
-"VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture, and
-"STILL" is used for still frame capture. However, you can also select "VIDEO" to
-capture still frames if you want to capture images with less system load and
-power. For "STILL" mode, ImgU will try to use smaller BDS factor and output
-larger bayer frame for further YUV processing than "VIDEO" mode to get high
-quality images. Besides, "STILL" mode need XNR3 to do noise reduction, hence
-"STILL" mode will need more power and memory bandwidth than "VIDEO" mode. TNR
-will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is running at
-“VIDEO” mode by default, the user can use v4l2 control V4L2_CID_INTEL_IPU3_MODE
-(currently defined in drivers/staging/media/ipu3/include/intel-ipu3.h) to query
-and set the running mode. For user, there is no difference for buffer queueing
-between the "VIDEO" and "STILL" mode, mandatory input and main output node
-should be enabled and buffers need be queued, the statistics and the view-finder
-queues are optional.
+ImgU works based on firmware, currently the ImgU firmware support run 2 pipes
+in time-sharing with single input frame data. Each pipe can run at certain mode
+- "VIDEO" or "STILL", "VIDEO" mode is commonly used for video frames capture,
+and "STILL" is used for still frame capture. However, you can also select
+"VIDEO" to capture still frames if you want to capture images with less system
+load and power. For "STILL" mode, ImgU will try to use smaller BDS factor and
+output larger bayer frame for further YUV processing than "VIDEO" mode to get
+high quality images. Besides, "STILL" mode need XNR3 to do noise reduction,
+hence "STILL" mode will need more power and memory bandwidth than "VIDEO" mode.
+TNR will be enabled in "VIDEO" mode and bypassed by "STILL" mode. ImgU is
+running at “VIDEO” mode by default, the user can use v4l2 control
+V4L2_CID_INTEL_IPU3_MODE (currently defined in
+drivers/staging/media/ipu3/include/uapi/intel-ipu3.h) to query and set the
+running mode. For user, there is no difference for buffer queueing between the
+"VIDEO" and "STILL" mode, mandatory input and main output node should be
+enabled and buffers need be queued, the statistics and the view-finder queues
+are optional.
 
 The firmware binary will be selected according to current running mode, such log
 "using binary if_to_osys_striped " or "using binary if_to_osys_primary_striped"
@@ -586,7 +587,7 @@ preserved.
 References
 ==========
 
-.. [#f5] drivers/staging/media/ipu3/include/intel-ipu3.h
+.. [#f5] drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
 
 .. [#f1] https://github.com/intel/nvt
 
diff --git a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
index 5f33d35532ef..84d81dd7a7b5 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-meta-intel-ipu3.rst
@@ -78,4 +78,4 @@ hardware and algorithm details.
 Intel IPU3 ImgU uAPI data types
 ===============================
 
-.. kernel-doc:: drivers/staging/media/ipu3/include/intel-ipu3.h
+.. kernel-doc:: drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
similarity index 100%
rename from drivers/staging/media/ipu3/include/intel-ipu3.h
rename to drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
diff --git a/drivers/staging/media/ipu3/ipu3-abi.h b/drivers/staging/media/ipu3/ipu3-abi.h
index e1185602c7fd..c76935b436d7 100644
--- a/drivers/staging/media/ipu3/ipu3-abi.h
+++ b/drivers/staging/media/ipu3/ipu3-abi.h
@@ -4,7 +4,7 @@
 #ifndef __IPU3_ABI_H
 #define __IPU3_ABI_H
 
-#include "include/intel-ipu3.h"
+#include "include/uapi/intel-ipu3.h"
 
 /******************* IMGU Hardware information *******************/
 
-- 
2.29.2

