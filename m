Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E16FD9
	for <linux-staging@lists.linux.dev>; Mon,  3 Apr 2023 15:40:27 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-0004b9-6S; Mon, 03 Apr 2023 17:40:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iaa-E0; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwX-LS; Mon, 03 Apr 2023 17:40:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sven Van Asbroeck <TheSven73@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 03/24] staging: fieldbus: arcx-anybus: Convert to platform remove callback returning void
Date: Mon,  3 Apr 2023 17:39:53 +0200
Message-Id: <20230403154014.2564054-4-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=C44I0agQDCYDDOA4RMDCHovZvY5vNJweZE4AFUpTY84=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM4sHGXFreIgJI8LrvuOF+sV3qVt4GsQNh7D DcyKlINGf2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOAAKCRCPgPtYfRL+ TtudB/9yiy2msEDcNtZmea7R2Qee+73f+mKJS5gzv+bimlIZHFDWv+EtWL6TwQq/q23X0a6ejq8 Q964FGkbVXTFDrGluCIA3QSyVc/WBKK6NtVRWq5TtbKwXsX5duw04lDXdVmvpBRQGcYK3UdDjyq CtZWmDEH3aUnyylCItJt6+/h2bElszibdpu8r+KO4xcPZ5Duxy3UHaRkhYnOi4Yhnv0NPzyZD7J ucG052YQU8t87/EeBPNoLdzAkMjoZZinNXSO5T402v1ogWfmjv2fI9X6GiREvvrOiO3pHAZ+b6p PBatvoPIboiU4CoCewDXecMTcI8UZT20FL3zqpttxBFzM66q
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
 drivers/staging/fieldbus/anybuss/arcx-anybus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/arcx-anybus.c b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
index 9af2e63050d1..afef35bbea74 100644
--- a/drivers/staging/fieldbus/anybuss/arcx-anybus.c
+++ b/drivers/staging/fieldbus/anybuss/arcx-anybus.c
@@ -321,7 +321,7 @@ static int controller_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int controller_remove(struct platform_device *pdev)
+static void controller_remove(struct platform_device *pdev)
 {
 	struct controller_priv *cd = platform_get_drvdata(pdev);
 	int id = cd->class_dev->id;
@@ -329,7 +329,6 @@ static int controller_remove(struct platform_device *pdev)
 	device_unregister(cd->class_dev);
 	ida_simple_remove(&controller_index_ida, id);
 	gpiod_set_value_cansleep(cd->reset_gpiod, 1);
-	return 0;
 }
 
 static const struct of_device_id controller_of_match[] = {
@@ -341,7 +340,7 @@ MODULE_DEVICE_TABLE(of, controller_of_match);
 
 static struct platform_driver controller_driver = {
 	.probe = controller_probe,
-	.remove = controller_remove,
+	.remove_new = controller_remove,
 	.driver		= {
 		.name   = "arcx-anybus-controller",
 		.of_match_table	= of_match_ptr(controller_of_match),
-- 
2.39.2

