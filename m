Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5257486
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIA-0004b6-OU; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iaS-7M; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwU-Gb; Mon, 03 Apr 2023 17:40:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak R Varma <drv@mailo.com>,
	Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 02/24] staging: emxx_udc: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:39:52 +0200
Message-Id: <20230403154014.2564054-3-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=rsjYo8vVOH6HuPohvlHvAbLaiTFIcNR/SRAAqy18tU4=; b=owGbwMvMwMXY3/A7olbonx/jabUkhhStz+ZrC9Wfp/bHzGSem1MwXcdE5e9Pq/h3GbIsVQd7z 7vUz1nYyWjMwsDIxSArpshi37gm06pKLrJz7b/LMINYmUCmMHBxCsBEeoo4GKZv/pHQ4nTj5IOK Y+dEPorwrbRxTvA8u1Nz49P+6vb1DFNaPu1WfMZmLFu05PF69bbUqxPT5m5jLHz5NtaU9ZqJq5f Zxk2TS1I+yF1VZjF4Jfqg8OuluYv8rH01LN+tvyqz3lUiIqCSM6zmoHmPtWNNqrbtv6/3qpdxmN SUMm9bzXLBTEVR84qqZBxHwFvzqtu8fy7NTYoSddOtnPhUTIx1Fdc0R2vDkG2zHjz/L/aX53iyi PDLTxYBu0+VmS3uzLss3/XXIdPJf1+32zzfXG6uCq2GS1ymIb3Xn5/bXRrszbXqw7bH/hkmsk/+ WXxh/G1Q76g9SdNzf2Bp2dKli41OqnzXCuuIt7292d8VAA==
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
 drivers/staging/emxx_udc/emxx_udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index f9765841c4aa..eb63daaca702 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -3137,7 +3137,7 @@ static void nbu2ss_drv_shutdown(struct platform_device *pdev)
 }
 
 /*-------------------------------------------------------------------------*/
-static int nbu2ss_drv_remove(struct platform_device *pdev)
+static void nbu2ss_drv_remove(struct platform_device *pdev)
 {
 	struct nbu2ss_udc	*udc;
 	struct nbu2ss_ep	*ep;
@@ -3154,8 +3154,6 @@ static int nbu2ss_drv_remove(struct platform_device *pdev)
 
 	/* Interrupt Handler - Release */
 	free_irq(vbus_irq, udc);
-
-	return 0;
 }
 
 /*-------------------------------------------------------------------------*/
@@ -3210,7 +3208,7 @@ static int nbu2ss_drv_resume(struct platform_device *pdev)
 static struct platform_driver udc_driver = {
 	.probe		= nbu2ss_drv_probe,
 	.shutdown	= nbu2ss_drv_shutdown,
-	.remove		= nbu2ss_drv_remove,
+	.remove_new	= nbu2ss_drv_remove,
 	.suspend	= nbu2ss_drv_suspend,
 	.resume		= nbu2ss_drv_resume,
 	.driver		= {
-- 
2.39.2

