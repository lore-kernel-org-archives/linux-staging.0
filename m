Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF4319528
	for <linux-staging@lists.linux.dev>; Wed, 24 May 2023 15:17:05 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qER-0005bK-4V; Wed, 24 May 2023 17:16:55 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qEP-002W9d-6L; Wed, 24 May 2023 17:16:53 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qEO-007b3o-BM; Wed, 24 May 2023 17:16:52 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wolfram Sang <wsa@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH v2 5/5] staging: most: Switch i2c driver back to use .probe()
Date: Wed, 24 May 2023 17:16:46 +0200
Message-Id: <20230524151646.486847-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=890; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OUcmV/aDVQeDeR5nGR8SlIs7nGGsJjqfq8WSNdRlEbQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkbipagDt5+kTYF5++6mDWycotcoTmkFS4jX6/S Qydo/qI7aOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG4qWgAKCRCPgPtYfRL+ TnGMCACOCDCmvZN1WfmaZQ5Sc0q77kj+ohAdpXctHMoaUfuOMHHQK93F/fb3pPpcwV9rJzNxai/ CdKrgok15Ui876EgeNDXP3YOZ2AZhGZICGDtvndMsp7p6wikIYAMyBBmG2HX2B5ZOtxgr3cY/R2 X31wUg0G2OUHM4s3osdpSfw3oP8vanCxwm8bOKtroI/dCEI+8PH1AM3lr+cqNfnQ0Y2LF1jkMLP axS1LP3bdR36AbfeWciXlcC5mBD8MeCOA56EDn61R7V1VCIJKCyXQlIzNJwFUEFE5SpNzOoUsGT 4PB7bURmfntGvbHzQI2nLvjDrwIkUzu2soxMdht2QAz3R7Bf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/most/i2c/i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/i2c.c
index 4e85e681922f..ce869280a056 100644
--- a/drivers/staging/most/i2c/i2c.c
+++ b/drivers/staging/most/i2c/i2c.c
@@ -362,7 +362,7 @@ static struct i2c_driver i2c_driver = {
 	.driver = {
 		.name = "hdm_i2c",
 	},
-	.probe_new = i2c_probe,
+	.probe = i2c_probe,
 	.remove = i2c_remove,
 	.id_table = i2c_id,
 };
-- 
2.39.2

