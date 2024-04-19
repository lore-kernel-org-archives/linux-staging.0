Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257437F7D0
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520168; cv=none; b=H7GoXNfpX30IuwyNjYyryTiJq0hR9DJn8WKhk4wxAqe9ewtw+KqN/KMyOs5uzKLjkVoGma3qbwbX61JeOyiW/KPa3PCzoV5AYrTyAFII4SldMKjmptfaQm3HqifQRhGbindn+zFzRJclLuyipGEMLBWlaHRovg7fyyTHyIVGaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520168; c=relaxed/simple;
	bh=8VkIhJC4qRo1P5qjabF5E6wLqOZFDXI1jx3/GEL4npI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S++5+r705tgJBK2aYBv01IpkZEQlZeD937zrUCf1nVfseKUOvq879ddiqf1lGlKG+j1I3TgCrzBw28MczAusuPAG1fW9PEdVat/coWPMbymSSufBUe4LEwBG0cYx4VGNz4fXnseKTXIoUYJXgt/QRf9NxvO/dApAW/OTwEMmTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ROTdKkiJ; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ROTdKkiJ"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78ef59a369bso123581785a.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520166; x=1714124966; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=ROTdKkiJo7xIrZZcXkTjPNRjz9fzGpX7tWzINDD95sr3QTW0WnY94AwidQJAGUzdPj
         mus8NGCqdFLhfa36WdqOUWR5Bmn5ZOg2OOtGbEPlxjyiivZnArCKmib2KzCh8CRPzqhh
         phpJogi4dAgBQMTEV/bzuyIGdzthSsie2PsE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520166; x=1714124966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6LFW19gEC+T0JWPpzdeGsrE8gqRTr2t8fOHXzLwHuc=;
        b=gqgUWVJcqTbDQhL1BvSkt59U7czDbqHJdfgkIQYLYl6Xx86OuR3esSKrLJQsHRFHUk
         3oclxb24ucfBHvTogSHDaFf9wZrJTs4EJ3Io/ZGGF2Kr1LBp2YFEh8NI+s9jmaJe2rGH
         Kz/sPDJoTWwF1tQ6lkVxGIUn+8KNcy9HGaCs6+QmZitiSHzehwXCWbGlYW68nxnhlMdw
         qpJrR6t+Ud/8oSRAeelB12B5bpwV+ztUhj+igsfdw/IFSbpgAe0LuGTlkF57uSbckCt2
         AGqT4OCFHWSyiXTJSfWmIy7zyaqi7WuJhUJUlbnGj38ErejdIaJk4P03UDlC5zI1cHq1
         C/Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUHh3MvxzX7cILAY6M877EciPjcfjXzwt7xzF8h9+fUrHCYY+iHxYbfl0c9N/d31gxLSelWw1H+a6Fd45LK9wrfJ1Hl8hnwFdDwlUWnNg==
X-Gm-Message-State: AOJu0Ywy44XBBwCabdXOu0cOGt3DYVzURIemiX9sl8EB5Vf4Ujp39DWX
	y2pFXaRUuN2BAvVjTqi/iR5bKerG+GHuyEmErIXtK10/Zj1V6smlB1o5pX298Q==
X-Google-Smtp-Source: AGHT+IHUtLmGGbi8XMjkj1WeDSrpOuo1PYSYaSFswG+8Ppa9nSbCTEFJOTOGzt08rmRjKE1fcvdYDA==
X-Received: by 2002:a05:620a:4586:b0:78d:70c7:af with SMTP id bp6-20020a05620a458600b0078d70c700afmr2461486qkb.13.1713520166155;
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:25 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:51 +0000
Subject: [PATCH v2 05/26] media: go7007: Use min and max macros
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-5-2119e692309c@chromium.org>
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

It makes the code simpler and cocci happier:

drivers/media/usb/go7007/go7007-fw.c:1292:14-15: WARNING opportunity for max()
drivers/media/usb/go7007/go7007-fw.c:1293:14-15: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/go7007/go7007-fw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/go7007/go7007-fw.c b/drivers/media/usb/go7007/go7007-fw.c
index 018019ba47d4..86ce593e0c54 100644
--- a/drivers/media/usb/go7007/go7007-fw.c
+++ b/drivers/media/usb/go7007/go7007-fw.c
@@ -1289,8 +1289,8 @@ static int avsync_to_package(struct go7007 *go, __le16 *code, int space)
 		0xbf99,		(u16)((-adjratio) >> 16),
 		0xbf92,		0,
 		0xbf93,		0,
-		0xbff4,		f1 > f2 ? f1 : f2,
-		0xbff5,		f1 < f2 ? f1 : f2,
+		0xbff4,		max(f1, f2),
+		0xbff5,		min(f1, f2),
 		0xbff6,		f1 < f2 ? ratio : ratio + 1,
 		0xbff7,		f1 > f2 ? ratio : ratio + 1,
 		0xbff8,		0,

-- 
2.44.0.769.g3c40516874-goog

