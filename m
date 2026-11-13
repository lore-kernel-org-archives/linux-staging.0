Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586734;
	b=BK4AbIJK2fuBJhE/9wDytFqibQZBsETH2ANUCV8ShvVRG3mbEZ7mTYfShSi0wZ3uKETd
	 QjwJPa0DXBsP/14AD5F9skHKCi/KVE/LNe/BtzyFUzjwlnmLj2hV3l+0djuDW0YqJtYq+
	 74hZ1rdhU7TYqhnu6p+RrU5JiuaE63u2A2bAReyobUmCTdOvn4SAofD7HsOQHRL1UEM1i
	 +zq7pvRHiHxNrcTuPJ6NPOqxOmPcq9QMI5perg/pKURjhHQ/zQOj0wXke8dnOaYnZZ5dn
	 y+Cb3blrzBCHE6TLx8GhGYM8Frgc/1h8pMnlv3uqtzxuuxzV6xINU7eLkZmmhSo4xew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
	b=yUBuvd9R8u5mMtXqG12vNsHMCfVr7VvNdNHSyS/x+YSMecxD4F/C2WrPkyeQuzE1Q5Ly
	 lwDoBc5iJRAoyvBTVfy4712Vg2Eqa1UCCTWXqjhiOj9BcQvsppBxIK+VNlMkbi3sJrdS+
	 di2I29X1ulLykDUTskw8ZbVSKDxIlJo106kBdOeioB4MkRhSRxxn4gKl0ShieKFxVIaek
	 7bsEes5sp+NrEehGZmO0rCtFd2CpYhjSDy+evBYxvuRggjLKbCu+QocgFflm9s9SEdn41
	 lDoDdqhRotvrUu2nOdtXjHe3ZfAuShC4tzpmeVdxNSggwMSQllQ629b8uVcG/gB11nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVKgvg3Y;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB246070FEF
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCB246070FEF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IVKgvg3Y
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d21051042so258767166b.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586732; x=1795191532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
        b=IVKgvg3YvmlMo0gbznppEIJXp6tQsJYBuSj+RkaHY5D3+VHVtF++GdQrxAAD5ufQK8
         vdh3PEnrwSx/GQRJ+HpqRxCWUMin9gOcwExLiRd+rbrrWPkI8EWmVY/9YpVtFaKCOXVj
         lGTadWlelO7lnkmmCKOXIqsdV6ybP5+RJtYfDiAKmyCZCtRqJdrOTz6E5g22zdexD0IE
         7pFo1/MNB2ALj+8E5t8TONVg8/K1UmRmXkks5wY8JIW/2oD5q7UUPZzce1/xCOR1FOzj
         05sTK0cdAj0ng3Q7y77kKLbQxLLUX8Zi+roOglMdMPj6U40E2Wb32z65l4NOpTfHeLQN
         gEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586732; x=1795191532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3uheoZqKSe+Qa8Rhr1Yml0QAXpH3QvZRuhTv2QAVUqE=;
        b=uKKgLd6FMM53Qxp5q8VkLXQ4GZIcTujcS5uwhD3zUAKC9yWTvyPOG0Rmz8ADMyGyBW
         Jvq+WdT9Gxcd4/leDKl+/LGKU9gVEHReHP6CnX7h2tR3iXSo1nh2XrfB1ZqVfDSDLM8t
         rAVKGjmCrEzkRDQ3ZpmIGTi9jRDG/g2XWY7XSpo98WcLHjYDIWOHhmYXj0569XcNDH0T
         3mxuNsqWlPWDTVnQ2aRgTbIQYKi5HYFvAkbQUDeiXOWkODUnyH/mlo/6M9EqVHfRdVYg
         fKLQMjJz0WvgyHFaIxDFYyTcwLVWS3oRGmvCkPvW5YP4BYG8VOTjCgrWTvTDQ0Ox9NMl
         UwPA==
X-Forwarded-Encrypted: i=1; AL+hErH3MbwnBWlCin+K8cTdWquU4fo8d+sPbM6W+eBN32jRgHCxSJbmf0htU7DkAqWiXuDa5HlOhvdx1bWy19iP@lists.linux.dev
X-Gm-Message-State: APuU4Z8p+nSEpXTHK1+4ZNiN3TIuU6jAc8MWjEstZyUA4MJmJTpLLTy7
	BFHQEAZTjQT7Rpq1Gvf5Z6euj8XZSFbtAVvlp/jzXSGPHzxBvMD+FYWT
