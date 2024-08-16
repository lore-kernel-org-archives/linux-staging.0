Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5868B1B8EA1
	for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723811530; cv=none; b=T3sNE8dWvGL784Tt4BvtHtrKofdsEiCf/Eo9jmTSMQjYGRIg6lFq44aZQ1cLDXLGaMf3jXTWB/dz0Q/Y6IaH6Sj/pYquc36X9/I5/rYU/mnRAeiBD/g94fk14qU3K3XSFc6+vR5Xbvm+d+RW8mJkzQkfPs+KVhg3bjJGlzEdNqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723811530; c=relaxed/simple;
	bh=EucDhSv61CuFfP11sjE8SXVP+6M/bqH4uWFxl+dPrlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCBH+rQFa89ZX+tuxWwsORDprs2hA9v0Jhbry8yQdo8nJ87uAg3CMs1khC8rbiMklFp+FhgSHo+eZLvdFUZ9mKAYovLwxiSTkO+1kgShWomrTxPy9G0qrmDjMpJ2oUyBI4vFYoL5TwMtfbFNxVMTqZfHBo6NIEuxSzn0D6kk/xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jSAXqYFB; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jSAXqYFB"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6bf6ea1d34aso10385506d6.1
        for <linux-staging@lists.linux.dev>; Fri, 16 Aug 2024 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723811527; x=1724416327; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=jSAXqYFBVpqIBWApraeByHh/mfgex4kj4SjlnmY/Y4WiD/+d7+FDxgQVNtFrvuj5D/
         3ZEcETHKbqNf4/IymFeZhCM5KEjpS/+fydRBitFas8pZdcKhOtqt7IMOz/ZvIK3+Wvsf
         cKLB1bcXdr7e30HUH4uOQVjs/F7TDCYlsQ3y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723811527; x=1724416327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M3LNSQjxs6knu07oTqqXD2vtqpOl0khzecMqHctA770=;
        b=nAr8uyXDStxmKgIpsQVf57dcJX6y+zE0CbT7AgZz7BS06YOO+z9ZTECFjDbNQ7/hRi
         Np/4gfj0yViBGDNSolXs5E//Hps25obqyQhURgyauAaMEKAOWfk2aZb98mzbMWw2ZkLj
         7/Es3mPbEAHOGGsenFP930oKDGKWRhlo4SptNqq8cqrvN3MHpjRh5RORKZHU/vLjarxI
         W1JKPddPe3dvFGG1GgD1+Te/XSfAfzlaV2WDjqUBkHQ85tM8WS4xRCscUgHdVDRtqd70
         MwfWRAchT/9cOozmoHe+I5cVX+rb8fVoeC6cRHSlm/0HYt7WsxiSmFJRdc8uMztZPpBy
         9zJg==
X-Forwarded-Encrypted: i=1; AJvYcCUCzCcr11pTto28shr8FSWtd69haHS4hfnkLlvtLzqaLd6lRn1xSuZGAWLko55Xfr47eZJgU0ptqiYUi4v7sqbkb9dIll0INjwhGbNiyw==
X-Gm-Message-State: AOJu0YwHEWifd75bVmY0Uc7uf6iPtAWn2dbtPepFNbn4Nmbvt3U9qAh5
	u8Y3eYLmvmsbfucfqHbdC+05kzYzQ0C6NyAM9k3lj7TeaoJtg77MifFMc9DWXA==
X-Google-Smtp-Source: AGHT+IHYD7aRmKGXgp+t/Ifehq3d65H0DR+M710hdZy/In2eSfy3ZYdXCjNDHAYDxXFnFLaObLyDlQ==
X-Received: by 2002:a05:6214:3d9c:b0:6bd:83cb:1b8f with SMTP id 6a1803df08f44-6bf7ce5a411mr36042536d6.36.1723811527255;
        Fri, 16 Aug 2024 05:32:07 -0700 (PDT)
Received: from denia.c.googlers.com (123.178.145.34.bc.googleusercontent.com. [34.145.178.123])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef3107sm16881426d6.121.2024.08.16.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 05:32:06 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 16 Aug 2024 12:32:03 +0000
Subject: [PATCH v2 5/6] media: meson: vdec_1: Refactor vdec_1_stop()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240816-smatch-clock-v2-5-c63105db07e8@chromium.org>
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
2.46.0.184.g6999bdac58-goog

