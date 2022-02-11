Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B371F2F43
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 14:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589699; x=1676125699;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2YbGiltNp/YE4sAiVmdcESfjGWWvEMo8y3ASodgdy24=;
  b=Hw0jXknjSn6TH6hf4q7IwCs4csjWxLDqXTfS9WVIjQ4JOHe5HjQEJ8Vd
   EsLRWsVEREjuf7xvCsUh7JXUDBjWcm7MUL90WGSJcha9jwJLX9/V1bvwu
   1YUK6Zq+xxEHmrAOq8nk1beYkEV+li5zetsNTGtpi2OsbE8my8Y2BRQnS
   b7VzlBwgHb46i31g1RINLn26/g3d2p6HE/CsrvOx3X399GCG6jIbtUNYr
   MCiWZHagSUdKkCeJyRdqBMBq9/JBMjt0M0623Hkpn7QzdRBopm2wsmaB6
   L7rjpnrRUpIH/3LVNoTZo9tKn0kQCRjgFfBz8oINotL1ErgaK16OuK7MK
   g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042291"
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
  bh=2YbGiltNp/YE4sAiVmdcESfjGWWvEMo8y3ASodgdy24=;
  b=RVnyBrXpP49Mnw3iSjq5n36YBxv+AjKKAhB8lryGc/V9ZSEJRMZ6uGr5
   HgS9tw/9Ax7nz9aSy+8c4PqHcooukytnpx3xl8/kHEZBWCAXYadSgwCGZ
   pv+i/SP1S2w5575egc6DFYxZbpgdVPZy1MuCDZcAOJFKI+rerBCtTy5nX
   9p1BbMAc1s3DgMGOr3v9hJZC9HVHQriaPLWiaQMjpKuA3eHYZHEnoCFBV
   mbRbnQ7+I7Xkx6NTf84c/SkFyb04QZTkdtt6rQ3etc1hwHraZO7oL5ekg
   bnZzDkROzk/ZspBfXpmOBE0j1ymFhbLHTHKeGRLbtZOAKkciEl+W33SBE
   Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042290"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Feb 2022 15:28:02 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6C212280082;
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
Subject: [PATCH v2 7/9] media: imx: utils: Add more Bayer formats
Date: Fri, 11 Feb 2022 15:27:50 +0100
Message-Id: <20220211142752.779952-8-alexander.stein@ew.tq-group.com>
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

Without this the ioctl VIDIOC_ENUM_FMT will not list the 10/12/14-Bit
Bayer formats. This in return results in
"v4l2-ctl --set-fmt-video pixelformat='RG10'" failing to set the
pixelformat.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Added Reviewed-by: Laurent Pinchart

 drivers/staging/media/imx/imx-media-utils.c | 72 +++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index e59aaa77172a..57eb1c5897c0 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -130,6 +130,78 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 10,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 10,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 10,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 10,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR12_1X12),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 12,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG12_1X12),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 12,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG12_1X12),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 12,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB12_1X12),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 12,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR14_1X14),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 14,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG14_1X14),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 14,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG14_1X14),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 14,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB14_1X14),
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 14,
+		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
 		.codes  = IMX_BUS_FMTS(
-- 
2.25.1