X-Gm-Gg: AYBFou1v0C9pPNZdOyNeAc+1PDC5mWS6Thvkps3MHF3ivFmkkV8J4OAonLkXThbOSq9
	1aewuE8Xnez666U611GMcX2ZuLozcA4Cvws8nlx3OwwnGj8lgYCbQrdj2tuT7Hsa7NFq1XwEIQN
	6EyqpxywMg8LAOE5mXFNMtzMVs0GOxLpIs08RxPItjySD1ZWjP+e8+5EY/TQuZuwtpHKJy2ZnHY
	0v1+f8vTZfMiYk0Ey74fDNcPLao/qrIgn5pK3NuBMdtlDYCSZ6aa5EWYpn2xL5OhHsV4jVds5hT
	yMQqwz9HyyN/Eq/OBQ0FC0ZrNBzI/DZKuazcuJ4OqfRK/m8VgqkAycNtASmt4uS8KWtW1d/ViUs
	cif31xwmzniuGLYYNTFT8E0dZrElGp8s/0Y0WnWfmMJ2tnMDu21Yd1k12I2zeO2MPExKmX2GZlW
	helMAT0aYNZ6Z6WVFO84tbdwY4us/+As7juFVoqUzRSo3kuS9wc4Yd1AEnNCfqsz+LmG4mAMTqc
	P/dUhmwemgl8a9oChQNDF6nr9vOB0BFBLncPeXp9Ux3qYLOuXo7Ukj0X8WnK646PXA77kYoC83/
	UtnL17Bonn8zEVhbZx0WIF5/AI9aAqo+u/xnj19NdeA/8SrZyMa/fK2pLfmTxz4tZj7aiJ/B9t9
	htvIzIG6LOQ==
X-Received: by 2002:a17:907:3f93:b0:c50:4a71:cb5 with SMTP id a640c23a62f3a-c5096325a62mr275095266b.15.1794586732058;
        Fri, 13 Nov 2026 08:18:52 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:50 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 06/10] media: tegra-video: vi: Adjust pad assignment logic
Date: Fri, 13 Nov 2026 18:18:15 +0200
Message-ID: <20261113161819.36847-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

The VI driver does not populate the pad entry in v4l2_subdev_*_enum
structures that contain it. Leaving it unpopulated assumes that the source
pad will always have index 0, which may not be true for more complex
sensor drivers.

To resolve this, assign the pad value in v4l2_subdev_*_enum using the
source pad index obtained via media_get_pad_index() from the source
subdev.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 30 +++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 5c649e3162fe3..0228a11013b05 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -348,6 +348,9 @@ static int tegra_channel_enum_framesizes(struct file *file, void *fh,
 	fse.code = fmtinfo->code;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fse.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, NULL, &fse);
 	if (ret)
 		return ret;
@@ -380,6 +383,9 @@ static int tegra_channel_enum_frameintervals(struct file *file, void *fh,
 	fie.code = fmtinfo->code;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fie.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_interval, NULL, &fie);
 	if (ret)
 		return ret;
@@ -465,7 +471,9 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	}
 
 	pix->field = V4L2_FIELD_NONE;
-	fmt.pad = 0;
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
 
 	/*
@@ -540,9 +548,11 @@ static int tegra_channel_set_format(struct file *file, void *fh,
 
 	fmtinfo = tegra_get_format_by_fourcc(chan->vi, pix->pixelformat);
 
-	fmt.pad = 0;
 	v4l2_fill_mbus_format(&fmt.format, pix, fmtinfo->code);
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, set_fmt, NULL, NULL, &fmt);
 	if (ret < 0)
 		return ret;
@@ -570,6 +580,9 @@ static int tegra_channel_set_subdev_active_fmt(struct tegra_vi_channel *chan)
 	 * is corresponding match in the Tegra supported video formats.
 	 */
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	fmt.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				      PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, get_fmt, NULL, &fmt);
 	if (ret)
 		return ret;
@@ -614,6 +627,7 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.target = sel->target,
 	};
+	u32 pad;
 	int ret;
 
 	subdev = tegra_channel_get_remote_source_subdev(chan);
@@ -622,6 +636,12 @@ static int tegra_channel_g_selection(struct file *file, void *priv,
 
 	if (sel->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
 		return -EINVAL;
+
+	pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				  PAD_SIGNAL_DEFAULT);
+	fmt.pad = pad;
+	sdsel.pad = pad;
+
 	/*
 	 * Try the get selection operation and fallback to get format if not
 	 * implemented.
@@ -667,6 +687,9 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	if (vb2_is_busy(&chan->queue))
 		return -EBUSY;
 
+	sdsel.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+					PAD_SIGNAL_DEFAULT);
+
 	ret = v4l2_subdev_call(subdev, pad, set_selection, NULL, NULL, &sdsel);
 	if (!ret) {
 		sel->r = sdsel.r;
@@ -1041,6 +1064,9 @@ static int vi_fmts_bitmap_init(struct tegra_vi_channel *chan)
 	 * supported video formats.
 	 */
 	subdev = tegra_channel_get_remote_source_subdev(chan);
+	code.pad = media_get_pad_index(&subdev->entity, MEDIA_PAD_FL_SOURCE,
+				       PAD_SIGNAL_DEFAULT);
+
 	while (1) {
 		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
 				       NULL, &code);
-- 
2.53.0

