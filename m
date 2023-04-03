Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662037460
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIA-0004bH-RH; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008ial-Tq; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-00AHwl-Af; Mon, 03 Apr 2023 17:40:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Eugen Hristev <eugen.hristev@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de
Subject: [PATCH 07/24] staging: media: atmel-sama7g5-isc: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:39:57 +0200
Message-Id: <20230403154014.2564054-8-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=PHGREWo2RAqblSSs7lBsLYizzIYrsqvK+Qz5kWHfbdU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM8+D49gK4/2jF8TWbzmsUsAeMKa9vJCnp6Q vqAH1YXy0uJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzPAAKCRCPgPtYfRL+ TgA1B/wLsryHSyT86s6sV+KB/Si4tL/MaiP1ctGQTRkLE5P/5Kh8wICdHdJcGCHdQ36CisWJ8o3 ovHs1vazP9YACwhk+40sSfz6Y8TKP8rbCtiOLfLiI0iMemR53w5vAHT3daAPjbhZS2aGIsD1TkR Nw2oUquEacZxZ7YxDZMe1zxPppmjrLLgnVc+7j9ambJcWNVSk2/c1zom/jgVpu4/hoWgZvHt9Os xg/wTVDeZRhbZ4mvzkYE15mL6e5f7PyHQ4fEDUcImpojiH7LNf3DLQWadhOEt9ps78rvYIAgFxu je7xf30o302lNmqKI/ab2xIhDNcwTMPcTxdHqvmMlaxLn+ZQ
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
 drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
index 01ababdfcbd9..315bfc4ac4ff 100644
--- a/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
+++ b/drivers/staging/media/deprecated/atmel/atmel-sama7g5-isc.c
@@ -549,7 +549,7 @@ static int microchip_xisc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int microchip_xisc_remove(struct platform_device *pdev)
+static void microchip_xisc_remove(struct platform_device *pdev)
 {
 	struct isc_device *isc = platform_get_drvdata(pdev);
 
@@ -562,8 +562,6 @@ static int microchip_xisc_remove(struct platform_device *pdev)
 	clk_disable_unprepare(isc->hclock);
 
 	atmel_isc_clk_cleanup(isc);
-
-	return 0;
 }
 
 static int __maybe_unused xisc_runtime_suspend(struct device *dev)
@@ -601,7 +599,7 @@ MODULE_DEVICE_TABLE(of, microchip_xisc_of_match);
 
 static struct platform_driver microchip_xisc_driver = {
 	.probe	= microchip_xisc_probe,
-	.remove	= microchip_xisc_remove,
+	.remove_new = microchip_xisc_remove,
 	.driver	= {
 		.name		= "microchip-sama7g5-xisc",
 		.pm		= &microchip_xisc_dev_pm_ops,
-- 
2.39.2

