Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038222FAC03
	for <linux-staging@lists.linux.dev>; Wed,  8 Oct 2025 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759908711; cv=none; b=QVHnkLE8+l8qVtaW5Cmuq3NLs6dNqxOWBxCKYH6Iv2jpai9wf0JNx6WihfK3ISBadbKDH0fFn6aakrE6/hJCYjC4Gh7/NQbNnl7Bh8B3riAkjqH/wt6jDzewzVQGWbxSQAQdHzq3VX9AOe3192x2+Pa/51mxK5sFCQVRX5XCL5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759908711; c=relaxed/simple;
	bh=LMNj3RJtvSAolKc/cNyymmQWeXKMjtcs4eYn8DUf4jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKA/fSWSd3UGH9dnmYK0IOlAtQ3OU4SBfTcA/XWzXPSz7I5YB4hK05eYSXlQJj5H14MFRL1mST10WyGLbllMX7qZ3Ae2wwGpx5T+hhytk5zM8GxWwTQoZoFqlH3jmy7+o41ZqlqM/H3JezREk0dfp36gNJne051jhXhII7XYhVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDTdN5DK; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDTdN5DK"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so7920405e87.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Oct 2025 00:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759908706; x=1760513506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=lDTdN5DKQ6OVtfJucpNcSO5g3WcQLTw9NVgb5hpuFMlOMS2k5zUwe2WtIlKyG2TCHG
         6qfpjuV2EzUnuqsj2wTw2WW0upCB2iCJNrDiRMWw1Yla18X3uoXtQX1UUPo1gMz5GNCT
         7BTqxnm6klbhHzoFzrjAFzN6YNz/RCAaZG0OdmjEGwG4NpJC0FuiSXh9g3iXULJSkhut
         tINax7+afB4Jz8NIZOzGXLmmibMa8OMvB5AvGz0VQnUXIC7lmA/onNXMtpr69KJifq5S
         BvpRYEkQq278BSAOTfGwDyUtGwjeFnGPLlkFXELdEaB5S93/Z129z8H2cYE1xMTRYl4e
         LdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759908706; x=1760513506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNqGqTCCsfPGbDV/XUSDGT/efKZfdWLbKEq+jQy+Hag=;
        b=ZHcvrVt2tgkydL9ggvN4J4eIf0mE4IBWPUUDLuCud1njjpfeGF19cFawhCvv+INtC0
         TyNSRguVZDYBjHMv2pDMkCuj9al6xzgIbYL0JntZSsIVn6oe0cDxuL+nKYXDxoIL5PNo
         yGctr273dM5zNZaFLWAWXaG6bN80xp62ZxAtFkQ8c7PHRR6E0Eu8sykhskAb96Yt6vvC
         w5dgRY48HKinbU2gP97h+dBEITdMC4nA/lRQGmObyioCMYxYEmtKH6wkAjeg+7GSRWOj
         vtPCh+Bcu98C4K8bvzPPm8G1jDk9zzu+SBgDFi4E8+MSVBvt8tEYfoBJcirosNEbaVA8
         xpVA==
X-Forwarded-Encrypted: i=1; AJvYcCX0j4xkq/x8TqXqm9Wnre9KQVLvrwrHfcxzHSi8G2oc0n0YMB/nso+13yuj4r0fA3RcDX1aUK0g77WZdQpc@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0fpLOeJ8ZEbT04Ilokoo2n1yC0fTuByF/4nQUH7oR563/3sVz
	D6NY81nSGAGgG8pFogmM8ezPFucIrHTHepO7+oo79BZx31rqXisGaij6
X-Gm-Gg: ASbGnctH+y1y76QeU4tjvVjr23v3PTZR7HgqTgn+Qf5NAJQsqD8/Yr0k7cz2WZoZhRF
	FvHYb4Vytv8VrzdKIWrZHfZ+1hHiCvIwgrxbduxKRCAdnEfuIMNHCimp3wRmtXyueFcXox/zvri
	AmEvLBS0QjEqY5HP5l+anDtpB5jdYCj1vsmPEXPRtQ9eBmlzfEOR+ZZUynNwzQZlCE1UtQ00Y66
	biDrmCqfkU2aSuNqzX62VOSZ6D5dZnL4myMfjYtOPDRZ8iaEWrQqD2qyDriqf8vPrALjsNAyXQw
	4V/P5KqHLEKqTCbGw/xKRWoF186u89cmIApguCTr+8bQFvfLM4e/oV1U6Fv7e06xHlOoMS2VR3e
	8Ayct3QTVEDg/Zq2rPhNjAfk8kwvLF7Tz2MLCNQ==
X-Google-Smtp-Source: AGHT+IGRZlClUUWF0NFnw8JC06wEKdlQrkDCO3jAGBg1Eoa3BWw4+yky34BfCurBVLPslna6NuvYHw==
X-Received: by 2002:a05:6512:3b8e:b0:576:f133:9288 with SMTP id 2adb3069b0e04-5906daea903mr620850e87.54.1759908705540;
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm6911016e87.85.2025.10.08.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 00:31:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 19/24] staging: media: tegra-video: tegra20: increase maximum VI clock frequency
Date: Wed,  8 Oct 2025 10:30:41 +0300
Message-ID: <20251008073046.23231-20-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008073046.23231-1-clamor95@gmail.com>
References: <20251008073046.23231-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase maximum VI clock frequency to 450MHz to allow correct work with
high resolution camera sensors.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 93105ed57ca7..149386a15176 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -598,7 +598,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 150000000,
+	.vi_max_clk_hz = 450000000,
 	.has_h_v_flip = true,
 };
 
-- 
2.48.1

