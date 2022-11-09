Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA93A49B;
	Wed,  9 Nov 2022 18:23:23 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id m22so11915379eji.10;
        Wed, 09 Nov 2022 10:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYJAiQuT0XSlTdhgreKgdulXp6/w2lPhvIYXiq8zxTE=;
        b=aOA3HqzdmUu+a6U8yTCceoTf3BgX2YXntK6kY8v6DcXvOlKWy1zYdVmMAV3ZB0eaKY
         T+aVaZp5yqWQSZIs4ouT3Tatqw+rnt8MpwV9N+rB9IsrY0DYOjTOQY3AFDhAvtg8Zekl
         HupB1ZvN8t67+0gA3p35/e0JQ8KELzcv+8OpV9sHJZUkV6NDkkjKx7CEffuksjwzOTW4
         2/iHfbUvI0+0Ve0BpPSETQpzyCHQG3OsRE0mpnAG1oowjeWeYmmoOp7VBscDlnd0O6N+
         GJFYmITehGUmAi1YNkcXAaPzfSs4aoozU/ROizboqXgtMy3Fluze/L6UEUhq22Ieys7d
         WBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYJAiQuT0XSlTdhgreKgdulXp6/w2lPhvIYXiq8zxTE=;
        b=HpW0EtJ8WH78Wv6swoW+NM92CZMznK/Iqb211IjBhshckJEAjf1YsqB7gwFTnZvAF1
         YLyiEe6zx/goEEU4Sx5sayBnvBcH0rXkZUzbJrb2cEu6G0Qb00wg+ve/aqpRsFXo9YrE
         Gz23vULWonm0GHneg6gBweWXtuEMgxJS2HTw+igeFrKKeJksntShJdfhyOl2l8gLtceI
         +HTZSPdgJwMrtUEa1sN8Y9cDih6LTIywtXMo5vRxTIK91UYwqSkvdP0qilCwmR/ZvflZ
         vws0MmmMG5TfCWBAs8GJuIzl6U+tdnvmOtr3H451D1aRwtDLgXfGo3jqjAzWlBjox97r
         s09Q==
X-Gm-Message-State: ANoB5pncElri7My9l+cYuGc2xk+pAl1D+jyHwHPmQW7NBo9kPB3MGfNk
	+lHVD1Jsmp9MEQzFPmgrkjs=
X-Google-Smtp-Source: AMsMyM7Hk8P3/65sZw0ml9e5JkSq2G6yChfkmgqBVE7B1+Xp9Oae5bh+Uk+ELHm8FeCjsi69FrIqeg==
X-Received: by 2002:a17:907:7b8a:b0:7ae:3957:f4e1 with SMTP id ne10-20020a1709077b8a00b007ae3957f4e1mr26146059ejc.720.1668018202133;
        Wed, 09 Nov 2022 10:23:22 -0800 (PST)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gj26-20020a170906e11a00b007a0b28c324dsm6029400ejb.126.2022.11.09.10.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 10:23:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 3/3] media: cedrus: Relax HEVC SPS restrictions
Date: Wed,  9 Nov 2022 19:23:09 +0100
Message-Id: <20221109182309.2475221-4-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109182309.2475221-1-jernej.skrabec@gmail.com>
References: <20221109182309.2475221-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Testing reference video TSUNEQBD_A_MAIN10_Technicolor_2 has show that
Cedrus is capable of decoding frames with different chroma and luma bit
depths.

Relax restrictions so only highest depth is checked.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 24 ++++++++-------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 2e860cf60136..a43d5ff66716 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -45,30 +45,24 @@ static int cedrus_try_ctrl(struct v4l2_ctrl *ctrl)
 	} else if (ctrl->id == V4L2_CID_STATELESS_HEVC_SPS) {
 		const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
 		struct cedrus_ctx *ctx = container_of(ctrl->handler, struct cedrus_ctx, hdl);
-		unsigned int bit_depth;
+		unsigned int bit_depth, max_depth;
 		struct vb2_queue *vq;
 
 		if (sps->chroma_format_idc != 1)
 			/* Only 4:2:0 is supported */
 			return -EINVAL;
 
-		if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
-			/* Luma and chroma bit depth mismatch */
-			return -EINVAL;
-
-		if (ctx->dev->capabilities & CEDRUS_CAPABILITY_H265_10_DEC) {
-			if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
-				/* Only 8-bit and 10-bit are supported */
-				return -EINVAL;
-		} else {
-			if (sps->bit_depth_luma_minus8 != 0)
-				/* Only 8-bit is supported */
-				return -EINVAL;
-		}
-
 		bit_depth = max(sps->bit_depth_luma_minus8,
 				sps->bit_depth_chroma_minus8) + 8;
 
+		if (cedrus_is_capable(ctx, CEDRUS_CAPABILITY_H265_10_DEC))
+			max_depth = 10;
+		else
+			max_depth = 8;
+
+		if (bit_depth > max_depth)
+			return -EINVAL;
+
 		vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
 				     V4L2_BUF_TYPE_VIDEO_CAPTURE);
 
-- 
2.38.1

