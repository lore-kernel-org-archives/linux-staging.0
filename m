Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC59F130A54
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520189; cv=none; b=th6vKfhd27DsF/sTs+nusHGulLf5ypjUMzulhI9x3Vhb5whWdyD1aoayAlkIdB1YdNtOhCFDHcDedJq6R9bgaEWb5djPLp+PkWjZaeVGhRfk7XjCTf9ty864iSAeoELKCvAe8PIdkx3Hk63l55G/w39/0s576iFAT3hIc1htEfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520189; c=relaxed/simple;
	bh=kVHfPXf+aJiHcuvBXYKvN9J4cRi3k9vjohaInvrzoF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BN/AJ5z4sH9wRQupMcvVl2pxJHTPUS/tZ/YLs9adb+G6+JnR66P882OtsZFyobn2lkTcf45AbArcblM2xbS4DE5tQcVleB/CKnc2WRv50b/3+EmFOnsQAdf93hQFBnoSMKZ0wENwcVpruelfa8jxalwaltNKDLGcr0W5WD8UKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PdvXyGAi; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PdvXyGAi"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78edc49861aso124952485a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520186; x=1714124986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=PdvXyGAirpvcLhnpgZKO0ZBZSQiXyfMiHSRAfa9I8FwGWwh9m7N4cZcMm40XgEbVdg
         jThf9jsPArqp8IcwBgw8v+N3JheI0Q2wSj6sdP84CvpEsTxVjkzGmTjRKgxzd3mzy/XI
         D3gbY0DiwQJrJ1wqjRps5LuMgAOqmgXI6f9WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520186; x=1714124986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+OLGyPz2NtLOZH/YOdUHJtasX7vVXp+smN0A8Fakk8=;
        b=KwO3vYK+Qu07CG88K9jbuxhmtxJ6CMD+dUzN5OUZrG4kjaGdLKkYIaa0MeLTLQr3zV
         t/q/E2L6d8nSfkgj4kz0VDP/TYXcfoCV/mgs4hRyI0ACYmEEFDfGPZHD1c4Yf/BqFIXR
         0SVColcW/4ROCbj9QP0cpG1H+hqZpixLXoqQbCDE6iiTK2GbkAGx4F0PxCNum5PZVzxs
         4FlUpZjAjwXtlxpfoLSPAjH94Ox3VXm4paUQSQXfkGEoWo1a1/OIPi625AqPRZJFJ4SR
         jxnVAuLNq71Q5GdyTtETuUcU9ZMdzoZFU6x/rUuQ6S0m3W7bIa2Df79Q70GdMuxzybxk
         iZpw==
X-Forwarded-Encrypted: i=1; AJvYcCX1KjNxvPWG6AwDttQBIROsEzWHTyMbF1mgSOLtJ4OiGGh92QrISf4ghki1pmXEn21IK47amNUynWhzEDxdLAuTtrEYeVy1BJD4jZPdRQ==
X-Gm-Message-State: AOJu0Yyf8IEyDb9aO5EmL6Ins9PLVC238jLULbhQzcfysmfPDVf9mz6Z
	A4P8pqpf2La1Nx1GMZFy4RoLz61UJdl4FZQST9NO+aUY8XYLiLT3iDiWE+IizQ==
X-Google-Smtp-Source: AGHT+IGmrMUnhFDPACSHoV4O9y/blrNx/1c6IZqAeqIu8A58TfBv2t0AZdePdmIMfSq3rhn78LSShA==
X-Received: by 2002:a05:620a:8116:b0:78d:7036:fbda with SMTP id os22-20020a05620a811600b0078d7036fbdamr1727540qkn.75.1713520185768;
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:45 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:09 +0000
Subject: [PATCH v2 23/26] media: venus: vdec: Make explicit the range of
 us_per_frame
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-23-2119e692309c@chromium.org>
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

Unless the fps is smaller than 0.000232829 fps, this fits in a 32 bit
number. Make that explicit.

Found by cocci:
drivers/media/platform/qcom/venus/vdec.c:488:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29130a9441e7..2b2874aedb2d 100644
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
+	inst->fps = USEC_PER_SEC / (u32)us_per_frame;
 	inst->timeperframe = *timeperframe;
 
 	return 0;

-- 
2.44.0.769.g3c40516874-goog

