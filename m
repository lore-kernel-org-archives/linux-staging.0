Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE948003F
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520171; cv=none; b=a9wTJ54w905TXCDRb/fQYFSzKahv4QKLVLXM3c1lBZ7NrTGzjbaKx0I98CMogYEezEOJ8x22Iva2Exm2F1MykXRnai6UW8QeiCEJ6dAFEmmtZMvKxmHdEixZa80nimyoc8uUPxPiWxLhi3ihJQJfamXXPNMUWT0galtxxVyO8Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520171; c=relaxed/simple;
	bh=aO+3XsdBSRpzhoc7Fyjg5oVGDMNe8NmC+5ZKhCG0BJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lhdf/j1NQPvaiUikwVHuF4MLRR+FxZUtKXmwiWZjDx76R/b34PsjED9LpAkgeJKi1hlOUNEUf1hsz1oCTMAF3cLX8Nxrj6aX5yMVMshFauqlXjpjORMuPN/bdMsVXw9b9QkQ7uV3tsfQygW5mwSrL5+UINh2iWUxhb/sbLEMNz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IUzWmQYs; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IUzWmQYs"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78f05035f56so119367985a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520168; x=1714124968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=IUzWmQYs4UO/+atrxPZGh6l7uvV+E5bdBrb4adWPo6s3kVPCPkhMU4h0oA+Vtu1dyW
         uSPim/AVPxoQZTYHt6jOYY28lkB+jKHXRYnQhfztl+wFoQtZ8ylmQdlM4+hvrBOvM0BT
         z4BIX+wZSdriy6fx59AIWDpDUqh0PyM1Al3co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520168; x=1714124968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qUCWhD1zt8bKcdbs6yESnMSEdigGZ2fB7xO4uH5zQE=;
        b=iSSVWZnRnR2T9q9alTaubppN6Odt8xx9pefG4cLBTJ+/okrjVh2H24UsV88dCICCLt
         lmD2GM7jRpZ33OG6L9+ppsUg4k5SpYLLnMznjkwxUhLIfRGx85wskOAf2uFxavgaAk3i
         o7xqfNgQ/iHS9WbbPbXcQoT1Hp9NEJOCikBqUWPfXjBZxOrsAg9B8QFTtLwmVcLBEgRb
         iKWranKS/ynRNcsnYFEOoZ41vdpksUnxQKexZK51NA9qp+SzGEjjOekxl3vH/DoFl0SD
         8gp/gZq/wq1p6FBgRVhD6AATrMoCPIkfmO1eOn4Sg2yt96zn7YFwB/Tn2cDsidTHMjK3
         AuZA==
X-Forwarded-Encrypted: i=1; AJvYcCV9HV/hCFO+7usrVUOuj5iFcYVO2MtL0IzemjWR1tWmocGh3UaGvdauvtnGqDuZ8zeL2Ee0PO6mFM4AQQneMZXS8jxxMWqrFlu/QAxagA==
X-Gm-Message-State: AOJu0YwEpGOe+y/LNEktLfRZO6NpdKYRyfJTuuk7kXBgiwCpstwPsif4
	doMfqQOs5I5TXb5kC2CUgbF/Qvs6K+6yxVDYPTIT8KqzsK56xrBuuKaqqf6XIQ==
X-Google-Smtp-Source: AGHT+IGrWT0O4AGlUln/2gm+WlWRdrbCZXYUSj9v1TAvaCupc//lNt4+QKq4Vo16BjNxQ14XM/vY2A==
X-Received: by 2002:a05:620a:4083:b0:78e:db2f:2726 with SMTP id f3-20020a05620a408300b0078edb2f2726mr1792928qko.51.1713520168153;
        Fri, 19 Apr 2024 02:49:28 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:53 +0000
Subject: [PATCH v2 07/26] media: staging: sun6i-isp: Remove redundant
 printk
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-7-2119e692309c@chromium.org>
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..58f8ae92320d 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,8 +386,7 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
-		ret = -ENXIO;
+		ret = irq;
 		goto error_clock_rate_exclusive;
 	}
 

-- 
2.44.0.769.g3c40516874-goog

