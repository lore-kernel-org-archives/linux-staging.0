Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4146FD3
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-0004bC-E4; Mon, 03 Apr 2023 17:40:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iad-Ih; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwa-Qk; Mon, 03 Apr 2023 17:40:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 04/24] staging: greybus: arche-apb-ctrl: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:39:54 +0200
Message-Id: <20230403154014.2564054-5-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BIk9BkBy2gmmI0VRgkKpjmSBJ5jgKqBxRxl9u+U6s5I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM50SNoxRitSHoPUaDp30MBJPSuWbyEWJRrT Mq2Fwc6svWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOQAKCRCPgPtYfRL+ TqbaB/950tsWzdXXhdbDcERtqOW8LcQzCqOLqWx9VOyrBiwde5BNylSoBTU7kdPD/HVLn6LKhdN PFV0BRPT1c2d5bqXMT52HFpwEphIbdzsh4OF1gVvbMFdKBynZ3+31HM4tdclY4WcW+FI9ZWbrbr dtsIb4H/rhAC1pD7BfJG6XSt9CM+AAhpYtmSs3FlhQhg3aEzWFy1Bsz50sozArVmgonQ2XdrHSV Ik1oxtRWqD+yPqvw7IyZy/8ee6RvQy4rs5o2N1ao+c4eBzlUe1ICVkaziNxvUh7owA9VhblSDoZ bD+RurbJswGfFqWNsonrohxBmqOTF6S6M3mLt6dJiVYQJLQn
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
 drivers/staging/greybus/arche-apb-ctrl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 45afa208d004..8541995008da 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -419,13 +419,11 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int arche_apb_ctrl_remove(struct platform_device *pdev)
+static void arche_apb_ctrl_remove(struct platform_device *pdev)
 {
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	poweroff_seq(pdev);
 	platform_set_drvdata(pdev, NULL);
-
-	return 0;
 }
 
 static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
@@ -471,7 +469,7 @@ static const struct of_device_id arche_apb_ctrl_of_match[] = {
 
 static struct platform_driver arche_apb_ctrl_device_driver = {
 	.probe		= arche_apb_ctrl_probe,
-	.remove		= arche_apb_ctrl_remove,
+	.remove_new	= arche_apb_ctrl_remove,
 	.shutdown	= arche_apb_ctrl_shutdown,
 	.driver		= {
 		.name	= "arche-apb-ctrl",
-- 
2.39.2

