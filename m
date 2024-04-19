Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806612C534
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520181; cv=none; b=LAOIGoHb6F5q99nUWHcCg0y6nCyjfMD4O8720dMmM28eSTN2yYfWJR1nDU9eyl9GNh/Kqe9GzOj1m87YYBC6nFnXkDG1laURqeYAUd35O0jbFtI9iMOYaNGHNwnpIaudhKgzyGlYf7Vt/F7imGQuQaFAdg7qxlnQXxMg9cq7NeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520181; c=relaxed/simple;
	bh=A6XSSayOn3r1ipxe/l3oVKgkfleRFTrQcYLCuzASKa0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0HXGORa5Dx4DvRObqBaqTLu1m1IQan9RW+AFLB8nxNL3QjwkXEysv9K38XX2nbcgeC+dCe+YY7AeGj6U86pEomAeRbA/aVLObfNLf/nUikoiBSgssNDfF+K32SgGzMFATrHRsif+Dm7IHntevE6Tb4KGKiiRGxTiUgzIS9p2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hTAXSxCM; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hTAXSxCM"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78f02298dc6so151338085a.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520178; x=1714124978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=hTAXSxCMM+Y8jZWaV9+/P43T/fWOoXPHSSlFzTIsVJoHpD7kDG1uzqWVJFszkv6NVA
         fU6drfmzPcXwZu8VXBlgS0ZphSijrD8XLJ6gHmd/tmP+Hmukv+nj1JkVwLxkTjkME252
         QVvpX+tFk0BYAZRLGKaeMwrHWkDG7nCdFXPmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520178; x=1714124978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M868xcge+vjTb4vcqz3d1wlm8C5wkLs//kWdILTOdIY=;
        b=HNY7Qn0gQsDFkRaKaSBe+O/taGZrwgh8VKzRFyjBISZL98PWnNhIEcNHdBedWM/8rJ
         hM01xyGeXkQL3GNQ4pwDg3hljN3vAQyUXHmVOo6r+gZvx3F9tYNWZO84b8icrfcLx+nl
         mwJ9gVdy/tweOO2HHPnEy/8BTrprfpJlDT9hNkaikpSuorVtntC5OTTsF7gSaTzEc5Qm
         EYMP5DZbp0j3yZTmZ8/9+uPXOgS4RW+xPZUpnD13wl5zsJhUtlrsYwsrb0+oG0R3psNU
         oCQoCbD9gAD+EIYzeToGPqHTLFr9Ty3f9hIn+S8Ihz9JMRWTscnW5da4rJLgBzwu7fhi
         4law==
X-Forwarded-Encrypted: i=1; AJvYcCXwcLkfhNsfEpaZve/3y/8zpfo9ijMqKDbwVQntci9mGfY0IF1La3PefZ312cJhVWP0z29x0QGhGyIfhNdVGVrRtHJjKms65TEVHBM5tQ==
X-Gm-Message-State: AOJu0YzVAW8d0iG3C3Ll3jTlhu8/3jaIZ8wOhu29phjEohMzyfv/OfXb
	CGMABC5xWF9BmSIJAY2ZtTyfZCrn/yIhZebXyOGiHKwQ4mC6XKl9hakh3gIzpw==
X-Google-Smtp-Source: AGHT+IECi6Jyi4V4xEUSov8CqJCQ4or6T8Il7gtYs1qBNIhEZ0wlq/VmHa5Y/Lm3RCi/7xPm+Pq8wA==
X-Received: by 2002:a05:620a:45a7:b0:78d:5d86:ee3a with SMTP id bp39-20020a05620a45a700b0078d5d86ee3amr2694110qkb.27.1713520178140;
        Fri, 19 Apr 2024 02:49:38 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:37 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:02 +0000
Subject: [PATCH v2 16/26] media: au0828: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-16-2119e692309c@chromium.org>
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
2.44.0.769.g3c40516874-goog

