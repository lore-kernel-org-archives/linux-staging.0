Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECED7E
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 11:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826128; x=1678362128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FnQQsmu2PoAxzjaqNV9WFO09njNrUxb7Lfkd5IwbIUg=;
  b=eB3QMYDTM7m+UergNpvvtYx22l2j8maP/sbMAjv3P4oRlJR2P60tXjc5
   rSULFPZEPJaxJ4XZdYKqXjuA7NQSIQ7QbTjY6waFWUpcD/FmmrOKV8dQP
   o4y+xIbzCyiD1DWrZTPezlAW6h1GYWA9dRxUNYNTasbX1dTwQQu+LxR7T
   QsM7qjOoRH+RCFU7XnFMCSuiYd5fbpoiguPZQ7LhCqFpK5lPDVzMzwppj
   WPA2lb+/9m1waFcMZuhyArBBsC09FpTSP1mO0RamugT4vBDc+hVVQlAML
   hdpNYByOIJ5hcUxxS/jxxlQIUjylYTlS5oNMBwdJKgFVF0pQ4Xf8+eGDX
   w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553373"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 09 Mar 2022 12:41:55 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 09 Mar 2022 12:41:55 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Wed, 09 Mar 2022 12:41:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1646826115; x=1678362115;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FnQQsmu2PoAxzjaqNV9WFO09njNrUxb7Lfkd5IwbIUg=;
  b=UyG8XPM3anOjIfRU3RwGxQVBFxW2FoEiOO/K1+Hmr5pbbQEghJdK9fR2
   a5U6y7R7enKc/2ZNYQArt+2Zp40xNpKMBgTK40N/OeNwDFF4ctetWcWiE
   MwHzPv1qMaQ446UKUzFvKXLUHEcb3HuiaYtluUE2FQv+PrA5mX6dGmhT2
   z3H+eyhuUNxKHU9AF1nKmv86FGU8gPr6poaGswhYsQ8q1npnrCj98pIAN
   tqaGgegs5F/60xrqd/eJUMw9uJkRsPq3iLicMxzm09FiWPcOogjJmSGbC
   pbZ/YG2JU6dAYOf75xYaLs4ar7LsjJq1yib9ziqLNNHajH1+nNVy6acnF
   w==;
X-IronPort-AV: E=Sophos;i="5.90,167,1643670000"; 
   d="scan'208";a="22553372"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 09 Mar 2022 12:41:55 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 429B7280065;
	Wed,  9 Mar 2022 12:41:55 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] media: imx: utils: initialize local variable
Date: Wed,  9 Mar 2022 12:41:43 +0100
Message-Id: <20220309114144.120643-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
References: <20220309114144.120643-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_media_enum_mbus_formats might not set code at all, this would result
in imx_media_find_mbus_format using an uninitialized variable.
Set code to 0 to avoid returning a wrong pixel format.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* None

 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index e69bbe0d6c83..1665cbd6b3a5 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -610,7 +610,7 @@ static int imx56_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 	 * so until it does convert to a supported YUV format.
 	 */
 	if (cc->ipufmt && cc->cs == IPUV3_COLORSPACE_YUV) {
-		u32 code;
+		u32 code = 0;
 
 		imx_media_enum_mbus_formats(&code, 0, PIXFMT_SEL_YUV);
 		cc = imx_media_find_mbus_format(code, PIXFMT_SEL_YUV);
-- 
2.25.1

