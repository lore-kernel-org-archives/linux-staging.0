Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C73E7471
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIB-0004gK-DU; Mon, 03 Apr 2023 17:40:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI8-008ibX-QU; Mon, 03 Apr 2023 17:40:20 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI8-00AHxY-3q; Mon, 03 Apr 2023 17:40:20 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Deepak R Varma <drv@mailo.com>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 17/24] staging: most: dim2: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:40:07 +0200
Message-Id: <20230403154014.2564054-18-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1632; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dcfjk0u0xs9J+qxoVh7s8Nz4U9BzfSL4nsatdWQggb8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNINoWZ+1qoyCeZzM2pkozneV6lemG+w6vnp H5i6HRzUqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzSAAKCRCPgPtYfRL+ TjLtB/wNNKAQGRJ5iQX3p/F/EDS4eFDpZUF6GlUisaUzVFa4tDMk4Y1ZACDkDhgO+t2gIjRnU1E XWfVJuGkRILqX2e7EwIn44pVB03jQ8KCXLaqz8LffL0JJ/wuDm+A1NPgSX4MObiUMjKjl5xmtQv qZEb0oWRCTmFkRyCuKCFnyxBGXmoAZuW9rdsB74k/9rwU+to0FbEnKi0Tb/o6OEthii/pG77KVa v2v4f1yp22t12yta3rTk7EgxvRJur3+ck0YWXcCtioppFe+p2sNgwNgCGozUPAjP008u4LoOcAO iBBXBESAIELQAdTMbbJoxpOpUR6F83fYSqnIsEDEIdCUCm4a
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
 drivers/staging/most/dim2/dim2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 7a5f80e637a0..0810e942c86a 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -906,13 +906,11 @@ static int dim2_probe(struct platform_device *pdev)
  *
  * Unregister the interface from mostcore
  */
-static int dim2_remove(struct platform_device *pdev)
+static void dim2_remove(struct platform_device *pdev)
 {
 	struct dim2_hdm *dev = platform_get_drvdata(pdev);
 
 	most_deregister_interface(&dev->most_iface);
-
-	return 0;
 }
 
 /* platform specific functions [[ */
@@ -1091,7 +1089,7 @@ MODULE_DEVICE_TABLE(of, dim2_of_match);
 
 static struct platform_driver dim2_driver = {
 	.probe = dim2_probe,
-	.remove = dim2_remove,
+	.remove_new = dim2_remove,
 	.driver = {
 		.name = "hdm_dim2",
 		.of_match_table = dim2_of_match,
-- 
2.39.2

