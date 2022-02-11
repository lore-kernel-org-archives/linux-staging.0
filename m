Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB57F2F4D
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589699; x=1676125699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVwA5iF57xiLgmukQKD1z++wAGAZGsYpQ1hwH3ud7Uo=;
  b=Ym3/4JgExwilLzG2pdwlswpcouRaxCKPhxqI3YPEKsLQjjsnas988vq6
   FZg7Zx9G6ifnoSHLwjhwWz+ZD6ZaB0P53Uk4mw1DM60jingbyAEEuQKL4
   +7IJAFzvC2wXtOH4xTbyl+qutv7P+HmDH6xh4W217uug+L0aiorpGQV3N
   qSz+EYfWQ+Xx+/GsoTfF1Spj2FF4Hn3GsoIVHqz3lHIG3F245CYuHypjl
   3mQDxp5y1DhB9fWF90IZziOB9KjvcTTV1iDyxRFEZRk5acuRS40xaxS8d
   dzy+ulaP0rvP1mHRp/ZhZ0hcoAb5LI+AMEo7hOz6JwRkx247JPmzUuj6R
   g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042293"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Feb 2022 15:28:03 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 11 Feb 2022 15:28:03 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 11 Feb 2022 15:28:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589683; x=1676125683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVwA5iF57xiLgmukQKD1z++wAGAZGsYpQ1hwH3ud7Uo=;
  b=bwilSwPasSRi2A0rXc1P3ecoRUbBlWFywWx/pFGJ1QJ6+ItLYiHz5jfE
   a16799MGhdlDrWd9g+g/5Ry813AqSYuEz2Y2bnAc1mqCfrXWKzDlZK6ZI
   b35CPt1Xlwe3nYKnRttbUGpeeW6qwdSbs5GII7L5wSUmnd+wERY2zUxAH
   AFAlxucXUE1g9N5tDXtyXVn9+xE+Aqn0ozAoEpI8sfmQhWPv244tDyJ5u
   KUGOJC/+G8Ii+eksOaC3odXKH2bM+L+vwX2UvNaWGJbxIqeXxszrBAmZd
   j3sSIa2jyJsfjZAMK0lGbtKOxnHSlMewKdQ7AaEIs770C3JfhV2UvJFbB
   A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042292"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Feb 2022 15:28:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id B14CF280084;
	Fri, 11 Feb 2022 15:28:02 +0100 (CET)
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
Subject: [PATCH v2 8/9] media: imx: utils: initialize local variable
Date: Fri, 11 Feb 2022 15:27:51 +0100
Message-Id: <20220211142752.779952-9-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211142752.779952-1-alexander.stein@ew.tq-group.com>
References: <20220211142752.779952-1-alexander.stein@ew.tq-group.com>
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
Changes in v2:
* New in v2

 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 57eb1c5897c0..025c080c8c9f 100644
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

