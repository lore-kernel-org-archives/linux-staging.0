Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639011;
	b=1OSvAQVCAfKiIJmk9q0pMIcXftk7pbQ344hcT6iK7jbM6/hTvrmwBaV8m+J0fToVVf2L
	 wvpCFeTRY59YU3DrhHT5PYvf3LiqomjRSvGYnRhARhIrZLUYWYFAUbTzlRaDI4Aa9VkqQ
	 B53+2HWrN9sDy4BqBisJGXVJdJNa3miPGe0b9DTsmG73+CXmjTjU82nTfcV6OGvTP9H8f
	 nRDwwqMO3Xwmkv4ZgW0GRbQHt3J815UovJfGFqTj4oih6lYq2GZzEClF/a2Deo0o7f+WC
	 A3Tjrk5iNB+T4a45q7NQow+LjSXZjZ4vlYZ21g4mgDW536LUX0N9cN14amTcqHh1zPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639011;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
	b=ylKguCzqZeu4S04PLVOj/m7pA5vroq/J4o4/ObbQ97/zCBafpHzRbqpw8UXnohAelj5/
	 26EajW1ynzeSNbnE5L4Aw18fLmrrCQpIggnTrMgSWz9WfPUzlxTSYUSGC1y+bFwY+0NuI
	 DPhKVhHFkh5bQwBQIK5CjAXAeCWtNd5skYDv8E4wwz6Vo4/d75YVxsbzXRZgUr+RCeCgx
	 duAKTCi7NgUT/SHgZZQTd9qO1pnh4z+EBFJaETItLD2TcKDaWX3EVm3r71ZDRGQWuYqfd
	 D4QDPSOo1BxMAWreuOLUHqAQcg+RWZ4oIa93bd6Ok3u3GtlEpXAZ2zxaaIiQAR6xgRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN8FETN4;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A6D607BDD8
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 17:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A6D607BDD8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XN8FETN4
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so33340015e9.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639008; x=1794243808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=XN8FETN47UdQi0w+N+yGgxnd11rJ+OwJ2lgP8KCOV7YN0AaC02gk1E7E5kX4oczrg9
         /sa5vH6uZcGcZyRB4qTQeJYnDdFp8kzPCK1YZBbhSc68vgjH73kDdoxRj/WKeJJVRpJM
         E+tWcFsWk5uKv3fmbiCyB8AfRSCB4o8m2Gs4b/R2yac4iJdGUj77moK772izvr2doog0
         MFRpMDgiyKPy1LQto4iqSBhP5xLkjfHyf/WcxkWpP6muildB+AlgdXh9/MY4Ag+FVIBp
         lY7TQZTYhdFbnmZTLv2nupakY9ccasnSY/v3+9A136jt+HxdEv8j9TjY5o7g/ePc0aXt
         BdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639008; x=1794243808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NKzzwtKTgXz6R9jTvzKIhg/OY56xKISF3o/pTEJt26A=;
        b=RogMfN/LQQEXH2CZMKI1ydRms6Chl69wYFIrs8rEngvVLPSCJhvTyco0Sxij6/L97b
         YpjBYwkv0COeOrcbdR//7v83XD6Jueq/vPmBMRxCxEtM9r0v6sjzJDwS8g3xu9rTteZ2
         4ZNnn0mgDP+BcwYwcZ97YXQ0fOPSusdia6vMvg7u2I/cx2iMxjRoe+LIj0vNK6JNUHsJ
         dZesw9N+uJiRSwzePgQgdmP1XxDoJVL1SA+NIuKj2x+s1eC40tyPVyU7GXOtzAStBWfs
         f7p6zqfXXz4xqFQcefYHc6G9n1NiwO5BYmmpFHnlkktSxyUiE0CKR7ITAw+UHkjUMKnT
         zAug==
X-Forwarded-Encrypted: i=1; AKwUvBz5vEGJzA7N5LqlOKv/6by5P6u+Z+WL0TNGlDw1Bg3Fwus4JhE1IYa2oPQ3IIgsDi2wlxhfsV+8aQHOSzll@lists.linux.dev
X-Gm-Message-State: AFq9FYKz1OSaSD4w3hXVi/agsdmtrh/23QEqtWDYoJhUB3SABUPbFoix
	U6yGd+17dnZPfwmBRiB/WPRnKAkdTELyiyeL3DVkvI7/s7MUDHzVY2HQ
