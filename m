Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD8B1AE050
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811531; cv=none; b=AOit8dbX7VSSn7NzF0EAWGKwegRRttL9i4kN3BRDN3U2NF7YAi7yYdbi9Lp6VnDjsTaTBvNfsmEin+1j02GASIPXf6HUCdohRHmzA//OEnKjribEL2kJuLZodcqmBPPXFYkwa+VJfIA+hzKkLvYoMZnjXAqB63kjJU5ngQN6RKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811531; c=relaxed/simple;
	bh=SXKvsjbb6kOB2MdaooRMUXOmM0k8Y5hLTe9Sfpiqp9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMbn1UpClCC9zeC5qe+06RjAodFU4dhwS4/zPLLWRF+0Ncq20NqyKvRx04oaWlIdcmbJyP1iT1/DV7CEkiwc30pZMwR9ubkeigZ/wggOvaK1ZZa4Ahc6XHC9D28KhK2G2IZ3OfADHhORuz/8lfN9+5VUn93gzAyGx+U0QN6bMg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CaT/y2oR; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CaT/y2oR"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6b7a3773a95so10619066d6.2
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811528; x=1724416328; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=CaT/y2oRHpam5Mb1f7JO6NfPqOov8CG+wpIcFYH92KSDWyeMBCjJv5ufsCZaf8aEQk
         j/ZnuwDYyJ0hJpuQMA3OsUPzqpVv76vHx+g2LGRJ9HX12zld7jUZ80Hv9vV0ztTM8Ql4
         9XkDrBI1bC+BDqWBq+TtyktL3HyGD05I7VuD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811528; x=1724416328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVxZXuTJqaJ10E0yGjjv9nH2alidPK1Y4VYj7sM9de4=;
        b=r3YXzkr+84ClUnH+Ru2fAOaZJvWthzutHPZ28ldbr0xvPptCeYUZ5IQWt+sl3e5/ZO
         n4W4e3fWOh2FzPaAJdQFQjqayPw+c6rkCIXC9bbM5tAed4TZwEKc9IUNbUCACQAgQuWX
         hLPtISdNtEZE1GW3DzBla7XvFd3/lXgXP1IPTyUvjSahOskN5anG1cwoErpDshkRqJYn
         HG0DDgjaAVdmpbXmFxjGHD+HU1XzzmnVKr6Pu3ibVIr37dDLDpFa8Jf5Pbg3ZTFRwMwS
         UdLiqGdov+K141IZGRJfZhE/YBdI+9tfTG3eZ0WQZTCIKsCuUN4LRTJmntCKHFGKpSxL
         qaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIkR/ylXHbAKrX2NrRmI3lFEA6tgTa7n6XOVy0HjkkbhihZfHG7qvn+hSaTCm6GYixTemqNzJv+NDBRbA9AivxcLgboCPaGXBPOWEwAQ==
X-Gm-Message-State: AOJu0YylR+5FMVVkvZLCfEoL5NC5J4RlFhnz/Ht9YoAtXyq4KOOwhe2K
	kL2XINeClkcKPzknhqzeu8hqr+jdjfQU+Lygj/uoKSEpPx3ORD77J2z58mIQBw==
X-Google-Smtp-Source: AGHT+IHxo1lFSQMX1cM/4MwpLU2TEtbVsyk63XfQG/g27+OnQuVnbh1zDXFyHf9x2ZFHVGoE5m/EQQ==
X-Received: by 2002:a05:6214:540a:b0:6bf:700f:a3b7 with SMTP id 6a1803df08f44-6bf7cd7ac78mr23067056d6.9.1723811528290;
        Fri, 16 Aug 2024 05:32:08 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:04 +0000
Subject: [PATCH v2 6/6] media: meson: vdec: hevc: Refactor vdec_hevc_start
 and vdec_hevc_stop
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-6-c63105db07e8@chromium.org>
References: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
In-Reply-To: <20240816-smatch-clock-v2-0-c63105db07e8@chromium.org>
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
2.46.0.184.g6999bdac58-goog

