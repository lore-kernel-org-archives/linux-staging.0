Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185319AD89
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723551238; cv=none; b=p3q6DCPZjO6OKnm04CnW9GUkrmtjcIIhc9fbuh0Fh3ulwXRr5yYzXU/U0NazzCgOuqTD6D8Lwo+MIMutcNgoiHshMBjZ1PycbZYK9u/93qH8fqfj0DN+i0L+VPysD8p5znLNKvttmoO0AxGFWmlvl+GaEqnGBXLoyd9pHpcoULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723551238; c=relaxed/simple;
	bh=98X2t2WGiLxxCwmlaq0/ko8VmZHn8l1cDrLmrBX7bbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onRJVze87M9kTpNZdq7oMYAY9eAiWot+70LvD669WU0uVyRyl97wgUSGb7Tv2X6pa4+pz2Dkv6c7t6FxILY5tH2e22Sp0YFb04x//wCmk6k0LUes236YqKB9OlC38jqrHVgZ4ZUJALiIx2Hk5PrqOP2AGQ9rLVPgKgTddciMFvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NucX4mTh; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NucX4mTh"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7a1d024f775so359901385a.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723551235; x=1724156035; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=NucX4mThGf0Hta4AR8BC3JRwvRgjLM+91HoAjFzZBwO12kMpaEODsSUNq81EEPJzc3
         dvQ0u6dFQa7XZ3KZDkr5U53dkAP7ypA0fI/Vazmu4BwmFuFxcYVlqmnZ155TT2xTeSKO
         MYZEJ9ZRvb8psc/d0EC3vqLca7SlcjiJXw0Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551235; x=1724156035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryvSTyFRHLyFB4VqqsDZg/Laqqf7RuuAiNN+vKB3Dic=;
        b=F2OxO/3CHbfos1/dNGxZ80QgPjewHqRkIFqnYpiIga2Ma6Zx6W1oPdbE05YNGEWKj2
         P3OfChH4JhP4gDwH8m/bp6x7NzRLAnCwLibgMumA6hsc4BevJqjb7Jp2gAXVHkGOVVZu
         kA6tH3Zz8sNOsEqwFlPIKXjp9/oNZ1W7DJmVAerPp3rxfIn4gTnfduq7BXKKzorckadQ
         HukKpswjLHcSJDv/FMd4pErOvG6cDQSa5UsRMNTNpJBcU3xba8HuRNlbrCW7P5bW+T/q
         DCkTgZ4OcU+7g5ya61EsHuOadW4U0tLZT09XR6gPd3l0j/wwibGIfu8LD48z5ri9J1iD
         Y2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCWflbu9iFZO2Tf/E3x1fIAj3WVe9cNZOfYkYjTskcCo+F28CrxQNjJPTHgffNygOf5CvZoTUFsu5eY+X4MteutSFR6TNrHNykWvmuORsQ==
X-Gm-Message-State: AOJu0YxqaGyPw4oLrBsyWP6MdasFwD0iBnmCz1cp/NfKOQFr97oQ82ho
	FwZz6kSAnVemNyDgAHoCWtwVEFQ8bE6UMdy3FOxLgjXN1zyzRWxfhe7ueSFJTQ==
X-Google-Smtp-Source: AGHT+IEOX25WNCrWUaMxc3lkZuEvbZq3/dMLr0NrYO2cFstfRrmQqZhk/+W2xbcY25YibUai9xTEGw==
X-Received: by 2002:a05:620a:31a9:b0:7a1:6062:ed63 with SMTP id af79cd13be357-7a4e15a434dmr379872785a.29.1723551235139;
        Tue, 13 Aug 2024 05:13:55 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7d71ca8sm331765485a.50.2024.08.13.05.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:13:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 13 Aug 2024 12:13:52 +0000
Subject: [PATCH 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-smatch-clock-v1-5-664c84295b1c@chromium.org>
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

Factor out all the power off logic, except the clk_disable_unprepare(),
to a new function __vdec_1_stop().

This allows vdec_1_start() to explicitly clean-out the clock during the
error-path.

The following smatch warning is fixed:
drivers/staging/media/meson/vdec/vdec_1.c:239 vdec_1_start() warn: 'core->vdec_1_clk' from clk_prepare_enable() not released on lines: 239.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index 3fe2de0c9331..a65cb4959446 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -129,7 +129,7 @@ static u32 vdec_1_vififo_level(struct amvdec_session *sess)
 	return amvdec_read_dos(core, VLD_MEM_VIFIFO_LEVEL);
 }
 
-static int vdec_1_stop(struct amvdec_session *sess)
+static void __vdec_1_stop(struct amvdec_session *sess)
 {
 	struct amvdec_core *core = sess->core;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
@@ -158,10 +158,17 @@ static int vdec_1_stop(struct amvdec_session *sess)
 		regmap_update_bits(core->regmap_ao, AO_RTI_GEN_PWR_SLEEP0,
 				   GEN_PWR_VDEC_1, GEN_PWR_VDEC_1);
 
-	clk_disable_unprepare(core->vdec_1_clk);
-
 	if (sess->priv)
 		codec_ops->stop(sess);
+}
+
+static int vdec_1_stop(struct amvdec_session *sess)
+{
+	struct amvdec_core *core = sess->core;
+
+	__vdec_1_stop(sess);
+
+	clk_disable_unprepare(core->vdec_1_clk);
 
 	return 0;
 }
@@ -235,7 +242,8 @@ static int vdec_1_start(struct amvdec_session *sess)
 	return 0;
 
 stop:
-	vdec_1_stop(sess);
+	__vdec_1_stop(sess);
+	clk_disable_unprepare(core->vdec_1_clk);
 	return ret;
 }
 

-- 
2.46.0.76.ge559c4bf1a-goog

