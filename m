Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE692F2A
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589697; x=1676125697;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2X8DF81KY87wGHZfFCxWVmkiZl6H3JBIqW51Fq+Q+s=;
  b=E3Bgm6amxuRGsO3FZXjIQGyk1jZ0rOeHbBEdMEzz1QJXM1C9a+VoaYA3
   oSaxu3X5lwLRbgdywBWui35xR5E+xXkmUr4zS5jjbMIrZsiJz0DpaTLTj
   kEEd8ncD73npQ88hTr4p11v6D6fA0OmheR4dKdRLmVdOhK8QAuK3J6u6y
   gYx4m0ypPA0lPMpqJpc+2I1ukpRRSfACMfayfooOQxKK1GQhebEkb/hLO
   NPNYkmGfOy077uFFqJpXDIepeJcoYL+7JphSI8AFP/c6I0ApnH/BFcled
   JKWd5GQ7V6A9ELT24+MO6vS770toOHBKRDs1dcV5lp+0meyU1AJPw5W00
   A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042289"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Feb 2022 15:28:02 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 11 Feb 2022 15:28:02 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 11 Feb 2022 15:28:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589682; x=1676125682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L2X8DF81KY87wGHZfFCxWVmkiZl6H3JBIqW51Fq+Q+s=;
  b=AQQ/jmM2b6G6621xGtJRFdUkpkIUBMfkoKWi+0BlF7GNY79CHxWBXCMr
   05r50VwBIcDI3/RX7bbbuAwueFqfLCN5Sj+RwvXDTf2q/D0KKVVwaql1J
   kstRV4V4UHEkS4LHWWlqva1CGflJiJasAV8IRS9FiVmlvZLLl63FDyr+a
   2Yzbv/b3X36wZ6ESViq0d/D5q71/Vaj1Mgy2GeJwvf1SaPYY+k/YkoO3x
   JxP5fTTFPwYMMYgVMFtoNvyjKBWQdsvsZ09yjihlN1e5vdGTuSPgkEyjN
   LmXDDTMd9kAo93CONTcLp/3xiPhJ2FMfzWFP38HkdqeP6aILOTbCWWRpO
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042288"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Feb 2022 15:28:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 22875280075;
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
Subject: [PATCH v2 6/9] media: imx: imx7_media-csi: Add support for additional Bayer patterns
Date: Fri, 11 Feb 2022 15:27:49 +0100
Message-Id: <20220211142752.779952-7-alexander.stein@ew.tq-group.com>
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

imx7_csi_configure() allows configuring these Bayer patterns when
starting a stream. So allow these in link_validate() as well.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Added Reviewed-by: Laurent Pinchart

 drivers/staging/media/imx/imx7-media-csi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 173dd014c2d6..9c4b72c99be9 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1004,6 +1004,18 @@ static int imx7_csi_pad_link_validate(struct v4l2_subdev *sd,
 	case V4L2_PIX_FMT_SGBRG8:
 	case V4L2_PIX_FMT_SGRBG8:
 	case V4L2_PIX_FMT_SRGGB8:
+	case V4L2_PIX_FMT_SBGGR10:
+	case V4L2_PIX_FMT_SGBRG10:
+	case V4L2_PIX_FMT_SGRBG10:
+	case V4L2_PIX_FMT_SRGGB10:
+	case V4L2_PIX_FMT_SBGGR12:
+	case V4L2_PIX_FMT_SGBRG12:
+	case V4L2_PIX_FMT_SGRBG12:
+	case V4L2_PIX_FMT_SRGGB12:
+	case V4L2_PIX_FMT_SBGGR14:
+	case V4L2_PIX_FMT_SGBRG14:
+	case V4L2_PIX_FMT_SGRBG14:
+	case V4L2_PIX_FMT_SRGGB14:
 	case V4L2_PIX_FMT_SBGGR16:
 	case V4L2_PIX_FMT_SGBRG16:
 	case V4L2_PIX_FMT_SGRBG16:
-- 
2.25.1

