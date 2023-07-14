Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0F20F96
	for <linux-staging@lists.linux.dev>; Fri, 14 Jul 2023 20:16:41 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDM-0004H2-UB; Fri, 14 Jul 2023 22:16:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDK-00EQNA-I0; Fri, 14 Jul 2023 22:16:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDJ-004tp4-O1; Fri, 14 Jul 2023 22:16:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH] staging: greybus: pwm: Drop unused member from driver struct
Date: Fri, 14 Jul 2023 22:16:22 +0200
Message-Id: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EfL1/SSC+L7oVf2UIMoh7qa5MkR+UUBhv0doVq0EsHI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksa0VTkLCp9h8DHvxtctRg88jL6TBnMTnnkkrZ Vb1QRSNGH6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLGtFQAKCRCPgPtYfRL+ TifzCACaI0s/ckXOHKX6Tn5gyuGz98HoBoFMZkxWRxx+qTKYwnur20H7fYzO+fPPmYg+UWDX4Ev hmW6pMnZiCNY14tgXpp0d2i8NDV+R6vBaybplk2ikZvsSDD4vk9uX/Z9+yObgSo7mprVMnKnheP Dnrd2erPKr+CP6v+z9vYpVSZnckPf+iNgNFy5t1d5la2vP8uKd7Zv9iDiqCRBvca7oBN+SjY1Vt 3M3SmVpQpOyeRgnTVDLZ7Gdw/ZFI2kT4peR1sqe6Ae6PWtYrDn0Zfnmr0n+lNMyA1v5rCwZAHfZ 0GOh7egs5CgzcL6aKnKKr8wlVHyAmtVrHULXCVNcmXVG9rxH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

The driver doesn't make use of struct gb_pwm_chip::pwm. So that struct
member can just be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/greybus/pwm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 88da1d796f13..f569d371a007 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -19,7 +19,6 @@ struct gb_pwm_chip {
 	u8			pwm_max;	/* max pwm number */
 
 	struct pwm_chip		chip;
-	struct pwm_chip		*pwm;
 };
 
 static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)

base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.39.2

