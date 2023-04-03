Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822436FD4
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-0004bE-E4; Mon, 03 Apr 2023 17:40:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iah-Mb; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwd-Vy; Mon, 03 Apr 2023 17:40:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 05/24] staging: greybus: arche: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:39:55 +0200
Message-Id: <20230403154014.2564054-6-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1Hhb2uBDpN1VmnjqHoToZqj1BNXe80rbfoyr/UEIjx4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM6dnl8Evw4sufYPKXfzEKjbsSGaRCXd6ti6 06HnnxS18yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOgAKCRCPgPtYfRL+ TpT/B/wJFcKlBBSJP0f9im+eMTosv//i202BPenc/RdMDRK7ne0muB4FzgqvFzc0wPCI1pC+RTl Ga7oMAvwtWxrJ7eKMpceS/lpKmof4tCeu7SzPjBhf1wZLqKbGiU+hF5l3j6mDy9+KwuG+2Q9j8j xkklECABsHhjI2Sbxm6pOZFRBmaaXCQb1rHC77HmlwIren3gOgPMguf9nhpk2NBwv9bW2XUkEmg kyWWSWv33EggfzOOfVkBBVyQLmEiYM3VQgB8XIS9g4SDdnNqXMQW9wOS123+U3S9lGDR6rmy16o BeKuJJ+I80EYE9voILGKh8aKk/ZwqxDaTRKAHGMqhRrZ93Ta
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
 drivers/staging/greybus/arche-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..ebe835f25d13 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -559,7 +559,7 @@ static int arche_remove_child(struct device *dev, void *unused)
 	return 0;
 }
 
-static int arche_platform_remove(struct platform_device *pdev)
+static void arche_platform_remove(struct platform_device *pdev)
 {
 	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
 
@@ -570,8 +570,6 @@ static int arche_platform_remove(struct platform_device *pdev)
 
 	if (usb3613_hub_mode_ctrl(false))
 		dev_warn(arche_pdata->dev, "failed to control hub device\n");
-		/* TODO: Should we do anything more here ?? */
-	return 0;
 }
 
 static __maybe_unused int arche_platform_suspend(struct device *dev)
@@ -631,7 +629,7 @@ MODULE_DEVICE_TABLE(of, arche_combined_id);
 
 static struct platform_driver arche_platform_device_driver = {
 	.probe		= arche_platform_probe,
-	.remove		= arche_platform_remove,
+	.remove_new	= arche_platform_remove,
 	.shutdown	= arche_platform_shutdown,
 	.driver		= {
 		.name	= "arche-platform-ctrl",
-- 
2.39.2

