Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FD130E45
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520190; cv=none; b=J3NUkSVhq2j5W470D6n9hxKtAP8olj2AUplbZgQ8n2LolQx5cRhNdT0QklZynnD1JxjSY80AHy7MN03hPmhXelokE0yTcKk8+AJhoLAjHI50sdRUR42TDf+98Vh9iHi9/4yBz3lJmnBSCJYuutdoNT0+vTmRirnpaahJ9Mid84U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520190; c=relaxed/simple;
	bh=o6W/vqiRX5/Lnl4n/KralCP6cqo+hBRj8ijp3AUHwA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B9RAyySapB5YI5jVN7ab6/E7n+/OoY+ao8yYTAL1ckRjkjgaz4LRsuS9vr/R+7jQDPJ9d79aGJhfYI0Suemljx1USt+/R9LlGxAWaeu7ws4/sZxPeqxSGNOHeFgXr+LXQNnIxo8YGFOMBIqZ8NZVvrHL8nc+zi8Zvv7JXvWB+gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lJr8Zpdb; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lJr8Zpdb"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-78edc49861aso124955085a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520188; x=1714124988; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=lJr8ZpdbIVsPmke9Z5LBGv2kRkZ9JdLs0s1xGn4L1pM2oQD4DGGKpQcUPdqer8/hwx
         3AFBahSE/CnECiSvM4mq+cBzbYC1ca+JKG1DMsraycSIuwnbUSRpOvyh4393wmWDmCel
         EkF2y6ax19PwcTGcDCKFSqZXTi15jFa3CacHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520188; x=1714124988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmuUSFnHzqjHSVO6x2xCi4IdU77yIJvh23Ivq0XCHvQ=;
        b=FCcLV6lXv4UvO0ETF21Np/e4CJ72a7B7zS6aYeBjOjX3F6jANtYbdWd5KtDOr6kK7g
         saYRLo+NWErdZzbIZ2lk+64l2dgxoYVDg/N/7PMblfj/gOzOEIJMn8pVEu0/cFxcnxCP
         VNva+a9RuWZlUJYIx4r69cJU8kK/xk1sJVQf3egmE1NDe03sgP5IDDlu8EDUTzQQt4iK
         IZ4Vi5D9Jj66VZiWFuuxggU0lNaF2lNtVWHwLMle4Giubkqi7NYgiC8yB6COd63pkPCs
         SKqgbX0A/8QhvWRhRWYYTgYAjU70WkoCUV40QacgsQW0E9Wnhseob6lO4lyI0w75j3UG
         1yGA==
X-Forwarded-Encrypted: i=1; AJvYcCW2f4gxxhS7DEHo6XQcL6AVp3rtw5sC59ROESzAlDudRkPS5GnktWYsxg4I+k3D69ymIGWUJ9Yzs0xx06kiQ0MMF7ZUjaeDGzJQFntjjw==
X-Gm-Message-State: AOJu0YyQLhmQPO1HzLLYohtWMnx7Gdk/NNAbCk4JWH4m5NfI/hJB3vYf
	VlXyZQHzVCraetE0bxqYE579a/4sUKRy60YYAyn3P290d3X2esq/5W05yTqD5A==
X-Google-Smtp-Source: AGHT+IGwmCCN5wh4NaLa8aArMkOF/G4Igcbkk8uWKtclUOXaJ3Z6Gx5Noog7Zc3uSUISJQ5MgoV6TQ==
X-Received: by 2002:ae9:f50d:0:b0:78f:1044:bcc8 with SMTP id o13-20020ae9f50d000000b0078f1044bcc8mr1806809qkg.61.1713520187814;
        Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:11 +0000
Subject: [PATCH v2 25/26] media: dvb-frontends: tda10048: Fix integer
 overflow
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-25-2119e692309c@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.12.4

state->xtal_hz can be up to 16M, so it can overflow a 32 bit integer
when multiplied by pll_mfactor.

Create a new 64 bit variable to hold the calculations.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-frontends/tda10048.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
index 5d5e4e9e4422..3e725cdcc66b 100644
--- a/drivers/media/dvb-frontends/tda10048.c
+++ b/drivers/media/dvb-frontends/tda10048.c
@@ -410,6 +410,7 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
 	struct tda10048_config *config = &state->config;
 	int i;
 	u32 if_freq_khz;
+	u64 sample_freq;
 
 	dprintk(1, "%s(bw = %d)\n", __func__, bw);
 
@@ -451,9 +452,11 @@ static int tda10048_set_if(struct dvb_frontend *fe, u32 bw)
 	dprintk(1, "- pll_pfactor = %d\n", state->pll_pfactor);
 
 	/* Calculate the sample frequency */
-	state->sample_freq = state->xtal_hz * (state->pll_mfactor + 45);
-	state->sample_freq /= (state->pll_nfactor + 1);
-	state->sample_freq /= (state->pll_pfactor + 4);
+	sample_freq = state->xtal_hz;
+	sample_freq *= state->pll_mfactor + 45;
+	do_div(sample_freq, state->pll_nfactor + 1);
+	do_div(sample_freq, state->pll_pfactor + 4);
+	state->sample_freq = sample_freq;
 	dprintk(1, "- sample_freq = %d\n", state->sample_freq);
 
 	/* Update the I/F */

-- 
2.44.0.769.g3c40516874-goog

