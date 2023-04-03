Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C434747A
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:34 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIC-0004ly-05; Mon, 03 Apr 2023 17:40:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIA-008ic0-4U; Mon, 03 Apr 2023 17:40:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI9-00AHy0-8p; Mon, 03 Apr 2023 17:40:21 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jakob Koschel <jakobkoschel@gmail.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 24/24] staging: vc04_services: vchiq_arm: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:40:14 +0200
Message-Id: <20230403154014.2564054-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1781; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=cdtSpw9JFqk+VwS5Nyq8Eop/LWlteK63jkuR6TKmSRM=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNROE7y+M8bIkK+PLI6mdWyomT0FWvZ19LQh 8jhugg7IpSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzUQAKCRCPgPtYfRL+ TlueB/9CvhECLdf2BSqqgZYmhriZyS8S8rItxYcg7COg4S7h0XOxTN/yGziY0q3KA4pqcN3cxXX CpAHJYooeJmz4H+Te4iPpWp/HsK6JAxUW4nX/kEItW0T7KcZat3JeWz8aihTlluJi7WT8NNdFD3 WkgKOdp2MT0GcxLnXPFjHWBWJbGYQjgWbuFIaNqsUiLIuylFA31tCwdb5s7QtcUbxzIZSAAAZ6G Rs/HbNuRfqf3gdagybI1v/zsi5959vLQ7G7d2oRYRorHCxH377cP2ApeyKr+J7+kXdiUDczmceq a2E6iBq/bhhaJHLZ7i/n9mggGHJwpfcUlEJWUHjcAqrJfHE8
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index cddcd3c596c9..40dd62cf7399 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1849,14 +1849,12 @@ static int vchiq_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int vchiq_remove(struct platform_device *pdev)
+static void vchiq_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(bcm2835_audio);
 	platform_device_unregister(bcm2835_camera);
 	vchiq_debugfs_deinit();
 	vchiq_deregister_chrdev();
-
-	return 0;
 }
 
 static struct platform_driver vchiq_driver = {
@@ -1865,7 +1863,7 @@ static struct platform_driver vchiq_driver = {
 		.of_match_table = vchiq_of_match,
 	},
 	.probe = vchiq_probe,
-	.remove = vchiq_remove,
+	.remove_new = vchiq_remove,
 };
 
 static int __init vchiq_driver_init(void)
-- 
2.39.2

