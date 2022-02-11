Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26C2F4B
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 14:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589696; x=1676125696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jyjqm1guo7eCJ26INStDNcH149noY5F5ukFsurO5hjM=;
  b=WmBd2UrokYKSJ1/gAkgTHkdjjqjRtVbkz6+UW2uPq++Uiq/HZcuNx2qp
   rdDFcyvymFT5oVLKhew7BNOQFvipQC2GhLTn8Q+CzBXHK1tjqYBfBV+vy
   F2niAqyk1HXZNW5NGSNVFxjg6AgVt7la4B8IlyED1C+l1sA/5qyBsyYsK
   D4OZT0abd5NbskQFDFJ1ww+WWRuq8symuIjAjvcjB5Fsj/n/evti6A3pS
   MfbVtNHHl9jgmOf5YzykOE8SkYjUxo6eiar5U+YE1xL+Thsl4URs9C6m6
   nWlNzhz0EohfBi/LtlWiUYs6CMtHZ8Yf4Ei/2wSp5rbZ9d7O75oc945PU
   g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042287"
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
  bh=jyjqm1guo7eCJ26INStDNcH149noY5F5ukFsurO5hjM=;
  b=jUJbuqe9IzrHR55d/NDW2BudEfLR7S1sHyC8mcxeAipryI/O1JEWUtmM
   DZTrwwhyqnm4Y8Y2iY2iPmqFKT1iuQfWRz4EfT/Rp9ADL7o9jiu0RK4UD
   Xm7EtI4fk4An7zG2AKBNxCVi4HIIVnmWi95zNbRf9mAx2BKwwWlwOlSZm
   YSUtzY5CtMsUoGAzXVKci3hpcGtV/xNkYQRA35Jaf7gJAB/FVboRQAjrM
   4jtTgRnbi2LbwHNXu/zO7AtM2E2E70vOltJ3yGOmzoD4DwOTGZJdfteJT
   cu0fTJV0GM1tBfzzA1SHNXYkc1qxTLTOTf3fBKdEtkp7erkdzhPMi7XLl
   A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042286"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Feb 2022 15:28:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D0D31280078;
	Fri, 11 Feb 2022 15:28:01 +0100 (CET)
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
Subject: [PATCH v2 5/9] media: imx: imx7_mipi_csis: store colorspace in set_fmt as well
Date: Fri, 11 Feb 2022 15:27:48 +0100
Message-Id: <20220211142752.779952-6-alexander.stein@ew.tq-group.com>
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

Without this the default (SMPTE 170M) from init_cfg stays unchanged.
Even after configuring 'srgb' colorspace (or 'raw')
$ media-ctl -V "'csis-32e30000.mipi-csi':0 [colorspace:srgb]"
the colorspace does not change at all:
$ media-ctl --get-v4l2 "'csis-32e30000.mipi-csi':0"
  [fmt:SRGGB10_1X10/1920x1080 field:none colorspace:smpte170m xfer:709
   ycbcr:601 quantization:lim-range]

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Store other colorspace-related fields as well

 drivers/staging/media/imx/imx7-mipi-csis.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index a22d0e6b3d44..388cfd012212 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -1062,6 +1062,10 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
 	fmt->height = sdformat->format.height;
+	fmt->colorspace = sdformat->format.colorspace;
+	fmt->quantization = sdformat->format.quantization;
+	fmt->xfer_func = sdformat->format.xfer_func;
+	fmt->ycbcr_enc = sdformat->format.ycbcr_enc;
 
 	sdformat->format = *fmt;
 
-- 
2.25.1

