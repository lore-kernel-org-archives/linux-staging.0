Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8B115E81C
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209695; cv=none; b=orNcpYauywroco1iHMF/OwMrJThwKLNMjDj8gAn1BEWUDK8rpRGgfVRKlg3mQyum2E0bR62bW/GDuBeyvVf7GWR37tGeAs5ZPnk+4sRek/VomjMSSBN7kJhYCwGSLkWeLXpFAtlzs3mYDAvTovtvkhWeNA1nnitsyZ0SaV1VXco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209695; c=relaxed/simple;
	bh=3+1Bl8mh/8+eBa7Eij9anNi89S/ycWDT7MhZBO0qMzU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j4HM1j2c+Wdz9dXyHlC7EUUpIwtITjN99KAVHSpRmVwR5Yvx60xrm070LPejkovdHaDNBrvPEOkFy7kJ10dN6i5D1ISR5h7ip0XE2LxS/BAmVOzAo5xu44zEGipHRh4i6Ybl53EQjQNFJKH4sg44yYZ22tj5UZYc+lK1s/f572E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bXSra0M8; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bXSra0M8"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c6f6c5bc37so1583537b6e.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209692; x=1713814492; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=bXSra0M8t10KxAuAVJsl1mlB/OaUCzi8PjbZdgDiqj1lwpoE7o21d5kcuE13eFEeV0
         t5Gq5K2mmHaSnAChTC7CefcOjqdQn/+b/q9rEXWKFQnkBZJz77KYT2Yi3+GmZh4+2as5
         6ny6c6ruzgJu8+x1WRvYFIJXS9da0NgJhPblE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209692; x=1713814492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ApRUmXHVQV4ipJPLdz2OGTOSZdnvD9pjmVa3NeYIwaE=;
        b=T4XN+J3WF/D9JAhHoPKD0yaPIRnywgR8ISISaFvaZVy09TZe+T7RP59Kg57LrqXOCI
         EUu2UGiNdhcv+CtR8TPxB99vMIM1SW1p5cLaF67QQggUFvh5hkUhmNJs4QmKunm1A4Kc
         0UvepiegBy6gCaEGIuIsCeLxSA8LZjHFnpRbgy32SCgAim3j72zBrxKq4GvQV8TqMkbG
         ciEDlrJ72aRDL+oCmzWaW46V4HCrHdPVAKTppzNPLMXbbktcuAn5jt0RggjNBDsdq+Sj
         nUDStNZuhH7apz2giGrFDQ6SEib4l8BCh5FEBUJUFPQ0gCuJS63c88ncLDmxcF7NPzmV
         9pYw==
X-Forwarded-Encrypted: i=1; AJvYcCU0RrC2gLzXMPRfmO0bVW8cDzm0vexflKDQ5XFGDYhp0vzVdW6lqfF7hjDEB+WuFitr7QzPWRlGmSVAb+9k68qfXFvAYXgqb9mgq1Q4vw==
X-Gm-Message-State: AOJu0Yy9NDZfuBXZTmnz41SMX6fMfufzKVwt1pB6nchsiK3oebihOeHu
	Pje9rMeQRpC5m45TaQFIJZOBungZQtFArFg4pjxbiEoi7gjGfAmvzRzzWl9CQA==
X-Google-Smtp-Source: AGHT+IGZ58NMkpObXyXFmK/dlwdDRAXnKMQeVrLnGqtYNcTRA6TD/q28Ror56VZ2t4DiW7soUyKUtg==
X-Received: by 2002:a05:6808:128c:b0:3c5:fe95:2371 with SMTP id a12-20020a056808128c00b003c5fe952371mr14036703oiw.29.1713209692296;
        Mon, 15 Apr 2024 12:34:52 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:38 +0000
Subject: [PATCH 21/35] media: venus: Use div64_u64
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-21-477afb23728b@chromium.org>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
In-Reply-To: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

us_per_frame does not fit in 32 bits. Use the appropriate div function.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..1dffeb7de76e 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -464,7 +464,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_captureparm *cap = &a->parm.capture;
 	struct v4l2_fract *timeperframe = &cap->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -484,10 +484,7 @@ static int vdec_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
-	inst->fps = fps;
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.683.g7961c838ac-goog

