Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE2B224AF0
	for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771171048; cv=none; b=QVifiZYQntZrHm0vb/3Dle93cJJh7i9VXsJb1wWkyj8zJb9+5SLTsG9zBhPJdHbLS6qDcYiBmql49S3O3jnDuJsgILsTHzVgY6+k4Re8unlq3W62x5xkQlJztlWfMlUEurzZhEzDjLdAKPspmBCJjXZ/t3slSkGSH5RpOiceOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771171048; c=relaxed/simple;
	bh=E6yQjYl4vfGGRp1uTTGg8Nz7zyelYkjXNClAkUPBOyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZDuhvUfkhgsXri4ILlwxoStM5ofHQ2rWQL45d8T1orW1MGdWp9bnNR4PAbx8ckdtPqmuZ637ecJKMPjFbxmoV30I8kduVhBrhD+Livxp8nZPwsjGHpkjya4FCT/ZqAdrZizus6xO4lwEgaSoA9ZzOOlkgQqmsXboVQf6CZXyjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOn3QdD5; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOn3QdD5"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso7475005e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Feb 2026 07:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771171045; x=1771775845; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRSbgtPXnIuEFz/AEQ7QhPJJjzuCD8PdbBev2gxFaVc=;
        b=hOn3QdD5R30tsjqmV+2ScoLuojrBtBJDo3sKyxs+BuhdT1LAxiG/BAxTAXwtNi5IED
         F3CmNutoikCaSzYo2L1fEh2aEVeJNjlIkv9WgdOC77Kic/hfKX/oyhjdeDJp5A3h9qlQ
         hyGiLtGBMFhsGN97PGoK+Fu5T6Vu1HgYo+nw2v2ozeiMmr+fitSuIrVOshrvAbemtlWr
         AuU0r5jAuVO6IlI67tSkyIFCHacGJ5ZMapghulWtLTDmNzfUiz6NBTINAU3V+WdR2qoe
         GfTOjmyMr0uX6JcsiUgOcUVzi6lL8NAD9youyw7Qdkzo0t9EitKOEfZDUkKdheDk2d2Z
         xYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771171045; x=1771775845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZRSbgtPXnIuEFz/AEQ7QhPJJjzuCD8PdbBev2gxFaVc=;
        b=Nj/G4eAiJEYBzrMzxv330LSQedHsaoPE35bVS7qI4Mbn5Ampl7V4lMAf7lKhm5TIMz
         qllCGgQGyHWU5IQtz43IgLv+WhB6ORJ+d2IHDC+yq4yZYFjNLsnN3ayr4Xu424lKrk7Y
         0uG25zbQ6/XwWj5NLVZk6I5TZ6K8PwveFZ6GkjxBoCjpKGIFZ0bLIcuHemZYrBINUQqY
         sA8ttHHvtJ0FFSdvdhgGYE/OVlfSA2n/s9ThlaV0lwCfsu6GowQPUIY5Q0S/H9GO1XEM
         mnWDm+DZ9bi5ptIZcWW+rJi9vd6hGg4m9T9dJ3VCosZP+0pZCzsYsaURSroYcwEB+nk0
         RJVQ==
X-Gm-Message-State: AOJu0Yxe81qbkHGboUlxuDMukS+/QQ6uH1tDPWJUQTx0o2c0NiyvnSyl
	2YMWMrOjEHonVWnvbwAayLoj3n3BUtA9HY+YCSJk9dNCKvM6iL+bzGQr
X-Gm-Gg: AZuq6aLJI8uND+oC2gxzEA9ON9I2MCIqz1y4u5/Gae0016VjT2l8xOn+T2TdSVjcmmC
	2LO0mIKtxxc27eYhiKDAJ295U/Clydl1Iu2DudvbXfDE4gGgmdWNgn0IBQXdxSWwJe/N9nHptey
	+xwvYMnecLg1miOpClnLT6R3w3jSABM+hW5uAf3+Vp45otVDnQRpbcfuEllDPFgJ3Atl3dU+QtC
	uFKH+gTlwdiU+cFr/TmE7QjG5QK1N5ZwcEbGvPPA6F1Hov5sTH2/n2dn04Bh3P4o/XP+3YLDz49
	aKNpAWePSHpEdvFI3Pk+teSRuO8BRGSO5RT1OsnsGKp9wXsrElOp1Mlfo38bqJc7nhCccVVGwus
	//tjCqZaICEb4+4BESkZNH+U28dwKZSWoNBXg1vk2Uj1e1BoxVcFg0XZWsr9F36QwD7/hUKeX8M
	98YnBxhhGUSSot75DwGSQuN3h9fj75nFoyI9mZMXCa0vCk9uMv19SqySHzVM+NS1vYFmuHW2N+C
	Q==
X-Received: by 2002:a05:600c:348e:b0:47e:e2ec:9947 with SMTP id 5b1f17b1804b1-483710960eamr158838895e9.33.1771171045115;
        Sun, 15 Feb 2026 07:57:25 -0800 (PST)
Received: from localhost.localdomain (95.59.121.114.dynamic.telecom.kz. [95.59.121.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm19055424f8f.14.2026.02.15.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 07:57:24 -0800 (PST)
From: Azamat Rakhim <azamatrakhim8@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Azamat Rakhim <azamatrakhim8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused MAX_PATH_NUM defines for other chips
Date: Sun, 15 Feb 2026 20:56:59 +0500
Message-ID: <20260215155659.67324-1-azamatrakhim8@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove MAX_PATH_NUM defines for chips not supported by this driver
(92CS, 8188E, 8192E, 8812A, 8821A, 8814A, 8822B). Only
MAX_PATH_NUM_8723B is used.

Signed-off-by: Azamat Rakhim <azamatrakhim8@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 1c929d88e596..38830552d5bc 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -202,14 +202,7 @@ struct odm_rate_adaptive {
 /*  */
 /*  Declare for common info */
 /*  */
-#define MAX_PATH_NUM_92CS		2
-#define MAX_PATH_NUM_8188E		1
-#define MAX_PATH_NUM_8192E		2
 #define MAX_PATH_NUM_8723B		1
-#define MAX_PATH_NUM_8812A		2
-#define MAX_PATH_NUM_8821A		1
-#define MAX_PATH_NUM_8814A		4
-#define MAX_PATH_NUM_8822B		2
 
 #define IQK_THRESHOLD			8
 #define DPK_THRESHOLD			4
-- 
2.43.0

