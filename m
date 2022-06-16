Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E196AB1
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 20:25:26 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w27so3679907edl.7
        for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 13:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3J94croFMFgt0EIDJ5nBaYvM7f2XLJQTjqgj/3/ZjU=;
        b=OjI41978muhCWJpsmE5/OwT4NeZE6oN7hB1HJMp+1zL5tIB2+dDizaiyju2FcUW9qX
         HIT9QQh11RNhiIn6kAMoJlJ0V1HcIwjQ0byUUh6vDi+Cgz473YAWz60fsAqksaBeOlfo
         wM6zf5PwHxslOSTrTzTA2LEYc1LmySjTyVOZl+H8czBl3PtiWqTCeNe/xE8Sw9rcDXoD
         Iowbhe4w+W0cfFkDnWAiYdrkDU0J8lnv8aZ4dgWrEwgnnQ75Sdx22inr6Td2NzeCf1Le
         kg0V6sUw4MclDdS2J5e7nU/G0cTj+f+OQRZs17+zHUJ5UxwRGgx7r88R08oeK8LFHMPR
         cvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3J94croFMFgt0EIDJ5nBaYvM7f2XLJQTjqgj/3/ZjU=;
        b=y01f3i5Y5HdMTuxlYvbxb+0Skx1vDVFBjhDTqZ1c8Iu0RyT3EGVK/beSLIsMmccrft
         Pw1j0gT+Jd5Fdp0guvi6mZBpzCFbS8NSggUPwb0D7//S/4lN7ZjIV9QKVFpeo3VxMGCj
         xJvgsgA5sloMXK/im1S0xxjQZQGXGAX0o7L5K6w/9ilLr68SiFGRGwiUMWys6m2BGc0g
         f0VP6kN6Dfiim9d62P3RWS2y0vfa01rDflbsN7sjafTwOrZMI1wrxs0c98Sy5v3EvJOE
         T9OJCf5UKj00V0zY1hQVvEiQ0Jxy3tDQu1nvjAjNCn+aVG4v0mgDteiKIP6zCnoDRleh
         q0mw==
X-Gm-Message-State: AJIora8zeu4BhKHHFHQlGjlUMLDjjbLVpdfEBr2RL4JTZIVYtpUEhtgf
	DeNygizwIec45XnEp2kiDOoOEDslSy8OMA==
X-Google-Smtp-Source: AGRyM1v1iQnrIcKC/5Ullqm08UvUYs8tXFYALDcMtA4733HLWtfij5akuBYqnFfWLR2YvuEHSDo7UA==
X-Received: by 2002:a05:6402:2788:b0:431:3f86:1d4e with SMTP id b8-20020a056402278800b004313f861d4emr8890198ede.238.1655411124688;
        Thu, 16 Jun 2022 13:25:24 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906329500b006fe8a4ec62fsm1186760ejw.4.2022.06.16.13.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:25:24 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	benjamin.gaignard@collabora.com,
	nicolas.dufresne@collabora.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 5/7] media: hantro: postproc: Properly calculate chroma offset
Date: Thu, 16 Jun 2022 22:25:11 +0200
Message-Id: <20220616202513.351039-6-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616202513.351039-1-jernej.skrabec@gmail.com>
References: <20220616202513.351039-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently chroma offset calculation assumes only 1 byte per luma, with
no consideration for stride.

Take necessary information from destination pixel format which makes
calculation completely universal.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_postproc.c b/drivers/staging/media/hantro/hantro_postproc.c
index 8933b4af73ed..a0928c508434 100644
--- a/drivers/staging/media/hantro/hantro_postproc.c
+++ b/drivers/staging/media/hantro/hantro_postproc.c
@@ -113,12 +113,14 @@ static void hantro_postproc_g2_enable(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *dst_buf;
-	size_t chroma_offset = ctx->dst_fmt.width * ctx->dst_fmt.height;
 	int down_scale = down_scale_factor(ctx);
+	size_t chroma_offset;
 	dma_addr_t dst_dma;
 
 	dst_buf = hantro_get_dst_buf(ctx);
 	dst_dma = vb2_dma_contig_plane_dma_addr(&dst_buf->vb2_buf, 0);
+	chroma_offset = ctx->dst_fmt.plane_fmt[0].bytesperline *
+			ctx->dst_fmt.height;
 
 	if (down_scale) {
 		hantro_reg_write(vpu, &g2_down_scale_e, 1);
-- 
2.36.1

