Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF48615AADA
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209679; cv=none; b=ZHd52DrEpUVuYR5Tuzd51EDKLfvsLMRQzQQLLprK89hV7HNul6+vSzKoPOl1AC5CBi7oEt2nzjIeBEMc74crTkE88Lpi5cM33vjKDCQ42eati+fztj3zspcpYC6Acsgms/9TjH3Y/4PJD92wtb9gfEKk5LNSH8gCBGkoAnHRyfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209679; c=relaxed/simple;
	bh=NnOHj16PJj1bni+SNvuNVuvXN63e8NKQOBdaXLcKwbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cLhkm70NEnXJgc205Pc/+t2ZxOHoAP8KzomoAx92eIBZMLt1KnUMPXkiN7Ey5aqQ7nBZBIIVz54QfxRInXPLQVkRmbitmPuurMffv6g3wo7lWf8nin5bIdddMsXTmFwFNuC9Q/f0U6JPhOgVwziGMxQzjBZPb56hlRVKE98DIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ghNEKqwh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ghNEKqwh"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78d6021e2e3so286085185a.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209677; x=1713814477; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=ghNEKqwhORb/mWaK2LYXMOPSxOQWESFJwA3+ELWzPNl0x+MD0gd+Iga6c28K27XWE+
         wyI9W6foMGd6WA5DY8yumfOTu3+Y94p9+SgGUd567Ph5fbFrxpmQ4k3yM60TT9LnKw5p
         6f807gcYs1GGO2uzO7MnnYr0GFWl7vNToP2vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209677; x=1713814477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bek9HrODBg0M3bgnVqO/LKhPssOu/ibs61pEEfKBgdM=;
        b=iuyRgHejvZbgLSdMYCRnw6ACY/Ru3n6EE58+H7p0EDtJdSA64uzqwgkhQ8U5bzWrC3
         JyQw9DRhjou0ZkKcgxT1BSSSYt1o9eRtI30alyinpNHBYKjKPfU3UEV+I2Z3n06hH6ji
         hgkus/t7jtLWaVgoPEEKAYhwAxiLgZ3IegJoO/MxAH0eKIBh6Ke/8Dd3ZS/59nLfZE4E
         idWMBNXgyzzRxrh2P39nXTbEYoOSZrwIdqkXWDzQoDfnbgGEixdK4X1Ao6NuonT3b1Gy
         +pmeswTDuNHQZm1UFe3pOVfkT4ZE6Kw5uBly0CPnvc0O7iNER7hNxMMXk9byPCYB5UoQ
         o97Q==
X-Forwarded-Encrypted: i=1; AJvYcCV401FTXgAXlUUYOo9cJwhBaZxM5czpUz4w7hmgkdML/v3WhdLViQG+tIC32ptUda8CcP9SPHZ7LPqb1tEifSVEOIr5rl6iXyFvBxY8Dg==
X-Gm-Message-State: AOJu0YyO3aeNDpi28W4XRjUNSkwfmgB2MidsNi/GkAe62ZekNETAV5ZL
	r8lBgpRNa4jHsieu468FYnN5oL0gbR3b9VJpqsy3856+TYzMj22mvwC3Xo+V5A==
X-Google-Smtp-Source: AGHT+IGdkApYbK4mkbCfGsE7agdP/ocKeSLQEP1wZl23ZOICtEnIFWB9MCiZP2rFcKrIOjZRFtHqpA==
X-Received: by 2002:a05:620a:611a:b0:78e:e035:e898 with SMTP id oq26-20020a05620a611a00b0078ee035e898mr4919595qkn.75.1713209676753;
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:36 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:26 +0000
Subject: [PATCH 09/35] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-9-477afb23728b@chromium.org>
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

Return 0 without checking IS_ERR or PTR_ERR if CONFIG_MEDIA_CONTROLLER
is not enabled.

This makes cocci happier:

drivers/media/v4l2-core/v4l2-async.c:331:23-30: ERROR: PTR_ERR applied after initialization to constant on line 319

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/v4l2-core/v4l2-async.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..e26a011c89c4 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,8 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
-
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	struct media_link *link;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,9 +325,10 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
+#else
+	return 0;
+#endif
 }
 
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,

-- 
2.44.0.683.g7961c838ac-goog

