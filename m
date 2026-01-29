Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F3B25FA10
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702678; cv=none; b=h2ez9cuUnuJzJYXuqEUq7X4LlUec/KFq2NusCg5EpuhuU0NPIndwV80A2xYbMHNrCml9DYtjEBeAaPhCngxa7GIyb7Ww0YYWdSmFdqKMAMS13qJWHVAwr93qQ/E3lvsHmn7qyLyIQci0XbXRxN4ObzduR9sqYvXQndoVO27ZidY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702678; c=relaxed/simple;
	bh=IPcbqWAsVwNeIyEkZ0qKAVG59xeJgPPN3ii7a9al9iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aNHHy/QUl0g2KUicSO0iKw07X21EJeh7Tv2Gx4HC0+R21yaLerODFR4yA/izpd5ykGwkzqglrDtLkGhRl0SxdKUS3Qdxrecgdyn17L0l/P+MWWom15yAY5XXpka8evcuKKnjKzcxOWLxA9HOzbr2c1yJIei5o6vXcbPwaYTOv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfcRayA9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfcRayA9"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so9702135e9.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702675; x=1770307475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf/e15dH3kpD6z1TEY6+wiUq/BevuPDNRQw5o3gS2fc=;
        b=GfcRayA9nJ/zKD1epQY+ZT8+vNv6s6TExtNrcIIaAhThxSCsZCkIEWyNJX9/aIw3G+
         gOPoK7zoM5Qn5y5TIiQXEiFbJxWIor2arWxQztdICZNCK3LyECugPQ8Vh+xjcHEMk3jJ
         pe5aU1d8b/AkF9hEoPydaxhDh9YTxhVBNJuWhNofLGap43mDwKpl6xxN2H0v38usUm50
         DOliTfy4naldhd5syUiDhuWNWqwG2FWJkp/cldhlIm6G68vcKwTa5CTqhD7+d71LAmqw
         NEFbnEC4hNBs7v6K0VgUdsV5LjDHTlP/X6Olr5P0syh7znCMfmcnFb8gq477fHnIsUdJ
         mBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702675; x=1770307475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mf/e15dH3kpD6z1TEY6+wiUq/BevuPDNRQw5o3gS2fc=;
        b=RBb08h7te/l28PIEp+/3QGFqE741y6wN4WcJdBBtMJ4b4CxrDkPPLX3Dhg62sd5JCi
         2Fpw5l8STqTL86D1+wEIc5hISSh0kEzNhp7yCvqMBY1gLBNdtD4+DE62aUJqU/ZoLono
         +BS8DAm1Tk0C2O+IqFT5sfJnzaJnjM0ZqYzaLAFGrNooVo89KMt6MU7dljSr9rTQwBC5
         GI2DW8alCLlrtS4ldtZTS91bg8FgE8sp1xF6PNKBaSp9Oo4pkXABLmHNcYcw2MVmlsHI
         7sCw6iSMIAiKPMTv/xGIDFRT9z2fSq0zy7kh5gpiY3mV6aXAlCT4XyRc0/tGmLraL5Dk
         pnEQ==
X-Gm-Message-State: AOJu0Yy1nbuoGrHthdZEvbzwsaEoL0MK3jDJQBuzKkUwxIk04hffKORg
	97hOkUxg5YsxyTRjTgWp/jqooNrv8p5cCbg06PajdXAlRpF70fTGZTEPxlru4gNe
X-Gm-Gg: AZuq6aJU8ho6sZz9vcJvpUGlVBeqTx4SDarVaqW8NAl/BdbhsG3vDPOGe0s5XWWRCms
	VACmNBTU3tvJGyNUYSvqeL2a0lGpR37xaONltYj1+dF1Wtp9IS1D30nlqF2H86YtAhasTm+rVrF
	MgzB1MSG/9iCoVXPoL8mb6ACYcBq+5G1Ihd1+2glwVUeIMIGuCd0T9gkghlyZMtXHoItGEJ1MWh
	OnZW3bpwFMVrhqHqeNZGpifsBpxEtKpFnNdoUdFdx/ZeOS+FEqbY8o90osSuwBgqlViFIvupxoH
	ui0NBXBJJ8eM6GeMjxOBHPDZD4cnGbXzNybAtqApaoTOio3Zgx5T3dKNTPdPrxQN7SBcUmILfcs
	wrv9iuZzNzcGrJEwmWksTbcHMM9WyZ4LcKZYpNDTjI8GNC4IvbmpnTT35bn5YpYPce6PLELSrV5
	y0KPGgmY94MGK9ThNIGbYDp7paMpXjWgvVgNDOPcg=
X-Received: by 2002:a05:600c:a08c:b0:477:63db:c718 with SMTP id 5b1f17b1804b1-48069c43e80mr132902725e9.16.1769702674965;
        Thu, 29 Jan 2026 08:04:34 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:34 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 1/5] staging: rtl8723bs: fix open parenthesis alignment
Date: Thu, 29 Jan 2026 21:04:22 +0500
Message-ID: <20260129160426.13737-2-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl check regarding:
- Lines should not end with a '('

Collapse the multi-line function signature of CheckPositive() into a
single line to adhere to kernel coding standards.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c  | 4 +---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
index 5fcb9420fb3d..ab5af96c335f 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_BB.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 9c07df254eaa..ac5e3d52b3bc 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -8,9 +8,7 @@
 #include <linux/kernel.h>
 #include "odm_precomp.h"
 
-static bool CheckPositive(
-	struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2
-)
+static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const u32 Condition2)
 {
 	u8 _BoardType =
 		((pDM_Odm->BoardType & BIT4) >> 4) << 0 | /*  _GLNA */
-- 
2.47.3

