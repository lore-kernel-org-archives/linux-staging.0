Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B06015A48F
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209677; cv=none; b=MDKzubMJybp7Borkn9Zoua8S4Y9qDFhF619n63QYI5MPzoY5QoNjGkkvv2finb53/FUehij3kXm+QNeQ4DJ33LRZQg2OKBY94Yijx9HgV/NEjA20cdaJ2uD2OrgL86kSbAPI37bdgSSHxn35BQpY1szSWYs+ciytNHtjlv+vgWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209677; c=relaxed/simple;
	bh=MDmosbXICkX9bO71/PJtanzfOgiN7bkwjkKDajARszU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lBtjqBo94PRzydWslbJzqZuKkMaBHS2y3uQXERTDqkWU/XyOEvL9j2eAhOdw8kxpia2RcyT02zg+umC75ObhAwVk2jfWR+RnNLLbsLa1/Rgp+Yan94MXTnunDDNaCr0hicIlqysn2nbjDC+raA83Y3M5SYNqL2TERe+h5+c8XQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dmtAU/yD; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dmtAU/yD"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78d61a716ddso251504685a.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209674; x=1713814474; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zm8YRFoKsGw65QxzcHtGCuYCsdcn5gIPOa2id9cD3ac=;
        b=dmtAU/yDvwOeFIxtqWWMsTIb7f9FYR3d7iwBw6tCPSugRg/j+S7/GC4Vgh+UPhiOEX
         X//29MtPkIJ93WZjDKBkUZ1/mTVSxcQc+DpKp2oPZ7lVkB20qohoGZ+/JGCPjNTkuJOs
         0WRV2WJn8wNjgllNwQ2+behgXZx+IRidENsik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209674; x=1713814474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm8YRFoKsGw65QxzcHtGCuYCsdcn5gIPOa2id9cD3ac=;
        b=WTdwUmBabN2R9GqTPRPpYx/JehQyFq891MsY1srMxaAknAgwh8p6DnYWoTBJkcdJJD
         l6UnOqLA88ysOEP/aI0ijrKpgJ+V0UvCV+klTu4R9+XiZX7HAtAQBydMg+P4+PTWNbkI
         Gz5TTA3wqY5yjC6GCuJzT2NHzoyEZYQ5Y046SneHl8XpUPNN/fLBv0Heuuodj7U65vSt
         B9BplSNxlxUPhX0F7AnKojkcMxZb9/aiP8QQfUeOyXc5qAmTR/vHNqT1+5x4ALIG1dDf
         1nYI5LwgFT/Nzr4yTIDLP2VmNBJsuQgnVdb/93hFcHrBkQKgaGmsUHeDT3BEntLldhnz
         w+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNc9EwfndOPNbAhMR6T/uMF9lbbsrUWy/YdtZK0/FT0XV1wtNDr9kYBfM02K5d3e9tADMKFGRfKihRGhtD6U87U+0u1JW4T7o2BchRaQ==
X-Gm-Message-State: AOJu0YzxKYvYZRPFa2Z9LHaLop5FwpccaFDAPmxEKIPA4mqed57igTTp
	dFGNWj0yDMFv7j1wQt8MXTMbqoBoDaAN5hbcp6nDAFBbAuJlrrQT9PooL4t4nA==
X-Google-Smtp-Source: AGHT+IE9q0KgLtAucdxZbWyn6MqzUt/EZtQ+H412AW7kKWoV5ItTNsK0gfo742OJilnTZ7BcAn728w==
X-Received: by 2002:a05:620a:2116:b0:78d:61e8:2f12 with SMTP id l22-20020a05620a211600b0078d61e82f12mr12082197qkl.57.1713209674381;
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:24 +0000
Subject: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
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

platform_get_irq() already prints an error for us.

Found by cocci:
drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
index 5c0a45394cba..a6424fe7023b 100644
--- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
+++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
@@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
 
 	irq = platform_get_irq(platform_dev, 0);
 	if (irq < 0) {
-		dev_err(dev, "failed to get interrupt\n");
 		ret = -ENXIO;
 		goto error_clock_rate_exclusive;
 	}

-- 
2.44.0.683.g7961c838ac-goog

