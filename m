Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246676;
	b=0vHiuFm6TYgHVIxb4fl9i9r45XcTXgk2oX9dVDVoLmkCpyxoxHkvUeDt0P5+OFC5VgXY
	 mu4O9hPkUoq5Qq7diEwGhA2vkWsMEX+0dJxdruzagvQL2NaoJ8vDkA28BJoCV+L/sCt5J
	 cEczfhC7ErzftNG4D6LtiMxDKmiRSFGfT7brQ6H28usbdrreUmnf63QkoFNC4KHzOTHAZ
	 OcFGrtNMKxptzYD31ceRl0fxyZjshLCx+/SpCuMYa9FmBekBTPH7S2oLo+bBzrkYGkQ3m
	 dlaI7oheeaq7W+rso/mUSHJYPkaJqjpSF8wkcSVzXAtH1yGpEKt6XQXBVeBAxDMe5QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
	b=h3C3ci4vDzqLE65rkAiltKgShZ7QBrE/Hz0VA9BYKgHeO0YLDWvRS88CVukO0V0ZPBdB
	 Z7/bdtl6N4QwBOC0lwmmvUmcrEOpIvyUB/EiMXf8+4xmi8ZMl7LSnNsWvbiFa6NB8HkHc
	 nu3AoTncuZVZbmMGaPsF/9kyxJThazYdxk1eweP+D2QIRCXN1jcqgprAWWzNgrU8p8APY
	 8fRMwYroLY/VzBSBYpbpwWv/gtkcApUnH2oBPYFs+eCTIRPo58fXfKn2+qb019reIXHeU
	 F1dUe0k6Zere7Bxzzxz7d8tyf0K6C1npf1e247iZQXRyliSiesC4n//Cx0FDo4MUcWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh0pC3a9;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4256A60A5BCF
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 17:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4256A60A5BCF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nh0pC3a9
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14300995e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Nov 2026 09:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246675; x=1794851475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=nh0pC3a9TDlypb6X3q5xZvNF3wApy0w/9e2Lm86SpXbhDpEUG+hf95EmFZb+1UI5Qk
         zRYAQwSPzcBQgfDUhs6WRooepBqxqiMg/KeYsTdbRcfG3Skn8Qt6ITilcHI66zHVvVq6
         3fRT3FcseXIZzCao9wp3S6oNWQdL81AmpBWIRpsQiiORVVhS/i8GbZfnpSlxmaIqei4x
         tp6IYqKr1ucAiC93K1tO2L1XK2FhsP8IbRnshl1HOXmnGcyXr41jPI+cogUW/Nrx2SGN
         QOrM4g7I+bwW9UpzjBtzF+ky21zo+wMxKC59c4RYHeTP2/ubhL+gluJH1RrGGnwXX9eU
         VYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246675; x=1794851475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TdLeBYk5l0qracH7zm/PgUIBOPpvvVlqRb/gtdQ+yJ4=;
        b=Z5KhY7LDwcGEHZPQYjbYXdd2MW+bSUeQHG4VV2q8tLgO1Au0xNmVAS9HO8+zAWpnc/
         mfctDv+0Hw1wa7RsZI249Qn/nXhDnSIXCr2BQWTYVRg6P9cgfydxJ8KNaQ/f9Zu9x7/i
         Pf6pXolKfWnUSVFuW0S+2qNbr8cte+PzNP19o3qSQQqGbu3ggLeG3+oYxD5CVKd6ixcn
         AlnWO3Y/AMBDjxtm0kIF8n5YN/lwP9VP8pqv/EN+wQIbKDdfS2pcQnnztxdKJyJXF7jL
         AVyrdldnnpe8aHNjjTU21eA+IDntObj6pjSSi3+VzJ/LMCg+wbCUitCsXMgpzoDsicVI
         X/Dg==
X-Forwarded-Encrypted: i=1; AL+hErHY2CcUf9UVHzVynTe0MEEDTbhqQ3Zu5yjUUenYG1YrpCO0GrDkoi4a7bQZHRgauvqbPML2+POYsaiH6lZZ@lists.linux.dev
X-Gm-Message-State: APuU4Z/IaV34nc8HZ3fX21mBhxTIZ3z8ZdbAc1zbSwbzKq/ZWKErQAb9
	1lHJFdUtwUDKCQKYBjqoRuinmjqqObwOKQ8kQ9r8OjgSncvleUxxJU5V
