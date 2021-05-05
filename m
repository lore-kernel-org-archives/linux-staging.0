Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FEC2F81
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:29:38 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leO9C-0000sa-6s; Wed, 05 May 2021 22:29:30 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1leO9B-0007Eh-6r; Wed, 05 May 2021 22:29:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sven Van Asbroeck <TheSven73@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH 2/2] staging: fieldbus: anybus: Refuse registering drivers without .probe()
Date: Wed,  5 May 2021 22:29:23 +0200
Message-Id: <20210505202923.198607-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
References: <20210505202923.198607-1-u.kleine-koenig@pengutronix.de>
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

A driver without .probe() callback could never bind to a device because
anybus_bus_probe() returned an error for such a driver. So refuse to
register such a useless driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/fieldbus/anybuss/host.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index de6c287efa03..0f730efe9a6d 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1183,8 +1183,6 @@ static int anybus_bus_probe(struct device *dev)
 	struct anybuss_client *adev =
 		to_anybuss_client(dev);
 
-	if (!adrv->probe)
-		return -ENODEV;
 	return adrv->probe(adev);
 }
 
@@ -1208,6 +1206,9 @@ static struct bus_type anybus_bus = {
 
 int anybuss_client_driver_register(struct anybuss_client_driver *drv)
 {
+	if (!drv->probe)
+		return -ENODEV;
+
 	drv->driver.bus = &anybus_bus;
 	return driver_register(&drv->driver);
 }
-- 
2.30.2

