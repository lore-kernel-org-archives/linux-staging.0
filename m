Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252DE2CB0
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M9nhF-1nEjLk3TBF-005nVJ; Sun, 23 Jan 2022 21:02:53 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 06/18] staging: vchiq: add message handling to TODO list
Date: Sun, 23 Jan 2022 21:02:11 +0100
Message-Id: <1642968143-19281-7-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:M/jZpUYtV2E27bx5lC32wo+lLB+HTJL+x+p3085nAUDQWbOFBJ0
 vP9Z+HP3zdn6nwFrxzkMDQK7YXwfWe20QN16dypYCdfetdvF2QTSiOm8oDGwdDWjPxBrETq
 6LPX7b4p5pxJYYDe14BvYTUJ7I3z8OKtDs6MVC3BUgThTZn5o5LUN1obQSbY9bGZgcMe5oG
 8U2ydmjcBEeSlXsDb9VDg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J4JlZXHY/PE=:64PQn+172G9RzEWHSDKDGG
 8R5tpJpuwCkp5ztU5WhHkPXI7JV2Esyxq3n1ox6sfqhmCcXqnq1MZlHkrr/XKQIbRtDyHyxIa
 HplIgq4JqlRyTnmvt5u685X536B2Mh/ABdGe57UEZpBGoJyCUoAeeoVWN32KwaLfcPt1cAS8V
 ThqlebqTkQ7qcQ1tGcl0uBaxIsBSeTgAtyyTAE8w/Hau3kwZeZ2AJZWUar5r/P8/aMWcSth70
 0wOVo9Q5Lzy5vwrv2EoUb6MNyO2GWWGvj8v9P6/YcTZak6PuBzieFk0pAdKEdvvFySToNJsX0
 yus1Ui0Ei00EFLLfn0Jld9dGK6/xy2xiroyEQkPrahUzjKw74ly9Op7HRQka+rLRd3V4BVEVt
 SFyD9K4aYiFXtefGLxuruXb2fSIN8mom9h7/Brr/Hq1xuOQHFBGfIhAFQFAEqUn3m5gMHx8Q9
 xCH0+BHBNdwcwhphOvqVcAMXCq0uri6iN0/UDfs7j+C5nh5LOL2F39V02m1M3vMBQbMKsCLzs
 9mB5saRs0Giqr99jJlKeDCO3BT7V3xytHWxr7exrRdtO8zP7XY0Mejk6chaM+FBr6PkIAot/m
 s7zF0A/ivj2JPvuD/oOiU1d/K6iX6chcPJj4udKiYOb8Z3haqbJyMj4Uc9SX5qgXiAWsDBxli
 WLFaznMP00Qk/BitHlg0C6TTdof5wwVVcm4mAOSG+07HKkAoBg/+Upnamjpbq44ExAlQzIzUk
 RkXnqp+2xVy77iWm
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Recently Arnd Bergmann noticed that the message handling looks broken
to him. So add this point on the TODO list.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/TODO | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index e2d44a4..97085a0 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -62,3 +62,12 @@ number of devices probed.
 * Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
+
+* Fix behavior of message handling
+
+The polling behavior of vchiq_bulk_transmit(), vchiq_bulk_receive() and
+vchiq_queue_kernel_message() looks broken. A possible signal should be
+propagated back to user space to let the calling task handle it before
+retrying. Hopefully these msleep(1) shouldn't be necessary anymore.
+
+https://lore.kernel.org/linux-staging/CAK8P3a3HGm1cPo4sW9fOY4E8AN8yAq3tevXxU5m8bmtmsU8WKw@mail.gmail.com/
-- 
2.7.4

