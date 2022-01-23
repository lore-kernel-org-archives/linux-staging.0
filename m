Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F12CAD
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mow4E-1mVCFP1qSk-00qRv0; Sun, 23 Jan 2022 21:02:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 05/18] staging: vchiq: drop completed tasks from TODO
Date: Sun, 23 Jan 2022 21:02:10 +0100
Message-Id: <1642968143-19281-6-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:CrXiWn9LZxMlf7JS/sBz03h66MLzVnsdiz4zDQ7Jra6+rN+ok9h
 gqc/XxeKCifZGT0z+P5bdh/FCTLc/CsPuziKK9P7Ng1q9sVWhU9oRsC/lyITwraD2de82EG
 38zuyMcJnLJBWVmujAcpQShnRKjCn2hRAKd4kaDcpY6tmgOnKx6DXxoSdIkXJIhV2lL1qKs
 mYFYev0sR0L0SqMcnTJ5w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3Mlk8aGfm9M=:OfJHOmBpvItaDDjP3dUaIf
 0Xg/bTZMJFZ0BRKDaLy1NG7kvbJp7GIiZ1nltKWOVIy6cdd92RPStDKsRd93s/oTKmT/60zPU
 L/Y6j2S0oTTS9ZP94ikXJljbjrqcPMAO6LVN03pHYQ2+wvEHvmONqk5qa+vaLBsK3e7Qqv4un
 t5uEba7QcssFztiTUJRyLgOe47hZPdBkgiojsrrn7VPSgcjPcJm3vxtS3XWGvn7VB7N4HX83U
 kxVGF4hVdVOVO70pDphezkHJzzzngS+xIiPGgdwxpPMREWcCAL0f1kk08kv9ppc5PsgWnalb8
 qRAUMRofHNB0iebItJyOuOIMZvTRRLzsUC0rYn6O933o2rp57G7qU2VGaRrPxK0xH8ZjoqWQs
 0i4ZNNc2FEepLIeqT3IZjhfqezolXo/HhESq63egCp9toAePUKVqc60MS0qIpr/qxVJtQcOQl
 GyoCoLYZVpoQYpUM1ZJcUCqBz+YBKzRignHq5iSOXxau7m5cs6L3gixELV5oflLSGaHi1Vxh2
 wJIMTPALUPQOpf6HprF13Hb4YMC9STD3NDgpYCrngqP4EZFdvkavc7CfSuc5uFvv6MIS5c4hn
 5Tz4bSV2rmLV1w4ZE+fHHppBSHg0EpHD0wmuk5vSjhOHftyiv86yiHDl7+6yQobOlXmEwnHIV
 es7jOwsCRcE2fT9tpLs/eUtzVL0w1g0+jlrBjAoLqp1D8cIgrRyYtJC9N24wNZ97rtoIkKHgk
 F70CxgAtMaEbM3Ju
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

This removes all already completed tasks from the TODO file.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/TODO | 29 ----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 2e4ec58..e2d44a4 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -16,23 +16,6 @@ some of the ones we want:
   to manage these buffers as dmabufs so that we can zero-copy import
   camera images into vc4 for rendering/display.
 
-* Garbage-collect unused code
-
-One of the reasons this driver wasn't upstreamed previously was that
-there's a lot code that got built that's probably unnecessary these
-days.  Once we have the set of VCHI-using drivers we want in tree, we
-should be able to do a sweep of the code to see what's left that's
-unused.
-
-* Make driver more portable
-
-Building this driver with arm/multi_v7_defconfig or arm64/defconfig
-leads to data corruption during the following command:
-
-  vchiq_test -f 1
-
-This should be fixed.
-
 * Fix kernel module support
 
 Even the VPU firmware doesn't support a VCHI re-connect, the driver
@@ -68,18 +51,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Reorganize file structure: Move char driver to it's own file and join both
-platform files
-
-The cdev is defined alongside with the platform code in vchiq_arm.c. It would
-be nice to completely decouple it from the actual core code. For instance to be
-able to use bcm2835-audio without having /dev/vchiq created. One could argue
-it's better for security reasons or general cleanliness. It could even be
-interesting to create two different kernel modules, something the likes of
-vchiq-core.ko and vchiq-dev.ko. This would also ease the upstreaming process.
-
-The code in vchiq_bcm2835_arm.c should fit in the generic platform file.
-
 * Get rid of all non essential global structures and create a proper per
 device structure
 
-- 
2.7.4

