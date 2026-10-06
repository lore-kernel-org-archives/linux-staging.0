Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B75A1F192E
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 02:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791253156; cv=none; b=eq2tnPSjun0KmOwQ2C+pXrkJoQpCNak/qEb7IX9u2tijsHksRXV8hBQyDwoVbXnNTptHJN40DoI4KqSxqLKg4bHUtqHthJX8iEdw6i069H6o7jKdkYXWokW7tndnvk1u10WX5RmR2HEkKygVNZkUJEQi+iEOF/vf0+dGZWpMlxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791253156; c=relaxed/simple;
	bh=BmaEHSA4Sc5Ix5xoHHxmdmGUN9bsHAfm5IqRRWj5dtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xd+Mcb8P6Z5lYZBa6pP3KK49lnFzfelj9Z3UnBRfgIeGYMdZAJyUQrKzDiz0fPAe95xCZuewM+IL2q0W+IFpAxD1+S8oapCY4vc0p8wjR+6MOXVpFjHzFjIrLAWgW350xZQo2EyUp2eY3ZaTNP8GR2+ffY7B0ENXl8F2J8aIOtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tqw8OKSQ; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tqw8OKSQ"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-351348eb579so677033eec.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Oct 2026 19:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791253154; x=1791857954; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goSUC8rOLbR1QanLKh3MMf1EmDUtSXdm+TglUr6s/zM=;
        b=Tqw8OKSQhpHbUGcMXJZ+YBNzDxbAgq+V0YtNQ99K6KWApWhkz5IpQRG3onWl7Fqe/3
         aeALYtLIfkZbsabTmqLzy1Xp//u3gKFlU37WTiP4Wj8v76+OeFcB13XnhPDDeJJ0Uqi8
         2jiO8Xb3n0JRiLjPr/NpJLuRMp/DdVgEKExxtPqtJC1vxhcGNpfKMKKFUHLY4GMlf8A5
         S54W9bnjLK4FOeZjAfEW3HK4e5Zk+YcjtCWgnpAp5LmZ3ZC/b/eXeL38R7cBm0VRKXbV
         AIrA4HiiyOYPyYbhA03eZZ/sw9uWdU+aJb86IazKMbdU8SuGPVHqJ3BVa/ZEVziDrD8S
         4aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791253154; x=1791857954;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=goSUC8rOLbR1QanLKh3MMf1EmDUtSXdm+TglUr6s/zM=;
        b=WkwNNVWb8mJBoO97s+khRxzYIZ7SbI2R4wBGZPobPinHXrjiNKCYX0gdze4gghEf9N
         C4kfPxyxYuIldh6vch6vBK1atz4Mcz/RgDBBXdIymiqf+MhvlZ4NqMEz2DTsMTsy1kAk
         +aKHumIOgYlGnV3AZtQq+6oOpW3SIHZT9LWM8Enh9wiabQJ1Z/xjI4t0hkg0f82fQkLX
         WfrdVRi7wCfCejVQu+mGxD53UMpJsI5WWIj+xEvDlY587hQSenUZKSaN+TXVFWUqJf7U
         ourXbB2DzXMtFkKqiLwYEPphEKF8CHHZVJJG/UmOy+NejLavmUFvuze75isqRI9C+ubW
         Z9og==
X-Forwarded-Encrypted: i=1; AKwUvByqWSVIxXSRquJnEKHNe2n/VsGhk/gBolOh9hRjgmhqpZ+ZBXfQIdX6ktxBtmnDVzc7O7M6/qV/SeLYExDf@lists.linux.dev
X-Gm-Message-State: AFq9FYIa5O22vUPgSoSQImjMfpbSk2VpO1KEStPMUXYCktrAsdqSSycs
	b2Nw1gOr8ZXfKdki585YqQcFw8KzyYEDYjuq+AoMhd7pNgvZ5yDrSs0h
