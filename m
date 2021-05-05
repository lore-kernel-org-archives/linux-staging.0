Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC9872
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:29:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leO9C-0000sZ-6s; Wed, 05 May 2021 22:29:30 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leO9B-0007Ee-1K; Wed, 05 May 2021 22:29:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sven Van Asbroeck <TheSven73@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 1/2] staging: fieldbus: anybus: Make remove callback return void
Date: Wed,  5 May 2021 22:29:22 +0200
Message-Id: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

The driver core ignores the return value of struct bus_type::remove()
because there is only little that can be done. To simplify the quest to
make this function return void, let struct vio_driver::remove() return
void, too. All users already unconditionally return 0, this commit makes
it obvious that returning an error code is a bad idea.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/fieldbus/anybuss/anybuss-client.h | 2 +-
 drivers/staging/fieldbus/anybuss/hms-profinet.c   | 3 +--
 drivers/staging/fieldbus/anybuss/host.c           | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/anybuss-client.h b/drivers/staging/fieldbus/anybuss/anybuss-client.h
index 8ee1f1baccf1..a219688006fe 100644
--- a/drivers/staging/fieldbus/anybuss/anybuss-client.h
+++ b/drivers/staging/fieldbus/anybuss/anybuss-client.h
@@ -32,7 +32,7 @@ struct anybuss_client {
 struct anybuss_client_driver {
 	struct device_driver driver;
 	int (*probe)(struct anybuss_client *adev);
-	int (*remove)(struct anybuss_client *adev);
+	void (*remove)(struct anybuss_client *adev);
 	u16 anybus_id;
 };
 
diff --git a/drivers/staging/fieldbus/anybuss/hms-profinet.c b/drivers/staging/fieldbus/anybuss/hms-profinet.c
index eca7d97b8e85..e691736a53f1 100644
--- a/drivers/staging/fieldbus/anybuss/hms-profinet.c
+++ b/drivers/staging/fieldbus/anybuss/hms-profinet.c
@@ -190,12 +190,11 @@ static int profinet_probe(struct anybuss_client *client)
 	return 0;
 }
 
-static int profinet_remove(struct anybuss_client *client)
+static void profinet_remove(struct anybuss_client *client)
 {
 	struct profi_priv *priv = anybuss_get_drvdata(client);
 
 	fieldbus_dev_unregister(&priv->fbdev);
-	return 0;
 }
 
 static struct anybuss_client_driver profinet_driver = {
diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index c97df91124a4..de6c287efa03 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1194,7 +1194,8 @@ static int anybus_bus_remove(struct device *dev)
 		to_anybuss_client_driver(dev->driver);
 
 	if (adrv->remove)
-		return adrv->remove(to_anybuss_client(dev));
+		adrv->remove(to_anybuss_client(dev));
+
 	return 0;
 }
 

base-commit: d665ea6ea86c785760ee4bad4543dab3267ad074
-- 
2.30.2

