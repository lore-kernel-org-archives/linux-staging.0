Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290307460
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIB-0004kz-RO; Mon, 03 Apr 2023 17:40:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI9-008ibx-Ud; Mon, 03 Apr 2023 17:40:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI9-00AHxw-3v; Mon, 03 Apr 2023 17:40:21 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 23/24] staging: vc04_services: bcm2835-camera: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:40:13 +0200
Message-Id: <20230403154014.2564054-24-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WJEXAJv9wIy+77dauxp4sICwMJuatkFxTDiNrmaPnz0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNQk11UyzA2r0zj/0YrnyeFCvbofG/KUm5u4 GfvWkfhC+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzUAAKCRCPgPtYfRL+ Tof0CAC6r9gdb92UcNq7Cmq9af0iW4+ewKc9EOfe3nFcMDCIXePcS3Mp7TWXcDmokgl54fe2vyn LJAPkZfPQakc4spZ9j6bKhehj+NTNiNSKRZjpoaEON4pkj0ZHMa6dG8jhjyp7tosjTUENnqC+sS f1dabJxKm7z6lM/K/etuWwPNA+pI+S+h2Yt3aV29xXdy9LJfzAeJuKsPfSSMRnUyQwJzKSC9pgj r5R67Hx81ttlM4rVzYXXp5TAIyCBqe57CplOmI52GdP9u9UjIlFaqeEcNr6bDgddp+tNxyiqnV1 3fLxrnXDuyMxaOHQ5kLMxXObJkt6NKKjnJH3pYib48Ke23KD
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
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c   | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 4f81765912ea..346d00df815a 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1976,7 +1976,7 @@ static int bcm2835_mmal_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int bcm2835_mmal_remove(struct platform_device *pdev)
+static void bcm2835_mmal_remove(struct platform_device *pdev)
 {
 	int camera;
 	struct vchiq_mmal_instance *instance = gdev[0]->instance;
@@ -1986,13 +1986,11 @@ static int bcm2835_mmal_remove(struct platform_device *pdev)
 		gdev[camera] = NULL;
 	}
 	vchiq_mmal_finalise(instance);
-
-	return 0;
 }
 
 static struct platform_driver bcm2835_camera_driver = {
 	.probe		= bcm2835_mmal_probe,
-	.remove		= bcm2835_mmal_remove,
+	.remove_new	= bcm2835_mmal_remove,
 	.driver		= {
 		.name	= "bcm2835-camera",
 	},
-- 
2.39.2