X-Gm-Gg: AYBFou2qz7hmk84wxR7h1eEMWcadJKFUPfZc0kD1DoxyVw6GILj2fmQJvVUEpDNq8oy
	TVjYrwyum42CAQjzXj6hnrUEvjsjJgfiAbvn4A+GiYY33Ds6YqVaHKE7zzhdvPlvI1T/Adt2Oyi
	XzqdseVbK+OhEcFu1HpOBB2eXqjHAA/b3c5rYKDSm1YfospEGHPJ2h7/+ipURB4A9EsLIFDkaB1
	V49gdocUicHI0DgKQebf2Pn3Elj/vjI+F5kfdAj3GbbVYXE0h7j+8Uoi4vUBcbWbRzKBH2rMjMw
	GC6NtRxrAPAOLCFLXDKpioHhxLg3/21EW/s3e3yFtpJ6dz/jIFMSXVHtJJkYtnZVXRlve9CCArQ
	78Y2pptjB3vDtHn9dSycGDTJtO3TyJHheZi1wUbKXnqmypo3iGWmjyL4VKRp2pWJ2e7KogCKptf
	nLaQPwd64DbVQpDKm2TLOfs3rS20Zja4A1KbKaEg9vqnPfFRHNXlHm0r9HY27Y2Y6Z2ZKcDLvZ
X-Received: by 2002:a05:7300:e9d7:10b0:351:2200:1cde with SMTP id 5a478bee46e88-35145200a8emr1646887eec.8.1791253153514;
        Mon, 05 Oct 2026 19:19:13 -0700 (PDT)
Received: from arlo ([2607:fb90:742b:7290:cb9a:9a47:ea69:3868])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146a5b004sm3016308eec.18.2026.10.05.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 19:19:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 16:19:08 -1000
From: Raiden Horner <raidenhornerdev@gmail.com>
To: slongerbeam@gmail.com, p.zabel@pengutronix.de, Frank.Li@nxp.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: media: imx: Fixed depricated implementations of
 80 char limit & open parentheses line ending
Message-ID: <asRanEEXSR2hDM_e@arlo>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed open parentheses line ending issues & readability.

I presume this syntax was there to meet the old 80 char limit, and
double checked the changelogs to make sure this was not already
submitted.

If not I apologize, I am still getting used to using the indexing
system.

Signed-off-by: Raiden Horner <raidenhornerdev@gmail.com>
---
Changes in v2:
	- Fixed line wrapping in the commit message to adhere to 75
	  columns
 drivers/staging/media/imx/imx-ic-prpencvf.c   | 13 +++--
 drivers/staging/media/imx/imx-media-csi.c     |  4 +-
 .../staging/media/imx/imx-media-dev-common.c  |  2 +-
 drivers/staging/media/imx/imx-media-fim.c     |  5 +-
 drivers/staging/media/imx/imx-media-utils.c   | 54 +++++--------------
 5 files changed, 24 insertions(+), 54 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..69f5ca280454 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -704,11 +704,11 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu,
