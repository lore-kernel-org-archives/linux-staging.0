Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246679;
	b=b7+92mfL/TC3NjtcUoj/gJb80pMSrZ7FGLXvCVXgK8KhhZSpuR+u9PJLL3EqYo/XXOW6
	 wLo6rr7aJp+byhCpwFSchK9RkmtCcN6AENNJe6WGtuEaTevcph5xsboaaJBEVRPuOTJxY
	 cnJEFsij8UG4Dg5sFeZmEirrP3Zj4KAitnK3tJ9QzzTKafnxz2HNMd0Aulu0mbMKjIpCB
	 e/hiThyM+Cd/qs02FVxeZKRZSHawkZuw3UG5L262iqZkTGvzjrC0GeNBU9ALdrGG3JxG7
	 2JYMQSsd1xZ2HeJNR1iPBMlAP9FPzUqQ8eoYjfjLp5QYA9aEpcPjSHMyfXJ3X+OPQCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246679;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
	b=g1RlbbVa+MuBWot8yVqqwoamn6Ce04PcCBIzLa0OpVcziTw7jqElUB18EO/PhKozO/Qg
	 LE80Su7j4O0Omu9TMduMkYI3GkpNexo98f6nGc/7OIOjXtpiuAbI7OQ16xhVoCC9ITQxZ
	 IKE9WKGXgYn+bP2xbcngGrt3gdqRv1btDdgiifGLdVxXGCJy8NPDWH1Rod+VSNMjEp6qV
	 Zdpe0EQV6ZOegqhKVG9S7Wk2yNJXesAXkRiCwjz+jVQCbE5St+eIzoINRwAyt7loaPb+E
	 IC4BTs9tZBsVWt/PpSdNy1FXUwFH244HDcGqKROGluTVDNmos3UKpvH671Qq1Bi6TLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWCpq2ng;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF41160A2610
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF41160A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZWCpq2ng
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7056175e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246677; x=1794851477; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=ZWCpq2nggubis6W+4A+61N4tye+BuchFi+lRAgbUh5eO0vpQZr0YkSC8uCZo2/oUzL
         zYqVeDVkm7EvWwn7spfqy+mXiqhSCy2T6Z8hNpKz2UM9V/+vmHY43IbuOzC60/2X7ZNS
         ne6WIkd3VA/FiXHi640cV1HiNCtYLuwKEQKaGQAuETG4IxJzk3flHEPGt1SSRgEce/9K
         yoZpl0ubszS7As4ihn0KMZPn4SGFCFUfN540q669/dNugFosbefEBkmPRZ6cz2+ODAl5
         bNsX4xzypiUsF8eCZ7PTH3+wzYyanUaAzsHvjNxipahjqQZrVZLLowcgz3kCdr8pO2fU
         vAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246677; x=1794851477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6lQZd1bM6K+vPoeN+FFObtB7PVIN9WoNQwEnxWfTQwg=;
        b=aR+rxH4ujW8M1MhIMP4uYuziCc1iDz2cTfKQkUyVeDvJdJil20iVWD1v6N3QSWwinC
         CRkIhsx2VA+GNCgeWp8ke4AA6rUYFhMBfNp5sSju+FG7wxsA+0qe3awAYa2Z3bpsg6xz
         lYCsy4SCY5TsKA7B20mA+sfNFgeJg+/arXMAgw2zr4kqLweoOD0RysyvrYMIdaK87fHN
         262thV/+KY9vwOamKlJIRcqKMwlMz2HB797IK3LmNiHnSdCvkcl68ORr/TOQLSBsVwon
         M26a0+B4CAvsFh+mWomlC2zbghGGZ1aPyS4hpNhiViBgr8uK35JDDPOXy94GBYuXxT6F
         Pghw==
X-Forwarded-Encrypted: i=1; AL+hErEStX+Ir5i+rRRjcAKKolCB1HvXrEJEuXXVfsJbIy+wd09VVlg7bXlRQIfS8mrLrDusUhKoUr9tHjus+IZ7@lists.linux.dev
X-Gm-Message-State: APuU4Z+D5vuLT0+IPWh1J5CF0FSbC8EkRERqw8WF73v3Ow4GAixmKkgd
	wnorxJQz35ikY4OpkfNB11likXA6XCl4wQ4ibTNxhsJ1m8leuZefndha
X-Gm-Gg: AYBFou3MSvphzIFtwvtMU1jHDcvrDoqaX+iU4ACZpRUVlDK1Sw4Xqrx19qT4fzK9sh/
	GkBt5bMVYdFKG1BndWMydP775MajP144rHKYdJrApc3Y9kis1O56GKZrVVTME2u68qLSkRuNIrT
	yqHfp0O8vrbBqDkK+NEkRfOZR9UB1MKvq4PCHBxp8c0KtHX1jJtWWBvnadwEyTAulHEO+zzymxj
	K6yjQ8xjjzdeKv0y8Ctxw48QIT/pnOcq+aiNg2ax9VzOEpLBNpHtDZQN4AtlVvN0vhiZvJNrGy/
	m4FvEx2XVptPb+8dRbjhSC7FMGJYvOmhgLxJx0qKrB6UR0DDETLa+VoImE9dAyH5UtjXPmMJT/P
	x+QwBCAMJeQqrfJ7npGt7qu9TwrAKYEYUM9pTs3Ezw/zt6aJ3XuwEBh8DQqdBr+QO5CffeTCtWd
	XRG8uLeUb0Knb8wuCknEgivCXWpor9Tay3twXRlUGQTEbxcJ+VyJQKnEAkPGXtqJU3rvw9a/FcF
	qZFl7VFDpROFZGPkQ5KCvMjIod4+K7HsOJkkQEec04rNg5/ji6dizu1JLhHy2UCbYrxmFbB78fN
	/JbXs3uzrp2HPpINpvituBBhndxJCpBi9P8OrArPM/Vc4fF82GKnlkts+QmisDp9+/H2f5W6IE8
	26N++Z8Wgu6b8TtVY2d48QXGMO4x+A/KqSUpC2/tEAjLuT+bcg+qy737wl+3OVw4SjejsYl2xE7
	INX3DQQwCEgHV09sBULVshIzOwYXs8WmP4QuL/4GWuIzTpcA1wyQPtfYofWgNmcu9SUe9dfCR1n
	xaxJUq0NlHMlkEHceZlFUDkJbb5Yyn+zohKWPiyJCjRJu7InIY=
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr85435405e9.35.1794246677280;
        Mon, 09 Nov 2026 09:51:17 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:16 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 09/11] staging: media: cedrus: h616: use the 256-bit DDR mode
