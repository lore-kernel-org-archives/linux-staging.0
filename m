Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549B381729
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520173; cv=none; b=GzhWKujQV3SN0C9ZqYv9l9wYPgDvYM3pD56chmWdyYecsPoPICqJbMsBMc4s0WUajlpurSXrxKAYXUeFos0YcL1DFcjxCsoIXmwz1BiGSkDLpAN8xDP1LkjrDf5J6FsxwY5hmRS5PSxAFeuOgC7nUP4V8gz7AJJSQudNM+juAmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520173; c=relaxed/simple;
	bh=aAxsx+GHEjYnJMiAWqwUDNgaIzi1dYkLjFRqwX4O4Cc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n03v688NotYe3fF/trXgz5GMmRE8EtjKEeuP/1po3YDmYIeiyRjzj8lHZmJ6EHNqJDsTdhtKJJXYofY1by8JggPrMe5A08lox6FareS8hbvJ18Yrq7mhzGu2AaVtey1pVdhCnsXdYwLFWLjSVJQlGx44eNOw84ALr65qRs0uq/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P2Dxn5OA; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P2Dxn5OA"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4379f9160a7so9526261cf.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520170; x=1714124970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=P2Dxn5OAFEYV3ij7Kc9xSVUmz6zwG6hMu//LYUdU88GvLtmfzFvxRs6ihJoErwQBix
         BeCufEz8VSzDx+aI68u9VT0oAVlYnJvdC+i0Lr60YQsTzwfZ53NUcbES1hsbANPbWgMs
         4f9juyU7uYRgBjLHKeyFIEWoz1PI+FKl7d4XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520170; x=1714124970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtHT2dnCrKtU2tz1OyJJw1d0hzBN/YL8p+52UQFaJZo=;
        b=QnuFxDrF+hYngEW7sZq2Xu0e1LTJ7R4l5ZMLRK7RwrJe5rU7SAEu1j4SFmgvq9cSDn
         i+aKrHKJvmdrA2LAD/egHrP8Dsq743DXBlIcKqj8O0cBQVip0faroaXn2DNTU9Aqxm4g
         /7y8K88FDueQph03l98CHnQAdTKHNdOAcvi9j1sXbdSGEqhwLURK8ffZsRP3nGCnX/Zx
         vcsNnqtkgWTBjxC/XCmPNOkknHUehKYkp7MocqSdqXR4xNgh+KrI1WgDDhzllGywBWVq
         +KLrgXK0PY/mmhM+RC/Dg1KWzy4cXfYq9he7c9+Bfe1XG0TTbqeNdpR6vfojEa3dWHAf
         8juQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu8LbhCqf0AKsjR8hNsD6De+vh2isiOkgseGu48o8KOIyk0IQSxctcbWjL54Rs8iGk9AvRTyO48vM4FkmS3w025WEAMr/I8osEeKqKJQ==
X-Gm-Message-State: AOJu0YyzGB2fN8Jh8/z4vqNl8Ka0RqE6gqYhnVkn+Xlws3w13lPWfI32
	9anIpM5H92D75gjzBRj3vY8dTK3Uv41jm/V6DmGRxU79VaJJKKZ8wFBIzDs0VQ==
X-Google-Smtp-Source: AGHT+IEq5/HFwcn26nQnIIJ8VXOEY35h4vBPeSOiEtFFD1Z7vC7s7kPOFrGUrC/lVDARzsxRqq1juw==
X-Received: by 2002:a05:622a:1386:b0:437:b995:98b5 with SMTP id o6-20020a05622a138600b00437b99598b5mr1747672qtk.57.1713520170255;
        Fri, 19 Apr 2024 02:49:30 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:55 +0000
Subject: [PATCH v2 09/26] media: v4l: async: refactor
 v4l2_async_create_ancillary_links
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-9-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
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
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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
 drivers/media/v4l2-core/v4l2-async.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 4bb073587817..915a9f3ea93c 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -316,9 +316,10 @@ v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
 static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 					     struct v4l2_subdev *sd)
 {
-	struct media_link *link = NULL;
+	struct media_link *link;
 
-#if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
+	if (!IS_ENABLED(CONFIG_MEDIA_CONTROLLER))
+		return 0;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -326,8 +327,6 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
 
-#endif
-
 	return IS_ERR(link) ? PTR_ERR(link) : 0;
 }
 

-- 
2.44.0.769.g3c40516874-goog