X-Gm-Gg: AYBFou0aUCUew4eMhyigsx1EZ0aWk2MRM/1DEbRdbKmV2PRb6MFcMsSpzkMShpWU83e
	BEA7tzF0hg0YmBtJV1ouHWLRq4W9WJ08sa5fDiNm9get/gMqCe8154fBUg7/T9Rh0mYyyL+SyEs
	QguzKgtw87h/A3TuX6T4Isk5//4otUNzSqcaUFeZhyaNLanC/sr/sTGKgNru1FsRSzPpbrhoeP4
	D7DY5R9sh3wqeYeeyKNMlpjGwYdykTr9DXvjzMw0+cKsbVgITdbIoYYhhPZ8YE62BMksjhi2kYv
	WZyPYkCCZvVx/W3witnqSaJ0E30aziMmWVDETptb2lJO8YxQYm0x92z+9xsQZ8iDPIYoVD1N0ms
	VHr6YZ7w6Pf3sf0fXFDINrtQvkt8tzZszDtcWIWPRghM0uuwoxQBLFDYhvdu9DD2X/8naBmCJiJ
	La9T8NNKuOYCCeiKXyOJU63ECRhkH87dsfQaDVAFdv0KXXWkLpjTDH4TO8UbxkyL/WIPwuAUbNr
	q5zkYQ8lXJDRKOSyPBqzvl7oln8U4gRGlQ7wladltwKs5H4kmsy4HI3CiDk79sU3QDE/pvbax4p
	LLTBk8c2HFrpsoWJe5yZ+oTST4OjbkRS3NIg8KdrjWIpR8+0U86dl+rh6w+1MSshNiPZiEuGxTB
	9A3OGhbkN2z0lgDO9Q85z2yidaB99TZe4gaQpOf8a1CBy1exAuT/RGXlFdoGGL+9pkPdeJNT2oW
	5qbUWj2KD0YMTDE43ARIHAILr065giIzpHuafOh0OU52ag45zAMuRgijUbgyflPOpImuODyrQhy
	WdLtIZvnbma0j0631LkX0zSUocCp4LehDfU8XuG31teRGC4cHg=
X-Received: by 2002:a05:600c:1d08:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4b963c8156fmr85596545e9.28.1794246674551;
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:14 -0800 (PST)
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
Subject: [PATCH v2 07/11] staging: media: cedrus: validate VP8 frame size
Date: Mon,  9 Nov 2026 18:50:12 +0100
Message-ID: <20261109175016.42061-8-jernej.skrabec@gmail.com>
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

A VP8 key frame can change the frame size. If userspace doesn't
reallocate the capture buffers, the hardware writes and reads past the
buffers, which shows up as IOMMU page faults and decode timeouts.

Like for the H.264 and HEVC SPS, reject frames beyond the hardware
limits in try_ctrl, and fail the job in the setup callback if the frame
doesn't fit the buffers. The VP8 frame size register holds the size in
8-bit macroblock counts, so VP8 frames are limited to 4080 pixels in
width.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c     | 10 ++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_vp8.c |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 197213911bf7..6c6aa45f5f96 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -28,6 +28,8 @@
 #include "cedrus_dec.h"
 #include "cedrus_hw.h"
 
+#define CEDRUS_VP8_MAX_WIDTH	4080U
+
 /*
  * Reject picture sizes beyond the hardware limits. Whether the picture fits
  * the buffers is checked when a job is set up, see cedrus_check_pic_size().
@@ -54,6 +56,13 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 		if (!cedrus_pic_size_supported(cedrus_h264_sps_width(sps),
 					       cedrus_h264_sps_height(sps)))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		/* The VP8 frame size register holds 8-bit macroblock counts. */
+		if (!cedrus_pic_size_supported(frame->width, frame->height) ||
+		    frame->width > CEDRUS_VP8_MAX_WIDTH)
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
@@ -248,6 +257,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
index 969677a3bbf9..fecca343bd92 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_vp8.c
@@ -662,6 +662,9 @@ static int cedrus_vp8_setup(struct cedrus_ctx *ctx, struct cedrus_run *run)
 	int header_size;
 	u32 reg;
 
+	if (cedrus_check_pic_size(ctx, slice->width, slice->height))
+		return -EINVAL;
+
 	cedrus_engine_enable(ctx);
 
 	cedrus_write(dev, VE_H264_CTRL, VE_H264_CTRL_VP8);
-- 
2.43.0