+						      priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -761,9 +761,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index ef22a083f8eb..4eb621ddda25 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -679,8 +679,8 @@ static void csi_idmac_wait_last_eof(struct csi_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp, msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&priv->last_eof_comp,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(&priv->sd, "wait last EOF timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 0d0ee8627a2d..be445df93518 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -377,7 +377,7 @@ struct imx_media_dev *imx_media_dev_init(struct device *dev,
 EXPORT_SYMBOL_GPL(imx_media_dev_init);
 
 int imx_media_dev_notifier_register(struct imx_media_dev *imxmd,
-			    const struct v4l2_async_notifier_operations *ops)
+				    const struct v4l2_async_notifier_operations *ops)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..9e9bacf9dcec 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -205,9 +205,8 @@ static void fim_acquire_first_ts(struct imx_media_fim *fim)
 	if (!fim->enabled || fim->num_skip > 0)
 		return;
 
-	ret = wait_for_completion_timeout(
-		&fim->icap_first_event,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	ret = wait_for_completion_timeout(&fim->icap_first_event,
+					  msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
 	if (ret == 0)
 		v4l2_warn(fim->sd, "wait first icap event timeout\n");
 }
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f119477cac6b..00cd391b5ff7 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -16,18 +16,12 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 	/*** YUV formats start here ***/
 	{
 		.fourcc	= V4L2_PIX_FMT_UYVY,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_UYVY8_2X8,
-			MEDIA_BUS_FMT_UYVY8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_UYVY8_2X8, MEDIA_BUS_FMT_UYVY8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_YUYV,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_YUYV8_2X8,
-			MEDIA_BUS_FMT_YUYV8_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_YUYV8_2X8, MEDIA_BUS_FMT_YUYV8_1X16),
 		.cs     = IPUV3_COLORSPACE_YUV,
 		.bpp    = 16,
 	}, {
@@ -71,10 +65,7 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.cycles = 2,
 	}, {
 		.fourcc	= V4L2_PIX_FMT_RGB24,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_RGB888_1X24,
-			MEDIA_BUS_FMT_RGB888_2X12_LE
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_RGB888_1X24, MEDIA_BUS_FMT_RGB888_2X12_LE),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 24,
 	}, {
@@ -132,55 +123,36 @@ static const struct imx_media_pixfmt pixel_formats[] = {
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SBGGR10_1X10,
-			MEDIA_BUS_FMT_SBGGR12_1X12,
-			MEDIA_BUS_FMT_SBGGR14_1X14,
-			MEDIA_BUS_FMT_SBGGR16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SBGGR10_1X10, MEDIA_BUS_FMT_SBGGR12_1X12,
+				       MEDIA_BUS_FMT_SBGGR14_1X14, MEDIA_BUS_FMT_SBGGR16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGBRG10_1X10,
-			MEDIA_BUS_FMT_SGBRG12_1X12,
-			MEDIA_BUS_FMT_SGBRG14_1X14,
-			MEDIA_BUS_FMT_SGBRG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGBRG10_1X10, MEDIA_BUS_FMT_SGBRG12_1X12,
+				       MEDIA_BUS_FMT_SGBRG14_1X14, MEDIA_BUS_FMT_SGBRG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SGRBG10_1X10,
-			MEDIA_BUS_FMT_SGRBG12_1X12,
-			MEDIA_BUS_FMT_SGRBG14_1X14,
-			MEDIA_BUS_FMT_SGRBG16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SGRBG10_1X10, MEDIA_BUS_FMT_SGRBG12_1X12,
+				       MEDIA_BUS_FMT_SGRBG14_1X14, MEDIA_BUS_FMT_SGRBG16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB16,
-		.codes  = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_SRGGB10_1X10,
-			MEDIA_BUS_FMT_SRGGB12_1X12,
-			MEDIA_BUS_FMT_SRGGB14_1X14,
-			MEDIA_BUS_FMT_SRGGB16_1X16
-		),
+		.codes  = IMX_BUS_FMTS(MEDIA_BUS_FMT_SRGGB10_1X10, MEDIA_BUS_FMT_SRGGB12_1X12,
+				       MEDIA_BUS_FMT_SRGGB14_1X14, MEDIA_BUS_FMT_SRGGB16_1X16),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 16,
 		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_GREY,
-		.codes = IMX_BUS_FMTS(
-			MEDIA_BUS_FMT_Y8_1X8,
-			MEDIA_BUS_FMT_Y10_1X10,
-			MEDIA_BUS_FMT_Y12_1X12
-		),
+		.codes = IMX_BUS_FMTS(MEDIA_BUS_FMT_Y8_1X8, MEDIA_BUS_FMT_Y10_1X10,
+				      MEDIA_BUS_FMT_Y12_1X12),
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
-- 
2.47.3

