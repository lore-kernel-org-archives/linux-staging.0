Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79D182D1
	for <linux-staging@lists.linux.dev>; Wed, 24 May 2023 15:17:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qEP-0005b7-P8; Wed, 24 May 2023 17:16:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qEO-002W9a-Nt; Wed, 24 May 2023 17:16:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q1qEN-007b3j-TO; Wed, 24 May 2023 17:16:51 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH v2 4/5] staging: olpc_dcon: Switch i2c driver back to use .probe()
Date: Wed, 24 May 2023 17:16:45 +0200
Message-Id: <20230524151646.486847-5-u.kleine-koenig@pengutronix.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=wizD08TBhSQETyhUchWaPzg24srkYaCvp0R89R+tNEQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkbipZkWCAeLC82SD5enEnNJc8um5ZhF5Ovq2vW 2m4SsdtDjuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG4qWQAKCRCPgPtYfRL+ TltLB/9z3JT+OmDzQaP9uo6AefHGOFlN4LXlk6ciiWTwi9WrJbG+gOMvSbHepTSTZSfZIgDsWvz W6X6t7Stxzf3YyrhMsyh2CJGDQCSatEY4aWjj8NGB7S3poQohZ2UKE7rd0h9w2NZnvnxReUfOJG IobP3yySKJ4lGTPF6y8elEVgqeHsfYXOTu/rWHt1Cxh3FWLEIIAiJnSdjmVuWhGhCx+62fBSCdC 1pPy89PpLy/BMoUR7ddQXH077bH+x0cTU02KWvgmkrRqPIPCUf2MeVuE+jQbVqmY6xhCV+tf+0V Bd8OZZRUPM9ze67FrtRoSDL7XN/jjt5XSjTIduNNDfBnI0ZD
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
 drivers/staging/olpc_dcon/olpc_dcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/olpc_dcon/olpc_dcon.c b/drivers/staging/olpc_dcon/olpc_dcon.c
index 2fba52e0bd7b..d5271eac14f6 100644
--- a/drivers/staging/olpc_dcon/olpc_dcon.c
+++ b/drivers/staging/olpc_dcon/olpc_dcon.c
@@ -779,7 +779,7 @@ static struct i2c_driver dcon_driver = {
 	},
 	.class = I2C_CLASS_DDC | I2C_CLASS_HWMON,
 	.id_table = dcon_idtable,
-	.probe_new = dcon_probe,
+	.probe = dcon_probe,
 	.remove = dcon_remove,
 	.detect = dcon_detect,
 	.address_list = normal_i2c,
-- 
2.39.2

