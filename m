Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794960372;
	b=XOhTjOr30ne+9xHYTOq63lUHczIF39RpibL8sK6L58Fhw3PjkcwY7RXmZec995gv9c2L
	 w9WK+PTFIsDxSroBF63z/XqBWF33hZoClTSZdgFpT1O0ku87AXR3HXMcFch/Odf5bWfDi
	 0iq8UO/wd91K4dWXXp3x9xB2PfnLN7kaYM1d8AwjyvliZSGnn3MG1MBvFv0rU7JcopiEA
	 mJntNLXIvnFnyla2lSj074MOwXUKSkt0kepVDwIzBdA93MPN1zYnmeXPXooGd2ez2Ce4u
	 evwh9F5GanqKUSiJPfjjDJL+LEbVP1qFrKxAtAsaTbZwX3a5viRtVHoyJPV8K7Sm9SQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960372;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YR3F+2cMgHpOaTTV1V4xuaolSh2g/S6MJdbxlitsQmk=;
	b=qNLdvAMw5o0Y115l8P0tmkmx1bDRveAiC59zsssVTp90I82fDGprBvs7I3s+3bxwEmww
	 oPWBEoYY2Nh724qXtBVJtbquwzNvDNZhzhgVJo/qzQjVspK+Ud0yGOAvzcsIQfnbX59yp
	 55bCXxlzkJYMIpiSP78mYiyiN3X14c6hPYkJqDnKTg8mT5eJtRyf+38O4BxhqjzTYRWDp
	 pAefRdMj0prlQURWCEbBpaCLLnmLNbLmbOaoRwIrmES7vYPeDagofeqC4Zz7mvRJhz4Gc
	 nCLYSe6JPV1HleaEFf2kAhSYaDqnbU+r+jsXAKcLtpViqwwnIcHGN12URibHcbH/INQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMf+XiaW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75A0606A335;
	Wed, 18 Nov 2026 00:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KMf+XiaW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794960371;
	b=aQmTMJlwatMDW9Ql9umqKLldvaoMVETCF7dfPtPCOVu/V049g+y9M89kr80CevHflnyH
	 N9gGTHDhoqSwNUNpDNUuq4sQqB7dsavF08M4ToP0Qj4dXLDKpuZQV0uwoUOCKtkafp3Qc
	 U7kOeC8CZKQAZt37m+GhBF5teDcWijc6qXNQeJf+WjbyPS9xtGEt/k7PCiKW31+dn+y9u
	 1IBrFxRhsED5/MIXtOSsqI5BhsYu+oljV37WBj7iP4vJZhP0Awqk8MsMhmg5jAGqoLcDd
	 P6s1MG0C6bEYtphwsis9QfqEqzwNmFCWhf37hbQWpS2+wJqv7aqLCrNp0eLPSvQu2yQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794960371;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YR3F+2cMgHpOaTTV1V4xuaolSh2g/S6MJdbxlitsQmk=;
	b=dIY7X1bQx6xRgc5VmTpCzxgX03El9ZIWmh2coCICW2wW4FmzTl+yKPAxYUimYzW0BF/z
	 5Hc892vUQFPcyHz9Momwxs+xoFnwg9Qs0pAqTuraLgvThkUfsWOa4iu9M/IzUWMvWk+xN
	 TlCJZyEPPhKNt48mnE3Oo/ynmIi8q8CPkAC1QpNPy65jgi/5qNYuiOo4oqFseRXUAr8UR
	 rylallYmX7Pgcd3qRB5Pb7LMFjn7yERuY23Lbio14MV9LsVJXaQfSGy1Fd2c4LmbtugUp
	 pNL2mW6tZQi/eruzS1NbizBqoSY9YCr1wEgCeKHoGGsu47MBjQfy92l5ZwLoORuuiMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C87BB1F000C9;
	Wed, 18 Nov 2026 00:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794960371;
	bh=YR3F+2cMgHpOaTTV1V4xuaolSh2g/S6MJdbxlitsQmk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=KMf+XiaWAcngwFYwjfB/K3fRxQXE442gr0w/8cfS4uhFbKN2eGbZnRyZyzlv7rSFa
	 pgiQ2WtKpRsejDBDJGLliOdmW590netxaWxotdY4hbep0ud+5nNUV8iEofRLm92sXE
	 JZU06seo5g7APQX+jVy3WJz4DfiZdd1j4yeYxocCcu5qcVvZk29Ls2s23WlfPlsM01
	 RbDCX0taIBdyLGOtMU3xACcYilVZahatmzGpV+eT1A2S4EZqmqG500jcSUZzF7Jrut
	 OFAnf4JmYR/MZ9D+K93n8zVxnRm6cDnChXo348Z2G0IYhEJr8V4tuKg84xX0i6zfJ+
	 VKvm+W2INISrQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 479414790C;
	Wed, 18 Nov 2026 00:06:10 +0000 (UTC)
