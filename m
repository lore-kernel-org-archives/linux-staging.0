Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35312839F
	for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 15:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403106; cv=none; b=pW5wncJlp9FqNnfWJJ86OXL2U7FW8tvTLSajbVAXCM+8UUHi8JywaiuNPLyOcIwVD/eBYDDyzvxO4PU+fZ3a+lOz3DOnVzkvNXJhBeqM5Y+KzXauCi7Lvfakuf+gLFb1+bmkW7NKSf7t2lQcl3Kml7PuxqSIUUgSw0as74udFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403106; c=relaxed/simple;
	bh=/GjVSD6SioMDjZElg1Hs94tKxcIDWbAsQoWFdXy84sY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ovzJxsEhhuU/q9kunLEXRytuoa/KKPBY+ALn9aHJp+u5IjeqjM4ICQ1mqIcx3MzxrfWoU5OOGfkQVVyC3g9KQXTbpNDYrC/+nZZ/RUXARvvce/RA9kkQ2Vo8+/kpBoy2nOrx1RbDqvUSk0rc+HyjLBSvJIMy/bswiP6o6BF5+RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A4u80qSX; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A4u80qSX"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-790c36dcee9so178362985a.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Apr 2024 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403101; x=1715007901; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=A4u80qSX2eGWqZ0O40lqVDdkd9qUX8QU9rE+tbFWQ8sWX+7gngVyOedDSzCOI4ibT8
         j5S70C0kvQ5EHF86ir9PJwR1iBnexWpCtdQO8pUnVJ9j1g9QhGpsqSGefxXxHD84rADp
         DjBJUtCUrYFHOewYDYoIDGAO4v76qDJaYH69U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403101; x=1715007901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7GlL3qsiOGQC7mYG6gX2GhOJ6HGHUo3zfWR8UxyLbWA=;
        b=EOHuJPEUWtjTQ+8GKnYTYzz/GyCTDsdEi4wX8YtTNRBXhPPOGRaYkqXLzpu9rc8O56
         at6VOhOXUaYChZzqHDthJx5xqLHvuFlyHms5zQOAcKbWdL3oqCRQ78xG6fhnfY/uG1X5
         Tu6OrQXf/5fLh9P9viVsyW4Jc1W4qvLf81Rvuwk6ufFfpO0/h3a4U0Kgl9z4RsEDka3m
         XFlKJIeKveD+oFMPcw2rmaGav1UmBGezTWLuDXBsh//EFaPvr4p+uUlR/bhS7F5qV9K5
         KmoKEOca4nxXq9Ip+l5DTPg4Awxnd9YfQmmrTinwxMt+BWx3ThtuQlEDa0jgmIREgkwZ
         uOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMgFyPUzffrHMdCpeXwsZ96UCAvgQWks8hfhSObC/ChQ+a6kiAaTCuLqNye3oNbx+RiWh0iusodCT+UJmADKmj4UiU6azE8U3VCBFNqw==
X-Gm-Message-State: AOJu0YykVHJHYwlgv/vikxSGZwIS8HsW1rF3Ds24yxfr+1g4OoDCibSS
	89SeSKU/c0WRA/MbwEGvLcozZHM+ISYvHnb48TCHwGM8hSqF/J9qo5Pr79/BUw==
X-Google-Smtp-Source: AGHT+IHEbQ6k/spB/F4rjxeKOljXK5qMBOo6nR8m19hLRAfwF8PZ7AqOGD/HUUCFVnU+KrmkTId48g==
X-Received: by 2002:a05:620a:28c5:b0:790:ed33:5b91 with SMTP id l5-20020a05620a28c500b00790ed335b91mr5568169qkp.56.1714403100578;
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:05:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:56 +0000
Subject: [PATCH v3 17/26] media: flexcop-usb: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240429-fix-cocci-v3-17-3c4865f5a4b0@chromium.org>
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

Simplifies the code.

Found by cocci:
drivers/media/usb/b2c2/flexcop-usb.c:201:8-9: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/b2c2/flexcop-usb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index 43dd3c932a85..90f1aea99dac 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -197,10 +197,7 @@ static int flexcop_usb_memory_req(struct flexcop_usb *fc_usb,
 		return -EINVAL;
 	}
 	for (i = 0; i < len;) {
-		pagechunk =
-			wMax < bytes_left_to_read_on_page(addr, len) ?
-				wMax :
-				bytes_left_to_read_on_page(addr, len);
+		pagechunk = min(wMax, bytes_left_to_read_on_page(addr, len));
 		deb_info("%x\n",
 			(addr & V8_MEMORY_PAGE_MASK) |
 				(V8_MEMORY_EXTENDED*extended));

-- 
2.44.0.769.g3c40516874-goog

