Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE482F43
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589694; x=1676125694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KxUxndkotnH5yr6uUoFqaSWbYhYL9OQrUbXKgdspQi4=;
  b=MZpZUT0QexiWCcr27/AVA8ntmLQOsh3vMHNmNpIJR2xsjlI9AF3qZTgf
   I52XfTz8VbhO/3VNIuoCvD8BTv35NYCXKON07oaqSLf7R56B2vi3AcZma
   RxYVnY0q/oiLWcgoH3+nkssSQl+KA5tavrWQHE8hlSzvUZqE4PXv8/DG1
   3vqhasHc3Bi8EKhCsC1ZyQ14PRPbgltYVmhSyoyd5urx8i7sdmdkefAN5
   IGdJqw/JjpYXlH0pk1w26ieClFu+VvesHwsDyAZuZMrGmZKtnyQ8wtGUr
   uXfXiFGdWhOzsmh488xSpHTmzT1DsigdTm8aaOYBELk4ztWUjBsbSMc7f
   A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042281"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Feb 2022 15:28:01 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 11 Feb 2022 15:28:01 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 11 Feb 2022 15:28:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1644589681; x=1676125681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KxUxndkotnH5yr6uUoFqaSWbYhYL9OQrUbXKgdspQi4=;
  b=D3VpOMgeHtT8ty9hwXauIOf8XjA6fUGMBTywnpsDafmy0cCQ1ro8gA6L
   xuQjKG1+aa1NJisJUvNb++EW79iVeVWfzSaZK/5939CW+Y1Om5QsA2RDV
   Bq6VBTlfsWFCaLNuY2pVrBD6YNPnll7B1D5vP+PdEHhUHMQEfcriSH31Q
   Gt5RWDNKKXqDZj4/Vyc05LiACE3O49zncMCnzguquoY9zXglX9u9NdKzd
   ky7WkVq0JqbW0jVYtYT4CNNB9nTypp/9MiSpr5wGLvNT+tHVVElFvDJIb
   ZzQ2KLng05LNZm3kGW9UCZwgfWGXf7fJNafAf+SkCzk196vgcLMY51NNA
   A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635199200"; 
   d="scan'208";a="22042280"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Feb 2022 15:28:01 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D084F280078;
	Fri, 11 Feb 2022 15:28:00 +0100 (CET)
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
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 2/9] media: imx: Forward type of hardware implementation
Date: Fri, 11 Feb 2022 15:27:45 +0100
Message-Id: <20220211142752.779952-3-alexander.stein@ew.tq-group.com>
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

From: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Pass down the hardware type so imx_media_mbus_fmt_to_pix_fmt can do
the actual switch.

Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* Switch back to using enum
* Added Reviewed-by: Laurent Pinchart

 drivers/staging/media/imx/imx-media-capture.c | 15 +++++++++------
 drivers/staging/media/imx/imx-media-utils.c   |  3 ++-
 drivers/staging/media/imx/imx-media.h         |  3 ++-
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
index 65dc95a48ecc..7a6384b3e5e6 100644
--- a/drivers/staging/media/imx/imx-media-capture.c
+++ b/drivers/staging/media/imx/imx-media-capture.c
@@ -139,7 +139,8 @@ static int capture_g_fmt_vid_cap(struct file *file, void *fh,
 }
 
 static const struct imx_media_pixfmt *
-__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
+__capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose,
+		  enum imx_media_device_type type)
 {
 	struct v4l2_mbus_framefmt fmt_src;
 	const struct imx_media_pixfmt *cc;
@@ -171,7 +172,7 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
 	}
 
 	v4l2_fill_mbus_format(&fmt_src, pixfmt, 0);
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src, cc, type);
 
 	if (compose) {
 		compose->width = fmt_src.width;
@@ -184,7 +185,9 @@ __capture_try_fmt(struct v4l2_pix_format *pixfmt, struct v4l2_rect *compose)
 static int capture_try_fmt_vid_cap(struct file *file, void *fh,
 				   struct v4l2_format *f)
 {
-	__capture_try_fmt(&f->fmt.pix, NULL);
+	struct capture_priv *priv = video_drvdata(file);
+
+	__capture_try_fmt(&f->fmt.pix, NULL, priv->type);
 	return 0;
 }
 
@@ -199,7 +202,7 @@ static int capture_s_fmt_vid_cap(struct file *file, void *fh,
 		return -EBUSY;
 	}
 
-	cc = __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose);
+	cc = __capture_try_fmt(&f->fmt.pix, &priv->vdev.compose, priv->type);
 
 	priv->vdev.cc = cc;
 	priv->vdev.fmt = f->fmt.pix;
@@ -418,7 +421,7 @@ __capture_legacy_try_fmt(struct capture_priv *priv,
 		}
 	}
 
-	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc);
+	imx_media_mbus_fmt_to_pix_fmt(pixfmt, &fmt_src->format, cc, priv->type);
 
 	return cc;
 }
@@ -889,7 +892,7 @@ static int capture_init_format(struct capture_priv *priv)
 		fmt_src.format.height = IMX_MEDIA_DEF_PIX_HEIGHT;
 	}
 
-	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL);
+	imx_media_mbus_fmt_to_pix_fmt(&vdev->fmt, &fmt_src.format, NULL, priv->type);
 	vdev->compose.width = fmt_src.format.width;
 	vdev->compose.height = fmt_src.format.height;
 
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 94bc866ca28c..c42f3da8e3a8 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -518,7 +518,8 @@ EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc)
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type)
 {
 	u32 width;
 	u32 stride;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index e4c22b3ccd57..f59feccb26bf 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -203,7 +203,8 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 				  const struct v4l2_mbus_framefmt *mbus,
-				  const struct imx_media_pixfmt *cc);
+				  const struct imx_media_pixfmt *cc,
+				  enum imx_media_device_type type);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
-- 
2.25.1

