Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8EE746F
	for <linux-staging@lists.linux.dev>; Mon, 12 Dec 2022 22:13:29 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r31-00031R-RS; Mon, 12 Dec 2022 23:13:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r2z-00475m-Gm; Mon, 12 Dec 2022 23:13:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r2z-004bn5-Bo; Mon, 12 Dec 2022 23:13:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	kernel@pengutronix.de
Subject: [PATCH] staging: greybus: codecs: Drop empty platform remove function
Date: Mon, 12 Dec 2022 23:13:15 +0100
Message-Id: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=l3XOAAkkql1vMFy8UQXFieGDro8LK6E6M4V+R1agfPk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl6d4vMKwNv1IwAiAygn4VYfarbkQt0eoqsnny6/S 34ALW9WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eneAAKCRDB/BR4rcrsCTthB/ 4jB7uWGmfrH2Ruy/jLWm9yrUDSk77eoU14IH1Df1xOTvqRQyrert2HLL+/GQrdwqqtVGU4pHYTMqhH +I6npjgQSpiTt12KPiOT+mADW4PL24dWVsAzSoAOvqxEoLwlJdXB+WB8bApMV6L31GEcKq73wAb+tG ijKP2UiluBgWf88aLfxjUUS8AHf8rPYXqeqDJ/GmFoJQliwhoQegZRx7hMd3YfaRS1BZWXUWAZ1/4R c/fYJdKhpdzBpHo4Mr4XUdycuLSbhc48LhhbaSJOVOmInF7rhsfkxTTsFCpslaKOsxFM3l8hoiOoJ7 i7gWslmDsOhNrefq63I4gFuqJR/uYV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/staging/greybus/audio_codec.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 0ad8aeabccbf..72ace74ea605 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1075,11 +1075,6 @@ static int gbaudio_codec_probe(struct platform_device *pdev)
 			gbaudio_dai, ARRAY_SIZE(gbaudio_dai));
 }
 
-static int gbaudio_codec_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static const struct of_device_id greybus_asoc_machine_of_match[]  = {
 	{ .compatible = "toshiba,apb-dummy-codec", },
 	{},
@@ -1094,7 +1089,6 @@ static struct platform_driver gbaudio_codec_driver = {
 		.of_match_table = greybus_asoc_machine_of_match,
 	},
 	.probe = gbaudio_codec_probe,
-	.remove = gbaudio_codec_remove,
 };
 module_platform_driver(gbaudio_codec_driver);
 

base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1

