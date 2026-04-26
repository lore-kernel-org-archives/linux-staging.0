Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0612AD00
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 00:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777163224; cv=none; b=hWrdVs2w7exFFx5/E8dyAEMLVbBrQcszLwWL1ywkWodS+PTYElVpEeOQqpi4wt0I3Rw9MQTsxmlD2wJaQuCglCaHdF0kzqpRt7W5iyqywiMICpPt8gbnoAkhorTtAj6ObcAICC1BfiRXD2fbOyBa1VpFBAXLf0ZatUgiBf+Aewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777163224; c=relaxed/simple;
	bh=YCLbslie3NiZPx9jQSuzjpl73nOvyJagEqFdIclfqOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbFEJKKag9WMQ/jrEctpbKTQ8+gRE6eq1YbcM0UwUPrZX+4Uk14epEh+CLaMXDJ0lauvLJExUM5CmCfFOF7RMxf6cuOC6yCJfDrurfgWCaPnbXhAicviDJzGmN/OSP9IHzNMX+4KPtBLJ6O23wttLH84ulouFrEFGPTWShMAus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9GzlPlX; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9GzlPlX"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1379078785a.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 17:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777163222; x=1777768022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kFNy+gHycOTnjB6H7mfknpfmC1xnEHBgISXSIOKUt5I=;
        b=Q9GzlPlXqeBMnc3hTDnd/elj+fIV1YIv3IYF/9ibO8ZPqwIhEn6CRQLSvZnd7M5Qgq
         EtZ267KKOET+JLxuKTK43y3TrP8/HsOvO5P9c1T9HMjlcEP6mj3ISEm7DmYSbeVG/EUP
         g3mw+ntBuGiieEwAbQePKcDCPk0oBbVwLrZD9CHkgi6irqMPcPSG0lp70F3HJHLd3VTB
         BU6cHD38u9c0ClffbfhkyEQvzUd9Z+j4hlGOg/rjkrRwc4Np0Mi2gVml6yHsIBYWeBBP
         V8PItCPnzLEzsKsP8qj8vGM7xwq+B7l2KPAxxUptahf9h8ONpJ9LkP+5g+DCOogxxzVq
         8bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777163222; x=1777768022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFNy+gHycOTnjB6H7mfknpfmC1xnEHBgISXSIOKUt5I=;
        b=HPBKX0nQHN+DAaU3U6RdHaONSvFrveni+7FVR+saKIFc+BZAeKoBEpfYQ9rTGbe6EF
         WHRZ18bQYXFMA2aEN3KgZ6OjXge0Bb4hR7DyvEQmls+b//vi0nzzNr5baBiFiMDsr9Sa
         CuU9ewMJFCJpYSmWx1Jg8RH5HiVK17Bos60wTrNTOaS7pIloL8Y/QvV6U51x6BQpzvME
         t3qUfL3I3VnxB5StGnXvts2ttNmapojzYVF7FtEzAwRFQUXHdqKDAZSMILyK87jq+/Of
         mXEPb4LSgQQ2U0g9pdTpQLKAIhfOaC+7/DSW25oarlaFQhh14TO1ZDcU0FoJfeiGiaCx
         Av/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7ckDP8L55KU8MsM/VJ+eSeUte1u3Cjg2RxGSU66ZDef31SH/3ueufJGV/42v67I7E1v4tcCiOADcXoEq5@lists.linux.dev
X-Gm-Message-State: AOJu0YxGScWCrNp7AW9cj+Z/mUQ7HVgLgTAw3x0rmun9z3bbTNZGccT1
	XSIc8Z2k314HddI/vGG9gENpWX26CQ1IBD7BKowzbxIgVPuWNbyf8+ky
