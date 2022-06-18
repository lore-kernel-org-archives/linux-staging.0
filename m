Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A87B
	for <linux-staging@lists.linux.dev>; Sat, 18 Jun 2022 09:00:51 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.155]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1N5G5b-1nag5b0d5J-011CtC; Sat, 18 Jun 2022 11:00:38 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Adrien Thierry <athierry@redhat.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC] staging: vchiq: provide testing instructions
Date: Sat, 18 Jun 2022 11:00:02 +0200
Message-Id: <20220618090002.20663-1-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:1HrNdWdIUWuWs9K1Glfo9N2C+oGKtKjAw6QgQjoeqr7/lqAaBYO
 klOpAeAsYDOuRlxuJ/SiehhGihYLP4yYo16ZmCwERCRelwQ6C13kbTaEhc7VMx5H2KMuXe3
 nFGxqSQMGTQ3+rM6sjMJ2rQRh/Wrd41kRARpqqEl8PMAIwS+9n3aPR5tOdT+PI8DV9o3eTp
 rnJNsT+DTW99Pb2pYSrrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WX5uRx6/GC4=:gN+3Pc0bcMxgk8+6WVhek+
 UqOkpDySp+H4bRiXTCw5Cv37RkZuaZq8jBDVjEnG6I8c6HrQkMzdkdJCgP3B6v0E6Dx5xLyVs
 JwrZM+T+8nd9gdgMGrxlaqoBSkTDevuPYKwdjSgVqHdjgAXEM3xYOt+Nx3s7k5Ufrjgvm11QT
 UcZuzLPvs5ygAYV33A4KD3my8L/U9qsLW4lk+StBVyup3ZjJLhtPP6Q3kisw/ZeTZnHSQOdJb
 KYHb5JWxEeGPH8wve+XUCHOq8+DeDoSpPNAeteEJTQyb3MOuXchzZw8LqVdIiaSP1nVwoi6GW
 Hpyo1UjjFTuzBf2IhhyeXE7fiXCH4f5/PYleSjJsjoC0ugKMgg9cgxm04hfEnE5zPvehD2Lji
 8tac1gLUORWs68LVtsbkGcD08BNntDlgp3kv1PU6UN0J0/aW+PVvk+yyZrJu1GCwOhVx6zqF2
 GnAlqPteZAvHYgA+DI1M1SgrFTXs37xUm4v79SDzk1LzOIhTg0H2zHO00DxExm0UU/4O+ncr7
 xQrR/ihBWXrUWUQPuPlEXvB13hRcnPV814gO9QslK7P4VTXfk9yW3GLm4U1N/fDdWlq1PXQOv
 vDGsPu367l6VWsL4Eqf1+qJtDhCpaspSAbJdR7Mp+G0saxYcrwCHaACSwUeIAdqBeUfF51Ksd
 YSKj0TjJ4HCU0nRemuMdIQaEbXO2zGhbFg7ow2xb4EN7cTyagVz46q9yAFaeUr21woqBtY1Fm
 nvIO7hPG0Tn5tcYIrcyeky+5dolnkL+67558ErBcdw4Qcc+LliY4RThYlqE=

This small document should to help kernel developer to test their
changes on the VCHIQ driver.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../staging/vc04_services/interface/TESTING   | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 drivers/staging/vc04_services/interface/TESTING

diff --git a/drivers/staging/vc04_services/interface/TESTING b/drivers/staging/vc04_services/interface/TESTING
new file mode 100644
index 000000000000..a6d63efcbcb9
--- /dev/null
+++ b/drivers/staging/vc04_services/interface/TESTING
@@ -0,0 +1,82 @@
+This document contains some hints to test the function of the VCHIQ driver
+without having additional hardware to the Raspberry Pi.
+
+* Requirements & limitations
+
+Testing the VCHIQ driver requires a Raspberry Pi with one of the following SoC:
+  - BCM2835 ( e.g. Raspberry Pi Zero W )
+  - BCM2836 ( e.g. Raspberry Pi 2 )
+  - BCM2837 ( e.g. Raspberry Pi 3 B+ )
+
+The BCM2711 used in the Raspberry Pi 4 is currently not supported in the
+mainline kernel.
+
+There are no specific requirements to the VideoCore firmware to get VCHIQ
+working.
+
+The test scenarios described in this document based on the tool vchiq_test.
+Its source code is available here: https://github.com/raspberrypi/userland
+
+* Configuration
+
+Here are the most common kernel configurations:
+
+ 1. BCM2835 target SoC (ARM 32 bit)
+
+    Just use bcm2835_defconfig which already has VCHIQ enabled.
+
+ 2. BCM2836/7 target SoC (ARM 32 bit)
+
+    Use the multi_v7_defconfig as a base and then enable all VCHIQ options.
+
+ 3. BCM2837 target SoC (ARM 64 bit)
+
+    Use the defconfig as a base and then enable all VCHIQ options.
+
+* Scenarios
+
+ * Initial test
+
+   Check the driver is probed and /dev/vchiq is created
+
+ * Functional test
+
+   Command: vchiq_test -f 10
+
+   Expected output:
+   Functional test - iters:10
+   ======== iteration 1 ========
+   Testing bulk transfer for alignment.
+   Testing bulk transfer at PAGE_SIZE.
+   ...
+
+ * Ping test
+
+   Command: vchiq_test -p 1
+
+   Expected output:
+   Ping test - service:echo, iters:1, version 3
+   vchi ping (size 0) -> 57.000000us
+   vchi ping (size 0, 0 async, 0 oneway) -> 122.000000us
+   vchi bulk (size 0, 0 async, 0 oneway) -> 546.000000us
+   vchi bulk (size 0, 0 oneway) -> 230.000000us
+   vchi ping (size 0) -> 49.000000us
+   vchi ping (size 0, 0 async, 0 oneway) -> 70.000000us
+   vchi bulk (size 0, 0 async, 0 oneway) -> 296.000000us
+   vchi bulk (size 0, 0 oneway) -> 266.000000us
+   vchi ping (size 0, 1 async, 0 oneway) -> 65.000000us
+   vchi bulk (size 0, 0 oneway) -> 456.000000us
+   vchi ping (size 0, 2 async, 0 oneway) -> 74.000000us
+   vchi bulk (size 0, 0 oneway) -> 640.000000us
+   vchi ping (size 0, 10 async, 0 oneway) -> 125.000000us
+   vchi bulk (size 0, 0 oneway) -> 2309.000000us
+   vchi ping (size 0, 0 async, 1 oneway) -> 70.000000us
+   vchi ping (size 0, 0 async, 2 oneway) -> 76.000000us
+   vchi ping (size 0, 0 async, 10 oneway) -> 105.000000us
+   vchi ping (size 0, 10 async, 10 oneway) -> 165.000000us
+   vchi ping (size 0, 100 async, 0 oneway) -> nanus
+   vchi bulk (size 0, 0 oneway) -> nanus
+   vchi ping (size 0, 0 async, 100 oneway) -> nanus
+   vchi ping (size 0, 100 async, 100 oneway) -> infus
+   vchi ping (size 0, 200 async, 0 oneway) -> infus
+   ...
-- 
2.25.1

