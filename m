Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB91591FF
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209675; cv=none; b=D1ippFHqhuzHz4Vblsq1Ye+loeReUFdUFoADxVhasjwhmFFfLdi4cuHlYh2QusR6jQIR0QpDzKSp2q5Qm2HwVb6GUXfHiCbH0Ok6FxU5s2ACbR5ExjMnvDKLcQeH2b+Q0BrYUe3CWc9TRzDZk3yjcCA8O2zbBHwi3bVKpYRkiMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209675; c=relaxed/simple;
	bh=XObzijZQld/8VXyzVYTREi/3oAcyuDjxYbwKJHTRP9A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUxWvu9sXAB/VbpsLXrEPQw5OqN0PQdwPfs1y0UGROFaaum+EPUFka2t8gyiNPpAjwwBvLDEypwzUDEd/76YW5hvdBbj2dmVwjz2b6UavWmVwYMkjjEiRQArP8BM663s1uxhZO7udNm4YbhJ1vil+okVjJuCEqPHrIB+y9nj/0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SAxVOz46; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SAxVOz46"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d57bd5781so264746785a.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209671; x=1713814471; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=;
        b=SAxVOz46rSIfy49HGYJooACAzAKUZjYWN94P++l7OeDIQLTXEMhWceXcbJRf1Y22eP
         tQ6DXgPZlxYc+H3SBA19bt9KeBmdEdgeianTiwOPBu0KKePBqs1TrDFbiwlqM3g/OIm4
         HMMkku0hPh0SOOl5YWma/uNzFZLRVaNdR+cH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209671; x=1713814471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M0QjtxbXw5Jbt1UmA7dF8uJnSqjZdDcQqjFwr3Ktis=;
        b=hq8GQZU7vMxUFbVMEjGmFtZ/TGIH22TLgUB5DbQm6Mbwp1LGpjNwEUKNCsQSn4YAbP
         mjpH00/RgnmTU/gqYkZN/qPRCwxyRKVjXUSRqiN2iV2CMT8N0M4DRmOzwEWGOwkqKS/h
         ltbmHmh1zBHCwhlOWWndS3zfqjJ+Jm/6qAsRT6AA9ChixCwtIzFqywXNpujBdOD+aL/H
         jC7gs/eIS1v+RhfZhNSZ4NRE6cPNDPmruKH/UF9KY2fCmq6wgs12A8nYiNuPFxSVOzkY
         ctQI67dWcV/SYIECb0ejBfsni+4Iq4TZveuC/xQEWfvHeb4QszXPUeVSPKLndyNGijqG
         sDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8IZXMUqYGR7O0intaIoIwfYzaUau04lv3qSybR20b/E8wM5hDnaEiXJbx+75tA7F1Gs+d0RuUnKJFnorN+s8i/vpolK/qbVxAo01Ghg==
X-Gm-Message-State: AOJu0Yx9D54yPP5hSs3c8rOOialQs+GA8wz8g6XR36ocT37iLdp4HVsg
	VFEZMaPXnz+Co4E8CmWMRqYwxjpB0QOkuMklKrJKAnsNLDxg0fcjHW1dMN4HIA==
X-Google-Smtp-Source: AGHT+IEqj59jRDGSbVB+H5v2oX0HE1xlFJSWXdttWaWsHugr/F+aCppE0zEJT1gUi+zgVZvdSbru2w==
X-Received: by 2002:a05:620a:12e1:b0:78d:4424:b286 with SMTP id f1-20020a05620a12e100b0078d4424b286mr11683901qkl.39.1713209671340;
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:31 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:21 +0000
Subject: [PATCH 04/35] media: uvcvideo: Use max() macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-4-477afb23728b@chromium.org>
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

It makes the code slightly more clear and makes cocci incredibly happy:

drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index a4a987913430..4b685f883e4d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -836,7 +836,7 @@ static s32 uvc_get_le_value(struct uvc_control_mapping *mapping,
 	while (1) {
 		u8 byte = *data & mask;
 		value |= offset > 0 ? (byte >> offset) : (byte << (-offset));
-		bits -= 8 - (offset > 0 ? offset : 0);
+		bits -= 8 - max(offset, 0);
 		if (bits <= 0)
 			break;
 

-- 
2.44.0.683.g7961c838ac-goog