X-Gm-Gg: AeBDiesNkqyNjzZ7dXKB65+eZVFw1kdAiAf6KbK2UEt3LlQ9wcVOMV0Sml/XpqLsaMH
	7w8n2M++rYvMH0ujmfyc2u6/iQmnWOayQxl5ewlkkjxxnRDFuucoRiS0UOcWk2F12+Ccz65GvaQ
	FQ03anl7xgDx69u9hrY8Mvix3hrLLF7mNYLYCJiEhenEkVEhioyngfYbl8xyjsU5A1cF2pEjsQK
	61hpyvjwbVoXmHo2WVkFKJlbBgsBpHisYNltLN4GY9yUZK9NjZpj3l1dmTFbSU0iVy4H5Qv/jDm
	GRW0aiEcDffTcZ0b+pjqz6J47GaPRYAK/6TjMvyRUjdLIjzmVJgt4PWZn42/eK+TNMYXMNvVbTZ
	Qq8RWxGRSAQbDFfcb4n7QTBzZfEV1yxk6zkEa9GJp+GnI/Msvg/j/OHS3aKWcySdl2Rl7tK8qyC
	AF4O45jFefDh7oEd3ilQnSG+PuF8Di6jS9vb/BYG0JjUKpafmh2857Jf2Dn6g6IbnEZMVj+2ZNI
	JLJr2+hy0YPLyQqIh3ANc8pKD1WsOoqrxC07tPzWnM36w==
X-Received: by 2002:a05:620a:708d:b0:8ed:d906:a8da with SMTP id af79cd13be357-8edd906ac96mr3551973485a.18.1777163221955;
        Sat, 25 Apr 2026 17:27:01 -0700 (PDT)
Received: from archlinux.tail090342.ts.net (h135-134-218-104.nwblwi.broadband.dynamic.tds.net. [135.134.218.104])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ef12122800sm1233988585a.18.2026.04.25.17.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 17:27:01 -0700 (PDT)
From: Vickram Kapoor <vickramk.207@gmail.com>
To: slongerbeam@gmail.com
Cc: p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vickram Kapoor <vickramk.207@gmail.com>
Subject: [PATCH] media: imx: ic-prp: add FORMAT_TRY frame interval support
Date: Sat, 25 Apr 2026 19:26:59 -0500
Message-ID: <20260426002659.119625-1-vickramk.207@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
by storing and retrieving per-pad intervals from the subdev state.
Also add a PRP-specific init_state callback to initialize TRY intervals
from the active default, and move default interval initialization to
prp_init().

Signed-off-by: Vickram Kapoor <vickramk.207@gmail.com>
---
 drivers/staging/media/imx/imx-ic-prp.c | 89 +++++++++++++++++++-------
 1 file changed, 66 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index 2b80d54006b3..a5c17bd4f783 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -88,6 +88,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 		return &priv->format_mbus;
 }
 
+static struct v4l2_fract *
+__prp_get_frame_interval(struct prp_priv *priv,
+			 struct v4l2_subdev_state *sd_state,
+			 unsigned int pad,
+			 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_interval(sd_state, pad);
+
+	return &priv->frame_interval;
+}
+
 /*
  * V4L2 subdev operations.
  */
@@ -398,22 +410,26 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
-	fi->interval = priv->frame_interval;
+
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fi->interval = *interval;
+out:
 	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 static int prp_set_frame_interval(struct v4l2_subdev *sd,
@@ -421,24 +437,51 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRP_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
 
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
+
 	/* No limits on valid frame intervals */
 	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
-		fi->interval = priv->frame_interval;
+		fi->interval = *interval;
 	else
-		priv->frame_interval = fi->interval;
+		*interval = fi->interval;
+out:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int prp_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
+{
+	struct prp_priv *priv = sd_to_priv(sd);
+	struct v4l2_fract *interval;
+	unsigned int pad;
+	int ret;
+
+	ret = imx_media_init_state(sd, sd_state);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	for (pad = 0; pad < PRP_NUM_PADS; pad++) {
+		interval = v4l2_subdev_state_get_interval(sd_state, pad);
+		if (interval)
+			*interval = priv->frame_interval;
+	}
 
 	mutex_unlock(&priv->lock);
 
@@ -450,10 +493,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 	struct prp_priv *priv = sd_to_priv(sd);
 	u32 code;
 
-	/* init default frame interval */
-	priv->frame_interval.numerator = 1;
-	priv->frame_interval.denominator = 30;
-
 	/* set a default mbus format  */
 	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
@@ -487,7 +526,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
-	.init_state = imx_media_init_state,
+	.init_state = prp_init_state,
 	.registered = prp_registered,
 };
 
@@ -504,6 +543,10 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
+	/* init default frame interval */
+	priv->frame_interval.numerator = 1;
+	priv->frame_interval.denominator = 30;
+
 	for (i = 0; i < PRP_NUM_PADS; i++)
 		priv->pad[i].flags = (i == PRP_SINK_PAD) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
-- 
2.53.0

