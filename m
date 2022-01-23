Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A4A2CA3
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:02:59 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M7JnA-1nCoTJ0Ylo-007jRo; Sun, 23 Jan 2022 21:02:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 04/18] staging: vchiq: convert TODOs into unordered list
Date: Sun, 23 Jan 2022 21:02:09 +0100
Message-Id: <1642968143-19281-5-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:I4ptxhYUN2Xn4WEOJEAka6JY4NtnLs3goII3HL4FVg4AHLogfaH
 RFbJZtl4ZAImOJeJmLb2BUiTnympby4sl+wF/IxV4PL/j2cqFyEDu4f+oAA4syL3GAZ3FbB
 KdzqAxECiI4PYltJJDn1/U4R35smWZFophMr4UuoQRiDTU+SDEoOq9i/yRZBx7IAbMpAzQk
 qd9a5CYEOpK8i/BMvFaPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:r+nrMnQPJqk=:N7BuFymLoTsZVDRIz5c12K
 gYUZOAAXIPtKliiz4YwadrJtDjGCuvFvV0wlMtvSi9vGC095FjTRVigQmnaL4JjwsxgkNwgpb
 fjBkg906SwpYY/R0qwZOvFymtdyV7k7cynLJAw4Q2VxrecULuzZ4tWUNNARaweq1VtuExYxA6
 DXkFE6l+sRkKjuBiE1bWor6PPGk7uditE8gcyOasOPGfI03nOVLE7HwgnoYDaKFpRJVo5RyyW
 1/vRO5INEAVn+dNro2ndT05szG7bEDDk7muwiIfh6RBn8cKI9/c6r8z47gRvzx0xTXAeNt1k/
 u/uYQtQDUY4isFBrpuavVgFB1yvcU2A+pWARVt1RmTHlWk+viASHOyOCPU2RF2chSd8cAhN28
 OBj0tjJqhRIlHB9yiOWlQWk0g8Q3/VxUuJA8cCCzdUcTpw0ZcCIeJUZEwlka5anF5SQaGBzQF
 BinDjcorvDNlrQYJgPH0zPiSBMgdBs0GC24gEK26DkLLdEROaC7EtAE6LF2vIIi4X2sGvPjUE
 fyBTo7WFin/rYQARpZLXw2Gbs3LdMGxztPl5Q1mAwrIwxGg74bhasvTCVMjrcNwF9/F6DOUVh
 1GSAxcViEaYngD4a0+JbIbXcvRmJkSkdhoCCoAH8xYLLoTQwmDSSC2TedOxG65yATsERPjvzO
 bG6YXatNk1htWzmlkrA1aL8O1rYmXx8JXEwvqM0/mxkr3E+g9gTO3TxI4gxXKJu+cv9IFLNes
 ocPZgxfhJVXMhaFY
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Keeping the order of the TODO items is hard and also unnecessary.
So convert it to an unordered list.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/TODO | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 241ca00..2e4ec58 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -1,4 +1,4 @@
-1) Import drivers using VCHI.
+* Import drivers using VCHI.
 
 VCHI is just a tool to let drivers talk to the firmware.  Here are
 some of the ones we want:
@@ -16,7 +16,7 @@ some of the ones we want:
   to manage these buffers as dmabufs so that we can zero-copy import
   camera images into vc4 for rendering/display.
 
-2) Garbage-collect unused code
+* Garbage-collect unused code
 
 One of the reasons this driver wasn't upstreamed previously was that
 there's a lot code that got built that's probably unnecessary these
@@ -24,7 +24,7 @@ days.  Once we have the set of VCHI-using drivers we want in tree, we
 should be able to do a sweep of the code to see what's left that's
 unused.
 
-3) Make driver more portable
+* Make driver more portable
 
 Building this driver with arm/multi_v7_defconfig or arm64/defconfig
 leads to data corruption during the following command:
@@ -33,42 +33,42 @@ leads to data corruption during the following command:
 
 This should be fixed.
 
-4) Fix kernel module support
+* Fix kernel module support
 
 Even the VPU firmware doesn't support a VCHI re-connect, the driver
 should properly handle a module unload. This also includes that all
 resources must be freed (kthreads, debugfs entries, ...) and global
 variables avoided.
 
-5) Cleanup logging mechanism
+* Cleanup logging mechanism
 
 The driver should probably be using the standard kernel logging mechanisms
 such as dev_info, dev_dbg, and friends.
 
-6) Documentation
+* Documentation
 
 A short top-down description of this driver's architecture (function of
 kthreads, userspace, limitations) could be very helpful for reviewers.
 
-7) Review and comment memory barriers
+* Review and comment memory barriers
 
 There is a heavy use of memory barriers in this driver, it would be very
 beneficial to go over all of them and, if correct, comment on their merits.
 Extra points to whomever confidently reviews the remote_event_*() family of
 functions.
 
-8) Get rid of custom function return values
+* Get rid of custom function return values
 
 Most functions use a custom set of return values, we should force proper Linux
 error numbers. Special care is needed for VCHIQ_RETRY.
 
-9) Reformat core code with more sane indentations
+* Reformat core code with more sane indentations
 
 The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-10) Reorganize file structure: Move char driver to it's own file and join both
+* Reorganize file structure: Move char driver to it's own file and join both
 platform files
 
 The cdev is defined alongside with the platform code in vchiq_arm.c. It would
@@ -80,7 +80,7 @@ vchiq-core.ko and vchiq-dev.ko. This would also ease the upstreaming process.
 
 The code in vchiq_bcm2835_arm.c should fit in the generic platform file.
 
-11) Get rid of all non essential global structures and create a proper per
+* Get rid of all non essential global structures and create a proper per
 device structure
 
 The first thing one generally sees in a probe function is a memory allocation
@@ -88,6 +88,6 @@ for all the device specific data. This structure is then passed all over the
 driver. This is good practice since it makes the driver work regardless of the
 number of devices probed.
 
-12) Clean up Sparse warnings from __user annotations. See
+* Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
-- 
2.7.4

