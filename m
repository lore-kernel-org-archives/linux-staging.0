Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4467516088F
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209700; cv=none; b=hRFKfZed3IfbrwV3hBcD/JrQJdUsoPZDDLdf57QVGuiOwTDRtqp151kwOEjmEjCf9aVi4CDrAteXVehGym/0HvgLhwstE6XAq1DUEOm4Nv/HT1IBfhcmOprOO4CRAmmS1itA6OBv+4ZKUK108GUNvOimNF9UaRlOg8iDtX31QJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209700; c=relaxed/simple;
	bh=xLgrZZRlgHue6M9OsvJFWob4LMm7t7pNYu1OWpjQXlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LyoFspNGmDuuzjyxnDAFnXIe8ASyO94rhmSk+SE0d3ZSdH9WuEhrXdhSDPmMAjsInXjZET0mo5s7sMW2KTSVl1vQg67FtYd8n7rEk3Xkm/6ByACpClY6g12rKJZPYpJWRc2E8gi2V9rHSQye7H1mr4MswlFaMx6E/QjZK129ImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O8Q+spPv; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O8Q+spPv"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-78a26aaefc8so206586785a.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209696; x=1713814496; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=O8Q+spPvLxAaBPNdfJi6lWU3o4DtQNVTxhQZP6G93cGIun5FrnN/J7zsGefo4W/VPI
         WJTirvi9qgV1g73QfwSY/Hq2LVC54MG0gqDm7cRdii9v0vNvI6fKjZTerv9aAoPQk4D7
         gprVfhnxF02ybIhEMf5A9uxIELus+wjEEQWNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209696; x=1713814496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUBi0S9+ghcjER4xO9v0racZxhYV4zff+IOh7tdBF3Y=;
        b=t8VLksgVGEJLq7vUYRfbMOV7YH0Apg81T4oN8KJXrCLl1p3SRgjLDXYSsYROKgo+sF
         yVYLyUqBYC7YzGQbsZE4HNDaefx/oSNWWg0rRs7u1KISU2ac09ze0Z3YNjW8t9/+CMyo
         2YNd5bA2sD0E/PauhHzVHgeS2KHghRBWHpXEnowBle8BI7p6U0kJ7pPOKAR4wnbRpQGQ
         H2LmQZ++ISiJ8jy/RVFPu5/el8PlPluHc1gdBK5B23oQ1PuqE1TuIqPktas4LZ9B/D6A
         JhDYSEJe884eCXzOMlQT6Ptnbtv+Xf9DpFT/BprzjSjCoZgXmiB+twgbPmEttk50h0ew
         i1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpItJMhVxjqsUUzkyJ1OgVe1OihpBTMe5uTLXoz4xMPFFSaWPCvPcvRyBUW0JaMNG6uT0I/hrrpraR1r1tQcYt+Vr0ntvtkmwwlD26cg==
X-Gm-Message-State: AOJu0YwjUJC28gbfbCFJtiNMIIBVRcFyPTidwNN/zAFFScLCEUiloTpB
	9jZnEd1t+hBvRmYZazvx82b/Ou0Po33vlYMYMkYylidUvusuN6P1517INwkalg==
X-Google-Smtp-Source: AGHT+IENHla9VOs9zol9LIJSv1150+DgeHz4OsMQu2kACgbSSAPw34HTPzLa823VVZ1Js6TnsSST2Q==
X-Received: by 2002:ae9:ec08:0:b0:78e:df14:19dc with SMTP id h8-20020ae9ec08000000b0078edf1419dcmr4888734qkg.20.1713209696184;
        Mon, 15 Apr 2024 12:34:56 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:42 +0000
Subject: [PATCH 25/35] media: venus: Use the correct div_ function
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-25-477afb23728b@chromium.org>
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

us_per_frame does not fit in u32

Found with cocci:
drivers/media/platform/qcom/venus/venc.c:418:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/venc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..de06e1712d09 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -393,7 +393,7 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	struct venus_inst *inst = to_inst(file);
 	struct v4l2_outputparm *out = &a->parm.output;
 	struct v4l2_fract *timeperframe = &out->timeperframe;
-	u64 us_per_frame, fps;
+	u64 us_per_frame;
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
 	    a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -414,11 +414,8 @@ static int venc_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
 	if (!us_per_frame)
 		return -EINVAL;
 
-	fps = (u64)USEC_PER_SEC;
-	do_div(fps, us_per_frame);
-
+	inst->fps = div64_u64(USEC_PER_SEC, us_per_frame);
 	inst->timeperframe = *timeperframe;
-	inst->fps = fps;
 
 	return 0;
 }

-- 
2.44.0.683.g7961c838ac-goog

