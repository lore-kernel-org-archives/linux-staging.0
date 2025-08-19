Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E27346A00
	for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605828; cv=none; b=acycX3yFj5kx0hvXsOe+58oP2uyjumwgHYDskjOqcSS9k3f/w85TWAEtXb6niwEHI0sz0OwYFXSZRPX0vyYKpIKXRU4SnhpaercWTSAzo3FLk+1RpxWIuunIC/GfUA/VGiiuSYKlAIwZ65Xn2IRvCJCVkiTjFjBMnVKxF9vXilY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605828; c=relaxed/simple;
	bh=ft/dLkIS/1WUaPOdmoRieYoqNnk73c+JMHBuBcnRkAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWIvg6nftOg5I92D+JKChIjRshJEnQaK4MWF0ypdjnWsjl/VZ3t0+cu0+HMNTFl41FzEzdb5Uq6sDFlXfLwhTdWIiL+PCGDjKbT2mjMcTarDQhBLim3v60raeMxVLzuAcVkVp56s3gyxRmY2KBV1qSE0ak2NuWF/2hY41uNy6yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct3UFakN; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct3UFakN"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb79f659aso788203466b.2
        for <linux-staging@lists.linux.dev>; Tue, 19 Aug 2025 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605825; x=1756210625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
        b=ct3UFakN8+XDiRcDXj0lqYxrXIu/dA7TD6L3WzFbgiBFYz3e+7Siz1NYY4FUkrze1e
         ABVp0EIH9pEtiQZArQbM3/fycPMJlF/Xn5nO986p2jX0jxXcSCI+69jlT3giW2dM4oGv
         1lEfXxcPLOIrtkqdqG/4kroJJnzZXJcSUSzoNJNZwN4RorulUSBPz6gAUvVk20J7C742
         5ecx81Oq8zoHXzhEc+ESfrqM9Er6796U6oH+GdVZFPkKlBUcQLnh2or0kUDNe1gltCf+
         zRg3ocio7H1Qslc7nZ8+ra1h9uEaDhPKNuegCZ9Ht1DLpTTFs7UsjnEZVprjKtdABj5o
         fvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605825; x=1756210625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5pmXNI7SBH6aSov89/sVK+QopJtVJ4TfTd5orkCdOs=;
        b=wWsKfJXFCsO3Ojyx0R250YHus/ssyF9KcheFtcNzb0fn3Cj6I/H/GOFV4EQtKQTmNB
         unuP0w7jlXyMC3tJlhHRJF4FSadm1TpIYW1qFQBdC7blM2ubYQL8X2R7ouS9qOpE6dxV
         +dy9yOnX3NdUdALzKpVKOqKkdNvL2RpjMuRNO9PJdAWy+RFS+nTlEgiutlQ+7B9XCFXN
         iO0dk3+07bFFh8sxVpBy/B2kqPx78eNwGbhQzOksh+Btsqp6RIINhy82vdnK2X9oLuHt
         q06qxxifOhDqSk75xhyvmeG9EZQ/8thdKI6/1jXcTyCB8yXjJOOeMj1W3+fYpkOqGFm1
         utgg==
X-Forwarded-Encrypted: i=1; AJvYcCUHBgJt/OSmgpPW9S2WkMT0rcyWKnU4wcZkNcvglgZhnn6cixhKCQqD0OLPDxeCqMptSo6L6rrNjboA6a9g@lists.linux.dev
X-Gm-Message-State: AOJu0Yzunr7O3nAkEAhoVBgQ3Mh7JuTnZaVJE8irCNvMet7cr8QUkSY3
	RrhkX6dGEO7jx/8QZuDX0Uq3vqT3x4iz2eDIebWIWgbpBqhowAmRqu84
X-Gm-Gg: ASbGncuvZUlxT3v8Pt8Z6mR0fckAQ1kic0koPo1QXg44L9c1AUqR7Zdyf6/lePkIoxg
	1ptPiIJICFZkYsjENIBqDiLSGShmBkbkGf9/Ns1yUGvH4b8bxZqoSJezEMT9k4JPEDDZ09gzwoj
	UzN8mymNDPmbwVREaa4CYKoeI1NyXCgUeXc2xRlcqncP9JRkMh1l4Imi1Kxx8oVJ7wIJy6JnQWc
	z/ttwzuG3B0oAuVzxd50AGTRI+xiNV724CFTH7F/HzYUM7WJyd7XJnwGMArR0yrJM7oETbRjAC8
	mGlKtj9hRI0exwapWb1IR4zhCZZjZZ5poWvrYf0vpt3gKOq4QAXg3fMTLVaJO8UvDl4r/znYnRM
	+2Ks1pWufFNEHMg==
X-Google-Smtp-Source: AGHT+IEVo/Sm60jtHnDPZrIJ1ilYsVW3g5Tb0BNqa7Jgnw9wyoMrN/mFE25imQZIxkI+sm+CModZVQ==
X-Received: by 2002:a17:907:97ca:b0:af9:5a60:3319 with SMTP id a640c23a62f3a-afddcb8f929mr222020966b.19.1755605824830;
        Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72cbbsm1012018666b.35.2025.08.19.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:17:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 13/19] staging: media: tegra-video: tegra20: set VI HW revision
Date: Tue, 19 Aug 2025 15:16:25 +0300
Message-ID: <20250819121631.84280-14-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121631.84280-1-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra20, Tegra30 and Tegra114 have VI revision 1.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 735611c3c47d..71dcb982c97b 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -587,6 +587,7 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.nformats = ARRAY_SIZE(tegra20_video_formats),
 	.default_video_format = &tegra20_video_formats[0],
 	.ops = &tegra20_vi_ops,
+	.hw_revision = 1,
 	.vi_max_channels = 1, /* parallel input (VIP) */
 	.vi_max_clk_hz = 150000000,
 	.has_h_v_flip = true,
-- 
2.48.1

