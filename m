Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C14C12EBE7
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520184; cv=none; b=hOkHUR02p/K0z8c+yWlWxfn64WhqJtf52v6mfgea56ELf9ZgI1P7nOt7R74/TA7ZIoEjmJFqVquLaUKlR8Hxf5VEgNlfHajZ151VeNMo3HAKrWTNNVA1apobrorfWlw/1KS0EnBlLMtVwa+u0YDOejvqxcop6c2l+UAVZUHBM2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520184; c=relaxed/simple;
	bh=b7575egpMtje3XxHm3TKUIbqmP2kiwLFL5J+QhZ2HHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/AHXIhBYBSKzr3R0GB7A4dfTPuR2XPIkV/+3uWILfbXvHt6yPRP+jff4mA+nEXbzuNf3aZob5OpIZa0Jz6CS70ZiWPDbFmL+A3hdnZ2Nbbryg034PpnrAA0fVVZihVAPhNtuTH8pDb6G0YqqSZFjHCkzzzjHBRO6ks/S18VXvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lly2zQv2; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lly2zQv2"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3bbbc6b4ed1so1185485b6e.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520181; x=1714124981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=Lly2zQv2XOmCvKik44MQhXZeYolXEbOcfBl2HGtc9BMD22R16PEk+68dpIeHi4yr81
         abjSY8QXIabKBAeXeUKISXDLVEF/QOU9pGAeobLAz9QO0W92hYeVSlXE+SlRF+LJN0I6
         WgBkeUSJStLPPKz6doZoOypmxPyuUc7jla89c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520181; x=1714124981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYOJzUnpv9q2D47VjlP9TkFSb49icqGz0TC7JGSn6z0=;
        b=hiCo+xzaQbgIKtOKJAIxmBtzjb9zbRYUoAKShMMmf4yS2LuyaFJoiYzkCkH4mN2Bnv
         mNxguAwDhQXc+bSKtvK6AMlW0Rv0ULJdNRGW1a6UQrgS5s69IU+aoJrr37dYpQrzooVd
         SCrq5WNH3lhrSlqEN1QK0upHDEVVys81FWUHOlOTmcFobiy6JyOnY5ECfP9LoUVyi7rn
         QohhbsEkkbI/AfCMTOkuA4kt71JdYP1fqCF1oowvGxdaff4iDT0+WAGflT8zbwRQhT7b
         EUMVHjghv7hOgLMBVbIWF/jd5uvrTRe0ZKTS1zJFVW2wZ05kHCGL5uPuPpz5acQxm2Gh
         3hGA==
X-Forwarded-Encrypted: i=1; AJvYcCXhs7XNbMUnwErwfhR/liHTg9l1ZgMs3fAsUOkxpxUI4fw7A0sh6oeoPlG6Tfc2RzYEa+PoLZizNRCf8+XVvdvZmXvR9XPHHA72zIF8kA==
X-Gm-Message-State: AOJu0YzDrl2baEvXFj0dCOl+FTRUf4ecyRLhzLazxaqv7CM68f7aVLsx
	J3CW11kVWCMquX9z1AI/UOSl8UPeFGQk8pGqo/26macdh7hVSONGsayjsPHxug==
X-Google-Smtp-Source: AGHT+IEqg8WI1huh374uXjkgiCfNW5dvf3VCHAQb3EvwSLWOaLDMHldgLr7J0rc8UDIeS/oMY5gCXQ==
X-Received: by 2002:a05:6808:2029:b0:3c7:2eff:7dec with SMTP id q41-20020a056808202900b003c72eff7decmr2132218oiw.2.1713520181341;
        Fri, 19 Apr 2024 02:49:41 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:40 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:48:05 +0000
Subject: [PATCH v2 19/26] media: stk1160: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-19-2119e692309c@chromium.org>
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
drivers/media/usb/stk1160/stk1160-video.c:133:12-13: WARNING opportunity for min()
drivers/media/usb/stk1160/stk1160-video.c:176:13-14: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/stk1160/stk1160-video.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 366f0e4a5dc0..0ba0f41fe3f4 100644
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
@@ -173,10 +170,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
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

