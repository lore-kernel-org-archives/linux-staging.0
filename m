Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8323F39B97F
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 11:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777893266; cv=none; b=TNqFeI/6C0cqm2CGuTbz3wL33KEQS56TZyc2C4+CkUIkIhQqgVrr2mOPc9ZhLSuq6/e88015TVXN96jmGanb+ldPPyOo9IvEyDIR1l5rE76bz2YU8a6W4bjwe5uo8WBb2W1CD5vJPVSR74fj/LLStb24gIlm+VR2x6w+dRGyVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777893266; c=relaxed/simple;
	bh=5gqcOaHGDYCc2EdNv2Pfg+YmYLebbGoz42XP/KxddRI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r2pOCMHvLhY4mZmqZxFAJHky0xThAfHkTUo7+5fDe3LDbPj1OWMN0ITrKRvltrovIdeyWkgFsWhfAj3z9ak6v8OC3/7hmiyDT4WDRYo3QyArY+rPWru8TSSYnXdtORWiwWXxG2SOmqlnNcl9Z8MvieSxhfB62L3eH14LHfDtsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+QWhY3N; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+QWhY3N"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ef45a6d9dfso440561685a.0
        for <linux-staging@lists.linux.dev>; Mon, 04 May 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777893264; x=1778498064; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=Y+QWhY3NNWwyew9KVj4Kl7ZloaTZNYrpv+cClsJLwSjI7gz90YykEryuA5FgiDuOXw
         txmsYUtVTUC7oMSJimX8atdyXa7bKLTpDpnD+9ucwTb4zxGhgJ7JETEZJ4JMwbPEr6MD
         Md2HRf/Pn5R+YkLzuXLrTs5aSxgL/rqfyKzPmaZ2DW0VvrkzlRoAcs4zxbE1ntwcFWeG
         K9RcPkl32h5WULiaJWIwXaef+Mb7NNVvOx7ZWWNuGshfG9z/ZznmyipL9NLxUoqcKiVB
         cnCglAmWUo03oZ37Fv2nOYG7WvykYPGBc8H59bs7eyv1DumO4eW0wL6HK2t8BUC2gI59
         FmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893264; x=1778498064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=AidjWwQaYT9ObZG0mJsHSKp4GOlZ+inBLdRj18jLYhAMVNAVkCkLotng/vjqJ25+vx
         30GEz5dvMXEdyRdDH00QnahfP3LXcoLbWICrOm1djNuPQ+S9alVhhky6SD8Tl6yplLCf
         RccgBAMsG/5mrTYv38B3VnnbwgPWLHlJmHfPiB7oDUtKTKmmfd8QP45Je4b6kVozzhzf
         HlmJ8s+u1Dcapz1KGa5yXwRRzfCJMi3wfoVX9BUbmRNRVyC8mCFMi7lh+6RydjzB+ZcI
         09F+UIZ7Eev/0azfc4+toCPdkFJIEPurKQqOkIauXkfxmvDFL6uAzjv+tqSPceMmv1+F
         jWAw==
X-Forwarded-Encrypted: i=1; AFNElJ86e/TbKMvqORfnkdtnQ2APTrGsoftIBHLbjh1n3UQzqlnXv2ukl3WuklnOPZpewuU0wkzuRP+aFh0Q/zie@lists.linux.dev
X-Gm-Message-State: AOJu0YyXMkthQ63jaDaWVGIoWCdcFD0GfGXg/y/5me7D3caGPfhmXH2X
	VN5gjJ3mBsDAyGW97lkMzCuRHaFycC/2tfrTq6KWaqkszgdHllQpv45p
X-Gm-Gg: AeBDieviNZGhjl1M/0AXMhwb5vQpK/+OsGXudBU2JYPUpZ7TwSzwOTjAJzZxY2mwMfY
	099vDYAMzpj2je8pnyR6d+q44oLvoVHjn0NNIJDsiVx0cKucNi7iUHpt3fxh0C/VNh9sIyWHl7B
	MWx+RoLP71jY1xgCZAPB9XppYv5cPKJ+hooCm5cBfTTlrM55dP40QFpRuZVNp1x6UAj9MNow8Rs
	isSu+8Glxl3HakaLNKyc7HFoLpfJzkQBu6kGDR2MPjJ41OqTteD0i4c0hjMFwVyzBMscoh131GX
	70A7UF1KOs9tiwYNpc4Vp3z8Y4tgoP8PygdSL6Wo1pF0XIdtWaEAczhbTC2lvVKpsjQ7kxs6vHY
	nF0GvYAzd6LZd7oL/fYETDK2RJjFcyY8mNavhOAKWK3XDsu7NBe00i86OFc54g1r8LCFYa5Aly6
	HsEp0IfgBkz9fff9/zujbUYDcDnGXqhQzvTOJXNlsUZBZRZu9TkmO3vRhCXHDjk/hBjYJ1utISP
	cSagQ==
X-Received: by 2002:a05:620a:230b:10b0:902:df55:8ee1 with SMTP id af79cd13be357-902df558f8bmr29755685a.8.1777893264457;
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:b95a:c81a:e3b:6e2c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9027c2baea8sm214559385a.45.2026.05.04.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Mon,  4 May 2026 07:12:19 -0400
Message-Id: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1