From: Maximo Manriquez Lizarraga via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Tue, 17 Nov 2026 16:06:10 -0800
Subject: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY frame
 interval support
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr2Jm7ZhOCS248h6GBS2D1CiQtjQSw
 t0FPIDLl7z//gKBveMA19MCnpMLbug3kOcT2K7uH4yu2RikkIpIaDR1tB3hW+LoR+5tajH6GTM
 qqMiULlRTwjYePbfuc4Tv1Y/DZJ5s417bjc6FOPj5eE60e39PEiGhVqYp21zkmsQtTmaIl1cdo
 VrX9QvXIZ/LzgAAAA==
X-Change-ID: 20261107-batch1-m2-prpencvf-try-3181836786d9
To: slongerbeam@gmail.com
Cc: mchehab@kernel.org, linux-kernel@vger.kernel.org, 
 p.zabel@pengutronix.de, gregkh@linuxfoundation.org, imx@lists.linux.dev, 
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
 Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6311;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=xXv6qhaJSriSfGL4sUOUFqRWHJ5gIRFjN/xNaPBJO3o=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFl/Xn8sTVcQetu766vSs58XGG35XWXtWafc//33lKZv/
 MvebZu8O0pZGMQ4GGTFFFnEZHje19/XibO2mnMCZg4rE8gQBi5OAZhI7gyG/54WahZePOW+eztW
 xgWyhaQ80r77dLKVlmbinK3vFS19vBkZ1kaw8btfcP63MHq6XmHTzd06k/+pfvIytNBdFhrPInu
 RGQA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>

Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
by storing and retrieving per-pad intervals from the subdev state,
following the same pattern the driver already uses for TRY formats:
ACTIVE intervals stay in priv->frame_interval while TRY intervals live
in the subdev state.  Add a PRPENCVF-specific init_state callback to
initialize TRY intervals from the active default, and move default
interval initialization to prp_init(), which runs before any state can
be initialized.

Signed-off-by: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>
---
Compile-tested only: x86_64, VIDEO_IMX_MEDIA=m via COMPILE_TEST, zero
warnings. No i.MX hardware here for runtime testing; hardware testing
by others is welcome.
---
Changes in v2:
- Propagate TRY intervals from sink to source pad in prp_set_frame_interval(), mirroring prp_set_fmt() (spotted by Sashiko review; apologies for the oversight).
- Resend under my real name (From/Signed-off-by: Maximo Manriquez Lizarraga).
- Link to v1: https://patch.msgid.link/20261107-batch1-m2-prpencvf-try-v1-1-76bd9f505710@tubot.lat
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 109 +++++++++++++++++++++-------
 1 file changed, 84 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 3430ddeac356..5ce0eb56be5b 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -795,6 +795,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 		return &priv->format_mbus[pad];
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
  * Applies IC resizer and IDMAC alignment restrictions to output
  * rectangle given the input rectangle, and depending on given
@@ -1208,22 +1220,25 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
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
 
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
-	fi->interval = priv->frame_interval;
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
@@ -1231,24 +1246,68 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
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
 
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* No limits on valid frame intervals */
-	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
-		fi->interval = priv->frame_interval;
-	else
-		priv->frame_interval = fi->interval;
+	if (fi->interval.numerator == 0 || fi->interval.denominator == 0) {
+		fi->interval = *interval;
+	} else {
+		*interval = fi->interval;
+
+		/*
+		 * The IC task does not change the frame rate between sink
+		 * and source, so keep both TRY slots in sync the same way
+		 * prp_set_fmt() propagates formats to the source pad.
+		 * (ACTIVE uses a single shared interval and needs nothing.)
+		 */
+		if (fi->which == V4L2_SUBDEV_FORMAT_TRY &&
+		    fi->pad == PRPENCVF_SINK_PAD) {
+			struct v4l2_fract *src_interval;
+
+			src_interval = __prp_get_frame_interval(priv, sd_state,
+								PRPENCVF_SRC_PAD,
+								fi->which);
+			if (src_interval)
+				*src_interval = fi->interval;
+		}
+	}
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
+	for (pad = 0; pad < PRPENCVF_NUM_PADS; pad++) {
+		interval = v4l2_subdev_state_get_interval(sd_state, pad);
+		if (interval)
+			*interval = priv->frame_interval;
+	}
 
 	mutex_unlock(&priv->lock);
 
@@ -1274,10 +1333,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 			return ret;
 	}
 
-	/* init default frame interval */
-	priv->frame_interval.numerator = 1;
-	priv->frame_interval.denominator = 30;
-
 	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
 						   &ic_priv->sd,
 						   PRPENCVF_SRC_PAD, true);
@@ -1335,7 +1390,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
-	.init_state = imx_media_init_state,
+	.init_state = prp_init_state,
 	.registered = prp_registered,
 	.unregistered = prp_unregistered,
 };
@@ -1352,6 +1407,10 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
+	/* init default frame interval */
+	priv->frame_interval.numerator = 1;
+	priv->frame_interval.denominator = 30;
+
 	spin_lock_init(&priv->irqlock);
 	timer_setup(&priv->eof_timeout_timer, prp_eof_timeout, 0);
 

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-m2-prpencvf-try-3181836786d9

Best regards,
--  
Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>


