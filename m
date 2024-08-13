Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0D01991AF
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551239; cv=none; b=jluQtfbOlsAsJcff1FSWDpuVQopiFXskNEA/FPKYfHeeTVyHgY7KSxMo6US2rU9ZVo0fZR1cP3Yq7pz1EQcWeUPK7KpwZYOgw4JIRSwcVgXoSKTAbK/522WUcVAhBWuj53DgDS+HuTPox1FgjLU7AZLeJ0mAIndILN50x1oADEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551239; c=relaxed/simple;
	bh=jH7TrqthPbyuatpm9k3mnNi3VlOKWR/v7KyFH3wuPGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mqttpc5XqjD2YDVLOCmezW1xvx+cAhpnh4mOpATxgOpwV8vunUbF+4RXbnmS1PcDwWRCL3Gx/grQf+G2ZdoM0sQzY/0Vh0VRQwGQG7bfxtDf7XTgb1/8jGmwHuJR4B6DLXF7FH7AmvzOM88dOOV96PV1gbk791wQ4NTfoOYtKEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jmzNc8gZ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jmzNc8gZ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-704466b19c4so3154773a34.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551236; x=1724156036; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbox2ZoitlY78mZ2yFdlFoyXWXf8v8pDSpmA621vz/E=;
        b=jmzNc8gZo15YF3GuxpH2gXTiEWQuZsSoHbwyDhxzmzH0GwN+AiYRdqaDnaIT0+/g73
         3cVqx4z7YU+8Oqs5e0P9WQ0fsMnT0eLpPNHJwpUQ1k3Fu/JjPn1lJTOoVWV0rl8m4q3Q
         Sbbke6LBuXmVbP0AMXkuJ/DP94TaJONSPw7fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551236; x=1724156036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbox2ZoitlY78mZ2yFdlFoyXWXf8v8pDSpmA621vz/E=;
        b=Cdm1gpw8sSxx7NEo1F8MALHMEOeyRcRRQCgytj/R01oqxbKnxwkANZx/oBUie6gdCR
         P64aNMRzSHdHphFOM75/2CiWDA8GlH9K5USXQQLkrSGAtvYyv5DDhoAtWTPv7HI5aw5b
         3ToVELKxcCOJn9W+AWgb6Z7OwHy23iIedw0apXUElcGKpMq+4YH38u7vwsiMgjfKiHWA
         ddGdTEI4ZVJR86OFgCc3A0ErK9gUC6JSLyea0M6dWT3zf2zHzQgjScKJj5nPhaYrfrNZ
         stiJHpK1HqlkT8s61TmSbuuOIPzNbwaGsHPJFbuCahyPguSyEYZxCutXT/+AE56w89l6
         H8aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSI9UUn8KrY8tmpFQpt0LAvD9k+oYqrKx4lu2+PAFuEjd5D2qq6SeoFAGj549k/WSdvkaI8fXwD5IgNgVyKH19pzqQjcJ/jgtGnR9gSw==
X-Gm-Message-State: AOJu0Yyvidg+ByVe4SDqfHF5DKVVVgwIQ8zltr+94MKyfc1QeVUIBq77
	5Gt37DB3C80i7YOjip6maCe0tUA8Gp85/38XykZleP0N/52t/8zjhTzQxmmHbg==
X-Google-Smtp-Source: AGHT+IGgXIJUCN4cjOUkGFgon+WiB2P8zLnuNtMLuoWTLxNw2YXdYtwoDqVO1oPdH1blkel8OnEpNw==
X-Received: by 2002:a05:6358:e4a4:b0:1af:1105:49b7 with SMTP id e5c5f4694b2df-1b19d2f4c8fmr402139355d.30.1723551236049;
        Tue, 13 Aug 2024 05:13:56 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:53 +0000
Subject: [PATCH 6/6] media: meson: vdec: hevc: Refactor vdec_hevc_start and
 vdec_hevc_stop
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-6-664c84295b1c@chromium.org>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
In-Reply-To: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

Make a new function __vdec_hevc_start(), that does all the
initialization, except the clock initialization for G12A and SM1.

Factor out all the stop logic, except the clk_disable_unprepare(), to a
new function __vdec_hevc_stop. This allows vdec_hevc_start() to
explicitly celan-out the clock during the error-path.

The following smatch warnings are fixed:

drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevc_clk' from clk_prepare_enable() not released on lines: 227.
drivers/staging/media/meson/vdec/vdec_hevc.c:227 vdec_hevc_start() warn: 'core->vdec_hevcf_clk' from clk_prepare_enable() not released on lines: 227.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_hevc.c | 43 +++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_hevc.c b/drivers/staging/media/meson/vdec/vdec_hevc.c
index afced435c907..1939c47def58 100644
--- a/drivers/staging/media/meson/vdec/vdec_hevc.c
+++ b/drivers/staging/media/meson/vdec/vdec_hevc.c
@@ -110,7 +110,7 @@ static u32 vdec_hevc_vififo_level(struct amvdec_session *sess)
 	return readl_relaxed(sess->core->dos_base + HEVC_STREAM_LEVEL);
 }
 
-static int vdec_hevc_stop(struct amvdec_session *sess)
+static void __vdec_hevc_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -142,6 +142,13 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	else
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_HEVC, GEN_PWR_VDEC_HEVC);
+}
+
+static int vdec_hevc_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_hevc_stop(sess);
 
 	clk_disable_unprepare(core->vdec_hevc_clk);
 	if (core->platform->revision == VDEC_REVISION_G12A ||
@@ -151,20 +158,12 @@ static int vdec_hevc_stop(struct amvdec_session *sess)
 	return 0;
 }
 
-static int vdec_hevc_start(struct amvdec_session *sess)
+static int __vdec_hevc_start(struct amvdec_session *sess)
 {
 	int ret;
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
 
-	if (core->platform->revision == VDEC_REVISION_G12A ||
-	    core->platform->revision == VDEC_REVISION_SM1) {
-		clk_set_rate(core->vdec_hevcf_clk, 666666666);
-		ret = clk_prepare_enable(core->vdec_hevcf_clk);
-		if (ret)
-			return ret;
-	}
-
 	clk_set_rate(core->vdec_hevc_clk, 666666666);
 	ret = clk_prepare_enable(core->vdec_hevc_clk);
 	if (ret) {
@@ -223,10 +222,32 @@ static int vdec_hevc_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_hevc_stop(sess);
+	__vdec_hevc_stop(sess);
+	clk_disable_unprepare(core->vdec_hevc_clk);
 	return ret;
 }
 
+static int vdec_hevc_start(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+	int ret;
+
+	if (core->platform->revision == VDEC_REVISION_G12A ||
+	    core->platform->revision == VDEC_REVISION_SM1) {
+		clk_set_rate(core->vdec_hevcf_clk, 666666666);
+		ret = clk_prepare_enable(core->vdec_hevcf_clk);
+		if (ret)
+			return ret;
+
+		ret = __vdec_hevc_start(sess);
+		if (ret)
+			clk_disable_unprepare(core->vdec_hevcf_clk);
+		return ret;
+	}
+
+	return __vdec_hevc_start(sess);
+}
+
 struct amvdec_ops vdec_hevc_ops = {
 	.start = vdec_hevc_start,
 	.stop = vdec_hevc_stop,

-- 
2.46.0.76.ge559c4bf1a-goog