X-Gm-Gg: AYBFou2PyTO6BsUb3mwE+JGf0bLdzme/39MsXZVmwVeSlkoi1b2Bns7Z6y/6/VmNHvx
	eeAn3m+YGjiESMmbwBvfYgFrXLcUhb21ClI29ooGRREvGiMuwEq4j8dXLHptUwpdq7w5xnfamxc
	sZ8gsfPCrOaa7sN3ueSt5EfELS3NpJpIASdqxXnl1e4nkszrvzjhz8dl6vK4YymA9LbW3VvmoOf
	35oosgOctQiQfZDZE2DetvgYOnY2i6KLToRxq4tdk67kUXpnjAeR8k8nX6t7UFaLO4EFuVSYPxJ
	aaS2WfcN/swVrgQer1YE7gZI/F6R49wobwZzJdRafmj6OIO3f2H5XXmqUFyhLYvl53SJXD00N7r
	MY+VMAR8lHQaNa2IxOUSSm4cMhlBdBkrOWPybz+oG/nPptjLpyv62U877t4DREo8isJq0rRE7sS
	x6BpUwpKbATWu/uzAyFshUfKo3QKvm4N59AShsQSpwJfigt684fDCkEB++bXNx9m/1LG3AIdIi8
	Pe0yjJrcJpUW/rEJuGcBQNPgekE8zkkvBH07XODcZkZvjp/3a/+Ofr2TIpBLUV3BrxiX9K9BTI5
	tJzqJIjF/PJ7k7X/EhUsY8oF1kipGg61Cg1CaIiLPNUv0vyNIfeLT2dRumcgaSHYvznGgV55hb2
	M1T7n/kSaksDfnLtaxlhtZjDXImduPfRWXoZPNql5juoKcL2lp37SfxlxEE6djSh6MtCksss8xz
	mYpOI+79ALbDeHtveHU7Mzs3EyMLnUMa//8GwpI/F8IZRHbQLOPO7dEbx3mnbROKm6h0Kz8YpJ+
	f+3j2Re0t6sGNd97ejD/3/opic17/ILwKtcdhPS6FFbMt+TNw==
X-Received: by 2002:a05:600c:1385:b0:4a3:5991:718 with SMTP id 5b1f17b1804b1-4ac182dc0a1mr261716365e9.16.1793639008306;
        Mon, 02 Nov 2026 09:03:28 -0800 (PST)
Received: from jernej-laptop (194-152-27-116.dynamic.telemach.net. [194.152.27.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3cesm23362309f8f.7.2026.11.02.09.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:03:27 -0800 (PST)
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
Subject: [PATCH 07/10] staging: media: cedrus: validate VP8 frame size
Date: Mon,  2 Nov 2026 18:03:00 +0100
Message-ID: <20261102170303.1973892-8-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
References: <20261102170303.1973892-1-jernej.skrabec@gmail.com>
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

Check the frame size in try_ctrl, like for the H.264 and HEVC SPS.

Fixes: 3c39a16d30d8 ("media: cedrus: Add support for VP8 decoding")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 45deebddb630..756243795de8 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -77,6 +77,11 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 					  (sps->pic_width_in_mbs_minus1 + 1) * 16,
 					  height))
 			return -EINVAL;
+	} else if (ctrl->id == V4L2_CID_STATELESS_VP8_FRAME) {
+		const struct v4l2_ctrl_vp8_frame *frame = ctrl->p_new.p_vp8_frame;
+
+		if (cedrus_check_pic_size(ctx, frame->width, frame->height))
+			return -EINVAL;
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		unsigned int bit_depth, max_depth;
@@ -270,6 +275,7 @@ static const struct cedrus_control cedrus_controls[] = {
 	{
 		.cfg = {
 			.id	= V4L2_CID_STATELESS_VP8_FRAME,
+			.ops	= &cedrus_ctrl_ops,
 		},
 		.capabilities	= CEDRUS_CAPABILITY_VP8_DEC,
 	},
-- 
2.43.0

