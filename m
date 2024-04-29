Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03553127B5C
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 15:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403108; cv=none; b=VMlrxwaE1WKpHzvdUeo8GwzbYeLiO+i9rCIsSn91JiJhkiVZ/KSMWe847lTv/TA3yykrUBKLFrv9zkwKrT9M13cQinm3jT+PX4dY/6FuPbIcjQAnvHkzu7ZXqIxzwJOPTAJGwdg+2rDCp0It6OZVRzuacO34cwGHtftpFFJ7Upg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403108; c=relaxed/simple;
	bh=1j0StfCVwtH5LoYMUWVtbp8TzQTzEnDFIjwyMu0303U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W+FMoMuzzB/KyP5XTsL2AZJFNt2xqN+dbi8YYyzAtVts5/39nxEqb3EiCa80gLuGWPjbZuskwqvFKJXv4X1eM0oRd88x7HcJSRDx7WMZL34V5UksEDzEYPDRJhm8gMt6TkgwNViWmqWzQuINPJDmNCwO63TyadVafFAD1u8Wxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iCN+flfy; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iCN+flfy"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78ef9ce897bso314508985a.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 08:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403102; x=1715007902; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOR8+WeMkxm0czNaQrlO8zy4rfkYFKnx5dqFso5t3cA=;
        b=iCN+flfyPrmCkFUsn3DnYnYW/AUDpqLcb7PJdZFpy1w5PIEFn+N3gmUBgkVnVFj1Ms
         +fJzqJYcazrtZKbAQhYym8yqRG96gjbzTwsj4u3OCeMu76L8ymPbCgTyFVSX3yBSF+xG
         ZmUheFkYBs0SGgbi61zm3FACnBHUn2DjjZXj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403102; x=1715007902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOR8+WeMkxm0czNaQrlO8zy4rfkYFKnx5dqFso5t3cA=;
        b=NV0VFoxJuSNnHG2GbwDXZhPaPhAlvYPnNChNOuKdNnQAC1f94bhsAmFW0o2IkQ5aKB
         +SNoTp4Nw0xg+pWlTsLBS0iPFaF/KdLx3CU5xtaGWt1NVPdkfcWhrcXmWp226BaG8WBg
         jTw5MLus69tXgQEDaxpm/8WCfrwLY5NkI4T16k9wV3QsGc3GjfUeDMk6ANkzu3DmhKZe
         YFa9dRbO9MfYDkah9PAAmKO1x9+EQQEKAQlrRtI1T1os+oqaCew3JOTfHlMXWWZ7nenu
         hx1yjt+kss29L3MUhtrJmUgXxv5c2mSSyhbXleJ6DmBaNd5fNKnGTFXQZqjswdPHnDVK
         nlbg==
X-Forwarded-Encrypted: i=1; AJvYcCXZHqMFq2IUj1WQPnTYyCHp8+Yj0/2hD6q1UtDJoCZy4rAcl71aq2/fxnCfJDHLknzCbyLH4wPX3CHGncpK4Bf2VK7mS/3fbWqZgwMxCw==
X-Gm-Message-State: AOJu0YxUv3bmyv/wIh6zMZ+4WSHWvi4iW++6ugSr/K/U/DcKQAWMGoiM
	wAXV+52aDqPvF9xoRzcNKxpio3pvg6KBnzEFoXHeKo/PEy3uhAvYPWnyeo4aLA==
X-Google-Smtp-Source: AGHT+IFvqATO8BLnIi9vdu5lMT65HlpTVBjzYUMzQ45Qpvw3JFM44+jkXB+KR4H073WWP4wnEfgBGQ==
X-Received: by 2002:a05:620a:70d9:b0:790:ac08:8d4d with SMTP id vk25-20020a05620a70d900b00790ac088d4dmr11390058qkn.57.1714403102367;
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:02 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:58 +0000
Subject: [PATCH v3 19/26] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-19-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
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

Instead of a custom min() implementation, use the real macro.

Mitigates the following cocci WARNINGs:
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index e79c45db60ab..9cbd957ecc90 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -130,10 +130,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 	dst += linesdone * bytesperline * 2 + lineoff;
 
 	/* Copy the remaining of current line */
-	if (remain < (bytesperline - lineoff))
-		lencopy = remain;
-	else
-		lencopy = bytesperline - lineoff;
+	lencopy = min(remain, bytesperline - lineoff);
 
 	/*
 	 * Check if we have enough space left in the buffer.
@@ -178,10 +175,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 		src += lencopy;
 
 		/* Copy one line at a time */
-		if (remain < bytesperline)
-			lencopy = remain;
-		else
-			lencopy = bytesperline;
+		lencopy = min(remain, bytesperline);
 
 		/*
 		 * Check if we have enough space left in the buffer.

-- 
2.44.0.769.g3c40516874-goog

