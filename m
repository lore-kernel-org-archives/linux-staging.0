Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4E7EF1D
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520167; cv=none; b=U4aCMs91Hh4EIsThsiDVTSKTrb5masmKaoroHk1diYjl21GkaQNdScjDZX3/MS4C6rVZ5z03sOGT4vIDgC03Z3n/WjMShPnuLesXsdsOn50WFE0hYGph+v8lMDXclA1NQc+z7d8kzflXsTmt7dOZFJVl+JBrZ2+A0OzHg8bupZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520167; c=relaxed/simple;
	bh=4VxVD/ZvDgbL8FzmgqVV94mI8OoBWP6NSF7Mr+JIpbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K70uUO1aBWzvSWyXbQGaGGGKnwKB5cgtdy87AQSvndaaxxRUpAEmmiAL+X8GS+bIjCv6nxnDhskdnrNS4SocHmGo9yu3KXgEkI3TjRgCwdTvOiPGh80UAaVw2sN/irEzkf5laOHmMd8GS9WHctASwdsyjtDnGdlX3JIVSzG7xlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pe0kvqpD; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pe0kvqpD"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78f043eaee9so106761585a.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520165; x=1714124965; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=Pe0kvqpDUpm/MuV/9z1U9A8d9V7Z3kSzfzK8W1tDds4IfaWm36Igoetp5fGWjdYwq2
         FLCgBi9WqW5H+ZNIimvOGl4NYm0gXxrBfrQkMYGfFE/UYJYtWOPkncodUthakUa+KMOc
         /Amu/WI2PQqbfufN1n3SzWipq55gEZCt8BB+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520165; x=1714124965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ANA0Ymw4Lt0Uz9R7FMbv4c7Ba86EanvWiJ79X90fJk=;
        b=BgNW5VcxE4wT1J7uTtKM8tYXLXJKgcB1wmcjW/CXdyGZZHa9c9MFHIKehncHsvqt1w
         F5FssB6hzbxK9ck50Dkr8gWAC9SmBh9h6F29X8wlsuMwbXRGUSORLIfhPMEx/BSxUykC
         Pr0caT18Oj75H5T/zPBS8lKTpqQDeVviUhMQwOLCHSqoLhtbyguyKdpEtgxpAsDvU1E+
         ldG2gADFh5trOp0VoSKWoKFgxJi2oIU6a/kbI8kYMOikbsTWZtZagWA1ZJtiF4Qgeq/+
         eQbtyiO7Nk5ka+ZFBlZuQG1d4ZIP582fHIeZz6/PtEWKgCivNo3n2QLzEll/F0PT29Y8
         WHaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYhjJeP3r6W216rdUjKTeTQ1vr3NQHpnW9VjSQyRXxDuwNDhf9tW8Exm8Qg3hzRo3UwetF+xMXrs4pCZqDPPhOnbbElRjaeI9PDyVP6g==
X-Gm-Message-State: AOJu0YwY4SQxk4w/z2aqqwP0y3AgaJHv1aBnHhT53bU88VH84r8qcOQh
	Vdg6p1mXQizjhx8wVPEIpE/B1omRfIMbYjeixP8+lYPHcsQoAToUlPxuEeWTyw==
X-Google-Smtp-Source: AGHT+IHomIgtJUPKBWZHNjcgUxdMC59m2s0CnNC81cRH7k5Yf23XSr3oTpLeoFOU8oA9VPTqHwEHeQ==
X-Received: by 2002:a05:620a:984:b0:78d:6b8e:18d with SMTP id x4-20020a05620a098400b0078d6b8e018dmr1691369qkx.64.1713520164849;
        Fri, 19 Apr 2024 02:49:24 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:23 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:50 +0000
Subject: [PATCH v2 04/26] media: uvcvideo: Use max() macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-4-2119e692309c@chromium.org>
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
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.12.4

It makes the code slightly more clear and makes cocci incredibly happy:

drivers/media/usb/uvc/uvc_ctrl.c:839:22-23: WARNING opportunity for max()

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
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
2.44.0.769.g3c40516874-goog

