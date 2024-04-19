Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7880A7FBC7
	for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 09:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713520177; cv=none; b=qYqHGWp5M8+pmZ6FTNJRuUe/5Z1DVIrkrC/NDAy5RCeIsQdcRAi5fLJPqojIMCvx53+4WrWYThwTFHKN3WWYKXOAYngEdQ9cQmYclJ+OTFyR3/j1HxEIb8tftkwhWXDK5MOJ9dMhY06nhMgZF6r8Y1ukcIK5NAkHsIoUPNo9SrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713520177; c=relaxed/simple;
	bh=0VmWOq0FNED2TWNE7G/mZoZRSR2zskQMt81gS2SxLNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IILHSbc7/AHbQMLzSgXSERQCSNom7p8OTawTDrP5PBG8IDtUezaa0b2S4N72+I4H/awpKSGwghNVDzEhhK1XaMZ+iL5yWM0mKb8/0Xz2d+CfkaNUn+spFCN7U6pc6tdal10wJciTgIpJzlmAdlDvgDCS/L8vq01uIpyAsZ7tEvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JH6cJomF; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JH6cJomF"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-78f056f928eso115331185a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Apr 2024 02:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520174; x=1714124974; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=;
        b=JH6cJomFzrgaFD9Ne1Q0ey8RONj/JxSAexlXqMCJzx2CASWCYQacmOLl1f6XfmFE/4
         7oVeKdpasCv548XmiB5A6P5DTWI2m8KTyRT5uiADujzvBQTol9LLfGvDX1mPm7exJnf5
         gxmTsITXbLv/bP8GeZO4Fo7k1E+pKgXyJ4pEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520174; x=1714124974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jv41cPIK92ur4lysOBbsHOVURXwH8FRVBK0KQUkRX8=;
        b=CqPARTB5gnDaECQAPcv7/pJhTILjsGeBa5WEImAM7RG4jDfLWQclEjrA7w6qKyEDlo
         CncZaJzofq/5SIDH+e6qAA3SMzTBxGlMTRspfxx7gQydoGdvz5oKQ1gxQsGQaI48LX3Q
         jfl2RhOhsz8vY5HGnV6zNR5XmlliURp3fON5m0ZTvMkYYL1WuK1P5wT0bUGylN689TjC
         pH1rhbXTN5Y1RxKw2/PMPw1SoOS380V+VO/XSNEKHAp+EfQtyyCA9qt3M3ZiMUM7eEiZ
         WAgkMUKIku6C0fKJ9huaHoNDa1ULrwqoc85xdlK10ssUCrn22DruA5EP5EsmToXqHtKR
         dPRg==
X-Forwarded-Encrypted: i=1; AJvYcCWa9sowu3YTrIxuRljnH//SHRrTbpqjr9vtDOmxznHccNh3jjRKIpMN0yN8cSaM55Ped4GUiPFK/drjSYA3OfTtHu8iTyQxj39eToXTpw==
X-Gm-Message-State: AOJu0YxSxsWM2gXWL2SS/9PC/XDlj2dd1XKsO0ht6ePf7nZ6xBIlqQC4
	setk5R7VEVIwr2I2UYEd6/5VDOHbw+Z8EgY+pR672Q/lba7j2mKsq4T51M6pvg==
X-Google-Smtp-Source: AGHT+IETv5IUoGgWksFs9Z+Dm4pcXtdl0bT854ihOygqGrbXzgeian082aGVpKk3VnS1RI+F74x9Bg==
X-Received: by 2002:a05:620a:4694:b0:78e:d2ff:a108 with SMTP id bq20-20020a05620a469400b0078ed2ffa108mr2287614qkb.0.1713520174478;
        Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:34 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:59 +0000
Subject: [PATCH v2 13/26] media: common: saa7146: Use min macro
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-13-2119e692309c@chromium.org>
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

Simplifies the code. Found by cocci:

drivers/media/common/saa7146/saa7146_hlp.c:125:36-37: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:154:41-42: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:286:35-36: WARNING opportunity for min()
drivers/media/common/saa7146/saa7146_hlp.c:289:35-36: WARNING opportunity for min()

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/common/saa7146/saa7146_hlp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/saa7146/saa7146_hlp.c b/drivers/media/common/saa7146/saa7146_hlp.c
index 7569d8cdd4d8..fe3348af543e 100644
--- a/drivers/media/common/saa7146/saa7146_hlp.c
+++ b/drivers/media/common/saa7146/saa7146_hlp.c
@@ -122,7 +122,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 	xacm = 0;
 
 	/* set horizontal filter parameters (CXY = CXUV) */
-	cxy = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].hps_coeff;
+	cxy = hps_h_coeff_tab[min(xpsc - 1, 63)].hps_coeff;
 	cxuv = cxy;
 
 	/* calculate and set horizontal fine scale (xsci) */
@@ -151,7 +151,7 @@ static int calculate_h_scale_registers(struct saa7146_dev *dev,
 		xacm = 0;
 		/* get best match in the table of attenuations
 		   for horizontal scaling */
-		h_atten = hps_h_coeff_tab[( (xpsc - 1) < 63 ? (xpsc - 1) : 63 )].weight_sum;
+		h_atten = hps_h_coeff_tab[min(xpsc - 1, 63)].weight_sum;
 
 		for (i = 0; h_attenuation[i] != 0; i++) {
 			if (h_attenuation[i] >= h_atten)
@@ -283,10 +283,10 @@ static int calculate_v_scale_registers(struct saa7146_dev *dev, enum v4l2_field
 		}
 
 		/* get filter coefficients for cya, cyb from table hps_v_coeff_tab */
-		cya_cyb = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].hps_coeff;
+		cya_cyb = hps_v_coeff_tab[min(yacl, 63)].hps_coeff;
 
 		/* get best match in the table of attenuations for vertical scaling */
-		v_atten = hps_v_coeff_tab[ (yacl < 63 ? yacl : 63 ) ].weight_sum;
+		v_atten = hps_v_coeff_tab[min(yacl, 63)].weight_sum;
 
 		for (i = 0; v_attenuation[i] != 0; i++) {
 			if (v_attenuation[i] >= v_atten)

-- 
2.44.0.769.g3c40516874-goog