Date: Mon,  9 Nov 2026 18:50:14 +0100
Message-ID: <20261109175016.42061-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the DDR mode in VE_MODE set to 128-bit, which the driver uses on
all SoCs, the H616 H.264 engine reads corrupted reference chroma, while
luma is fine. H.264 and VP8 P frames come out with bit-exact luma, but
with about 22 dB PSNR chroma. H.265 and MPEG-2 are unaffected.

The vendor library selects the DDR mode based on the VE IC version. It
uses the 256-bit mode without the 2 MiB reconstruction write mode on
the H616, and keeps the 128-bit mode with the 2 MiB reconstruction
write mode on older SoCs, like the H6. Doing the same on the H616 makes
all codecs bit-exact (tested with BA_MW_D, CABA2_Sony_E,
vp80-00-comprehensive-002, AMP_A_Samsung_7 and MEI.stream16).

Make the VE_MODE DDR settings a variant property and add an H616
variant, which uses the 256-bit mode. Replace the FIXME about the
DDR mode with a description of what the vendor library does.

Fixes: 1f24d4307515 ("staging: media: sunxi: cedrus: add H616 variant")
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c    | 14 +++++++++++++-
 drivers/staging/media/sunxi/cedrus/cedrus.h    |  2 ++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 14 ++++++++++----
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 6c6aa45f5f96..09b789640646 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -27,6 +27,7 @@
 #include "cedrus_video.h"
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
+#include "cedrus_regs.h"
 
 #define CEDRUS_VP8_MAX_WIDTH	4080U
 
@@ -679,6 +680,17 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.mod_rate	= 600000000,
 };
 
+static const struct cedrus_variant sun50i_h616_cedrus_variant = {
+	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_H264_DEC |
+			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
+			  CEDRUS_CAPABILITY_VP8_DEC,
+	.mod_rate	= 600000000,
+	.ve_mode_ddr	= VE_MODE_DDR_MODE_BW_256,
+};
+
 static const struct of_device_id cedrus_dt_match[] = {
 	{
 		.compatible = "allwinner,sun4i-a10-video-engine",
@@ -726,7 +738,7 @@ static const struct of_device_id cedrus_dt_match[] = {
 	},
 	{
 		.compatible = "allwinner,sun50i-h616-video-engine",
-		.data = &sun50i_h6_cedrus_variant,
+		.data = &sun50i_h616_cedrus_variant,
 	},
 	{ /* sentinel */ }
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 572e70a94b3f..78efd3938c77 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -181,6 +181,7 @@ struct cedrus_dec_ops {
 struct cedrus_variant {
 	unsigned int	capabilities;
 	unsigned int	mod_rate;
+	u32		ve_mode_ddr;
 };
 
 struct cedrus_dev {
@@ -204,6 +205,7 @@ struct cedrus_dev {
 	struct reset_control	*rstc;
 
 	unsigned int		capabilities;
+	u32			ve_mode_ddr;
 
 	struct delayed_work	watchdog_work;
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
index 444fb53878d1..b66d855daaf8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
@@ -36,11 +36,16 @@ int cedrus_engine_enable(struct cedrus_ctx *ctx)
 	u32 reg = 0;
 
 	/*
-	 * FIXME: This is only valid on 32-bits DDR's, we should test
-	 * it on the A13/A33.
+	 * The DDR mode depends on the SoC. Like the vendor library, use the
+	 * 128-bit mode with the 2 MiB reconstruction write mode, unless the
+	 * variant says otherwise.
 	 */
-	reg |= VE_MODE_REC_WR_MODE_2MB;
-	reg |= VE_MODE_DDR_MODE_BW_128;
+	if (ctx->dev->ve_mode_ddr) {
+		reg |= ctx->dev->ve_mode_ddr;
+	} else {
+		reg |= VE_MODE_REC_WR_MODE_2MB;
+		reg |= VE_MODE_DDR_MODE_BW_128;
+	}
 
 	switch (ctx->src_fmt.pixelformat) {
 	case V4L2_PIX_FMT_MPEG2_SLICE:
@@ -254,6 +259,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
 		return -EINVAL;
 
 	dev->capabilities = variant->capabilities;
+	dev->ve_mode_ddr = variant->ve_mode_ddr;
 
 	irq_dec = platform_get_irq(dev->pdev, 0);
 	if (irq_dec <= 0)
-- 
2.43.0

