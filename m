Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6215E7FA
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 19:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713209691; cv=none; b=RBWqhTPnWdXKzQjVbLcklfou6u5UXx+SAnzxT3y2QXHTGmM6xzg/5SvQyxpB9TvHa/syfMcM3iZfaJxe9W31LTpTNm0AGqUrH1pYX5nOdSfmwhPozSl7X6EtjkANtjvo+5ZFU+AqdVhzGxnED9OInQ/U+prqDDaEDrZ9JrivWhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713209691; c=relaxed/simple;
	bh=CPsjhfr0ipRuyWvLekJtBUPBvfW5sC455CD/yQi18EY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wd4OUfYAyuCHPuL1vGfNm2C9jnPfPBE8KbsV6d7QJeY5ThOH/R/nawld0Y5DGTHJUkob7tX+fxUNSWKcWtg790fN1cKzJenp4FEN0X9KqJaMjFQNEkZbT+QbTHKOrsoFN0IP6LaOoldLs1+dqrcsUIIqq63xYYjdOVuNhho0S7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XQsnLXZv; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XQsnLXZv"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6114c9b4d83so28624667b3.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 12:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713209688; x=1713814488; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=XQsnLXZvzqdcKi8qVYyJWxUCL3oWTiDICTvavscBgVk2qQQzy6oX91jqu1f08ucRuy
         ySjKAw/NgGcKGr4mxhlWuyg3fYcNNZxpcEi/Uj8KD44ApWxp/0LS7F/qJ5OalDJKqBkE
         5e2JUHEvHSQLGUKbAo63122i7iyoQ106LRJGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713209688; x=1713814488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYb6g5i4FA16yMs6Dul0lviXONeB+8pR0V9zyRVb51o=;
        b=NWqNBxcvorz2lTGXKVwgnCUJEpehCOUdM5M5Yk6t7WJs+QD9gkzrXrBSaNsYPpj8c2
         UdVkoP41qFbNgLddjEv+cLPxUbgGBEI2m86F/jEpizQYasoYdt0hvLEVXcTdXaGtnOWz
         RLFX/5xU7chHKLKciuKBOA8rleiIUoDzRay20gBOLZ2X3LMM3dx1qC/IA05ozpA6WQ/2
         oWnlTQD+xiSGOYsj1bMp1MccTd0fy6UZxmE2bgJDl34vHwhysTw/ykZx6hGq4Zlg6rus
         DbselEu1fO2UPD+z87vICER/G9GMo05cSFrALUyUS4OcmqQCszl+oRIaPib4ieagf+l6
         42qA==
X-Forwarded-Encrypted: i=1; AJvYcCWXMAmsQ50oNHBRljUKACa1yWx5hrnDVgtc8tMl3lNGQQwLAZ4rg7aDzLz6EiaU+HIBdrgjwVdXlsQG8MZrjyT20grBaYH5kHV7BEtVZA==
X-Gm-Message-State: AOJu0Yy41P2zxiQnJjVtBwO9mUI8pkPe7fVu8TG76rcp4mNDJj02LFUd
	UzA0ekB1sfmZy53X+ux7WYq08qpBPC+3N2tNGT0B/Fo4s0xlVtv9yE+38ab/Qg==
X-Google-Smtp-Source: AGHT+IHXF7TrtarHgpunekvNDs6nvd1JJs+Lc0bh8dwb/yJrFpFk4KNuzD4FvIVwGteAAQA7ZBlIRw==
X-Received: by 2002:a0d:cd01:0:b0:618:875e:2bc1 with SMTP id p1-20020a0dcd01000000b00618875e2bc1mr8806798ywd.21.1713209686523;
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id s26-20020ae9f71a000000b0078d3b54eb76sm6718055qkg.78.2024.04.15.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 12:34:46 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 19:34:33 +0000
Subject: [PATCH 16/35] media: au0828: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-fix-cocci-v1-16-477afb23728b@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/au0828/au0828-video.c:605:11-12: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/au0828/au0828-video.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-video.c b/drivers/media/usb/au0828/au0828-video.c
index fd9fc43d47e0..2ec49ea479d5 100644
--- a/drivers/media/usb/au0828/au0828-video.c
+++ b/drivers/media/usb/au0828/au0828-video.c
@@ -602,10 +602,7 @@ static inline int au0828_isoc_copy(struct au0828_dev *dev, struct urb *urb)
 		vbi_field_size = dev->vbi_width * dev->vbi_height * 2;
 		if (dev->vbi_read < vbi_field_size) {
 			remain  = vbi_field_size - dev->vbi_read;
-			if (len < remain)
-				lencopy = len;
-			else
-				lencopy = remain;
+			lencopy = umin(len, remain);
 
 			if (vbi_buf != NULL)
 				au0828_copy_vbi(dev, vbi_dma_q, vbi_buf, p,

-- 
2.44.0.683.g7961c838ac-goog

