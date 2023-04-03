Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811C27479
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:30 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIA-0004iy-Oc; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI9-008ibs-KB; Mon, 03 Apr 2023 17:40:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI8-00AHxt-VH; Mon, 03 Apr 2023 17:40:20 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 22/24] staging: octeon: ethernet: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:40:12 +0200
Message-Id: <20230403154014.2564054-23-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=5fYRJj8QdgfRtO0vKhcc3F7Q92+yRmiGmOB76bAR2c0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNPFCMu9w/yMKyFn4Qk3knYrff2+Eneq4d9J ogLohdhromJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzTwAKCRCPgPtYfRL+ TnEDCACmV7oxulZlhZJSzFGxUDPDAsL7g5FZOU+NZu/aQHkpJ74EJ057pb+Yh9/BXyTnQokZKCC 5Foifg5Rv46/20wAp6wVgbxMfixfMqUMidzuG7eVXTHJarKd859gXwpvltMtfn9i9H6StgHtPi7 yNWNTh8dYNgKPOfuTcVQtTutZ26+8GXG6JqCSUj8AaMrBubFm3PtUFpKH0GZ+EOPtA9jFeyR43g WtLz8gr41jmReQvgzFZjRzLgUfX2HT3Ap2X1WaWFGkW6x3zZSvqMPJRpavwxgtpn1Np52eGXVTy c1h1pTo+FBjTLrPTgJ95vdSZyZBUuQCKuTF8G17HknbCafUq
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
 drivers/staging/octeon/ethernet.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index f662739137b5..9eee28f2940c 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -924,7 +924,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int cvm_oct_remove(struct platform_device *pdev)
+static void cvm_oct_remove(struct platform_device *pdev)
 {
 	int port;
 
@@ -965,7 +965,6 @@ static int cvm_oct_remove(struct platform_device *pdev)
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(CVMX_FPA_OUTPUT_BUFFER_POOL,
 				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
-	return 0;
 }
 
 static const struct of_device_id cvm_oct_match[] = {
@@ -978,7 +977,7 @@ MODULE_DEVICE_TABLE(of, cvm_oct_match);
 
 static struct platform_driver cvm_oct_driver = {
 	.probe		= cvm_oct_probe,
-	.remove		= cvm_oct_remove,
+	.remove_new	= cvm_oct_remove,
 	.driver		= {
 		.name	= KBUILD_MODNAME,
 		.of_match_table = cvm_oct_match,
-- 
2.39.2

