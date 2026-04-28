Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EA43033F5
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394008; cv=none; b=QdJ0Rp2qWuSjusB/6ov10LNnblwJfuQGufyvK8we0ESi1hHecnHlj8i8TjXYoE8S7n1KbrwHRps3C1p4UtU5htAJ8k3am+N0tyPAZGFQm0CsQDllYtz+XInNRkwsE8Y+F8yReDPQ13CfTWrBOkP4u02bNmkAJLfGIapArhU0BGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394008; c=relaxed/simple;
	bh=WDH6pRA7EbpkJTMzOV6Go8ZWNnndc9bdckcBY8wTY3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SUQwwZAwuloq/+sOgJV6LI9yIZogk+2eUk4/3SRJ678r42Dml+h7r8f7/p4BRySDrqziudJ3qIDt28ydwpH/gdXVnvTlvMvPZjevtrKalKdTTOWANWph6t/fixjwj2mhhHuoQPeMPMqyuyigCqByuwmjLaDd2QhEgCrPG/yzg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GPg8WuDk; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GPg8WuDk"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-42fe552aedeso1899758fac.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777394005; x=1777998805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=GPg8WuDkfsm6LdAOpQwZg+oLt/zUVJwby+jxWFOTFlKAiRqglE7KQttk+xqss1hXoF
         StEhLX1xmaUhyuZP040B9Kqc7LRmnLERpkxomK/O55jGGi9Q3kd3WrPpre7ZO3ICqiTF
         dZxXcD9Rn83tl47OeqIMLkntVtWLHp1MA0Uo41YWgGFRxQU8gesrXSWyJCZiY+x3bpj9
         CreqNM/pQkDlLg+HV4SxINk+IgHwk6KxHNm3U1YunsO8D/uI0BQRrpjBiKljHwKheOnI
         w91kxgoObmJtg7GiaECUkWtOLIHHBTucXQsKCitTWcwAQIynJzl19mTT5YY9heQo4P9o
         s7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394005; x=1777998805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wboe/aXKnnq5f84y1la/d9ohgX40/EwE5yX2y+CnoIE=;
        b=Cck6qrJ4vIlJ3Rz2t7rhyzfOJgkpNrXXW98lvCxLwShbMGS63TLNOVAUo7rEVvDKcS
         Hpn+EIoZjn6YIB3lW56HCtfXdBKmOYrktKWBJ2DlFY6QlLbeSvNgC1tKd3Ib0o8rUI6h
         OPKhr+SDLguuoNhKUUL+D6bWl6Q4nKpvwFLEDlnI/joI5oNn+HMx/r7rSjCzD4/9iC3Z
         AuY4X6ne09GowcV4fki2Yj+vJvfdz0FeRnTlkM22/JymASEFupaYdcNh2oBchP17Qouh
         MPLA54VQYPGG6uy/x7qHs5Nw0xds+ebYmVejaqPyf3sK/Znux3jwF0w9KVH72RDLm4Hg
         vyRA==
X-Gm-Message-State: AOJu0Yxu+z2ZnXPR5h1DboN6ogKoj0LWWYnHwik3tE6BEd8HeC8bdlJl
	DmpfHY3H840w0dxacI5jzzMoHbvnTU4IEEmGXwdqFDjyFVD6CeE6/ZFEAKP/mkzJAg==
X-Gm-Gg: AeBDiev1tsRAj/lhkrEMS9AYMdcXdue690l+IKFwSRWfR2bwLUmo47DPs0sxUfP0Cuz
	UNDf3NYDY2wX1Ky71pEpyZZeu5EoraC1cKQyBuNFnwn8don3UNTtWmEdF9jKxh42fY/yt8WCEH5
	D/9DEIu3bePIhUcQ4jUm7mr0jjNzuoMziPLSvI32hftYjktM26tKN//iejf/KzKcsaqGyVG1cUX
	iRc6J7C+KZ9cngMQDRiFjoym+hWkUdw5ILtqXrXuGlLvCppR4TKQg2nLB0GWUXPARivL6SjXdZz
	6wslz4XIFy6MuBp5ud1EgOTFOcfX9CfJh8tvyXV89xuGtF81a7yf4yiB73sjtCaqGDxjF7AIRNj
	NdRhUH9rRab2BqUdoniS/TSr3ih2LMOXpHPXBT7fDkUdfft2qTzD5p038uWBbj64aM96iyVc1OJ
	cawzxdwtQdfkSaiIhJ4eGOsDehaFJ/tzW1srEbgoDb38tYs0GvIQlBNe2T+oGYiGJ24xjQXFgZI
	m9fIwKF2WXqd66ECO80KsnsJVM=
X-Received: by 2002:a05:6870:3233:b0:42f:e6c8:2ea8 with SMTP id 586e51a60fabf-433f37e6fb7mr2077151fac.6.1777394005428;
        Tue, 28 Apr 2026 09:33:25 -0700 (PDT)
Received: from MSI.hitronhub.home (24-40-252-177.fidnet.com. [24.40.252.177])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-433ef7d122esm2301556fac.0.2026.04.28.09.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:33:24 -0700 (PDT)
From: Mhanna112-code <marchanna111@gmail.com>
To: linux-staging@lists.linux.dev
Cc: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mhanna112-code <marchanna111@gmail.com>
Subject: [PATCH] staging: tegra-video: replace bit shifts with BIT() macro
Date: Tue, 28 Apr 2026 11:33:12 -0500
Message-ID: <20260428163312.7374-1-marchanna111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace manual bit shifts with the BIT() macro to follow kernel
coding style and improve readability.

Fixes the following checkpatch warning:

CHECK: Prefer using the BIT macro

Signed-off-by: Marc Hanna <marchanna111@gmail.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index eb1fc5b7e2cd..f3edca909684 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -177,15 +177,15 @@ enum tegra_vi_out {
 #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
 #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
 #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
-#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
+#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
 #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
 #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
 #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
-#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
+#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
 #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
 #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
 #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
-#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
+#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
 #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
 #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
 #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
-- 
2.43.0

