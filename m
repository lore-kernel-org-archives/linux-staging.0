Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3FEEBE0
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 22:48:26 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9g-0005EN-0c; Fri, 18 Nov 2022 23:48:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9d-0058rP-Bu; Fri, 18 Nov 2022 23:48:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1owA9d-0000Tr-Ha; Fri, 18 Nov 2022 23:48:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Machata <petrm@nvidia.com>,
	Peter Rosin <peda@axentia.se>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 569/606] staging: most: i2c: Convert to i2c's .probe_new()
Date: Fri, 18 Nov 2022 23:45:03 +0100
Message-Id: <20221118224540.619276-570-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/most/i2c/i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2c.c
index 285a071f02be..df53a4c4f850 100644
--- a/drivers/staging/most/i2c/i2c.c
+++ b/drivers/staging/most/i2c/i2c.c
@@ -284,7 +284,7 @@ static irqreturn_t most_irq_handler(int irq, void *_dev)
  *
  * Register the i2c client device as a MOST interface
  */
-static int i2c_probe(struct i2c_client *client, const struct i2c_device_id *id)
+static int i2c_probe(struct i2c_client *client)
 {
 	struct hdm_i2c *dev;
 	int ret, i;
@@ -359,7 +359,7 @@ static struct i2c_driver i2c_driver = {
 	.driver = {
 		.name = "hdm_i2c",
 	},
-	.probe = i2c_probe,
+	.probe_new = i2c_probe,
 	.remove = i2c_remove,
 	.id_table = i2c_id,
 };
-- 
2.38.1

