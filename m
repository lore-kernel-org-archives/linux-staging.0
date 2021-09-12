Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C822F80;
	Sun, 12 Sep 2021 08:21:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id b21-20020a1c8015000000b003049690d882so1765194wmd.5;
        Sun, 12 Sep 2021 01:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPj6LXbNCWGMgslr5J8S2na/ssf54cOsK6CaQGpLv5A=;
        b=fsg98pch/a14OEbNJXu9VqTjbbnBK2TPC6ZWLIpx/D+a5L8V/SMariJ4nvg6bJRFmI
         bPZPLVn/EKRmFr/LnOdSE5m5t/Tcpz8Mqs43dfw9g5nkSlHVrjW3gAWeNIAwsMzcrKUL
         NbsHDjcfE+KxOFdT5pMInpF+dZkgDGfkueRfvv50JYEU3xvW+A5mUw4hVfHLj0pVywT3
         mOK6w/izbeiLC+H0nRQWogvTMnYBZPd44ByPvywrVFm0sEhfEFKOorpCy6gEMC5WAkbZ
         2kAVaW/NrDoXUXtw8nk6kDHzIN/9IoFiWJSCpH5745gU3ORVi2xetU4hwSkyJTNO2H/5
         eq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPj6LXbNCWGMgslr5J8S2na/ssf54cOsK6CaQGpLv5A=;
        b=CtfdDsCSJrH5KL9BfaIy6vOwtqq+8aI6oLMrA0WN9gy9hPYBQ4/bVMBTisPDxs4Lsk
         HerzgRck5YXm1X+q0A2qpwUTy0sdjYfGXM2QjBBZWGC0o2ci3419M4IiIccjY2IwTYdu
         UqwKEspc/iK+86ABtOgNdwR98VzZgXWxWhkIiwM+9JYaoc8dMM17UOeLzW2gI8ElmksF
         JM5CG4REQwnYma9KFuzFmM/WVvY/vyUnUuIKmZwPOuYGvLd7AvWcRT4LU+XARfWoQ9mU
         LgZoCYD3rEIFH/Ry+OVCuKbLI0Im9AmTj+h7d/5OlPg7qypBgsmI718/RazMOvgwFUaJ
         xotw==
X-Gm-Message-State: AOAM5321Se/NUoXTpLusn95DlLzj+1xvlbMlg7aKqk1Ct0H66TKDuPuA
	2mrp5iGElyLGyX/GdoD/NuA=
X-Google-Smtp-Source: ABdhPJzTvuyKRgnTBkT2kkQi1LutRMAbSxrCCgfp9wfzImXxciiR95cPN4bNxbk6/01FqTsUApZ3QA==
X-Received: by 2002:a1c:2313:: with SMTP id j19mr5665683wmj.189.1631434863602;
        Sun, 12 Sep 2021 01:21:03 -0700 (PDT)
Received: from kista.localdomain (cpe-86-58-29-253.static.triera.net. [86.58.29.253])
        by smtp.gmail.com with ESMTPSA id z7sm4734148wre.72.2021.09.12.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 01:21:03 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: wens@csie.org,
	mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] media: cedrus: Add H265 10-bit capability flag
Date: Sun, 12 Sep 2021 10:20:50 +0200
Message-Id: <20210912082051.404645-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210912082051.404645-1-jernej.skrabec@gmail.com>
References: <20210912082051.404645-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently only H6 variant supports decoding 10-bit H265 videos.

Add a capability flag, so driver could determine if 10-bit H265 slices
should be allowed or not.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
 drivers/staging/media/sunxi/cedrus/cedrus.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 144286920749..e7741178465b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -556,6 +556,7 @@ static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
+			  CEDRUS_CAPABILITY_H265_10_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 600000000,
 };
diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
index 9c7bfd2b6616..c345f2984041 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.h
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
@@ -32,6 +32,7 @@
 #define CEDRUS_CAPABILITY_H264_DEC	BIT(2)
 #define CEDRUS_CAPABILITY_MPEG2_DEC	BIT(3)
 #define CEDRUS_CAPABILITY_VP8_DEC	BIT(4)
+#define CEDRUS_CAPABILITY_H265_10_DEC	BIT(5)
 
 enum cedrus_codec {
 	CEDRUS_CODEC_MPEG2,
-- 
2.33.0

