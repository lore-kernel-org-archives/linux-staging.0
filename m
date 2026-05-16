Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8759D3E5A15
	for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 15:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778946652; cv=none; b=BAfKL5+C8pHzGhjBKvj/ncAyuiCWhlvelbK6vEBWEQzSWVeoU9+PrKGHo+A2NejnOuSy+Kw2bUZVOqeYkH+DsGe0r/WmXBt4GKT5Yrgl6aPhaE52Rr5W77fv4OzvPORP03xJD4AJiwDoHaBqBN7wrrRQTjIVJ8q3f3MSGmPv4Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778946652; c=relaxed/simple;
	bh=glthZY+TeF3WuDE6JLbfWI0WRcyhTMVu3WnPkFcL84Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P7Nj5Bm3IMlg4OreN9/giRCzIQhxJGnSpf+S919Rz0V+QwGpezpNjxQYN/SxvtSdtZdi7P3avW2OrGiaqvOX8HNCew32UE++QZWSvgYSrfzsCMmzPmIAAn8+fCO7PWGSfbEpVq/Q0697oc4FB4uA1MuYHBpRCTPnXraxtqj715s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLCfh3TQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLCfh3TQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba856db1c0so7187565ad.3
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 08:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778946649; x=1779551449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=dLCfh3TQEk4otOGJne12Mtd+wYpJaJ4XgJAboB9ritYqg4tKbnjNJcwKKNstOOHvzR
         gVFpbBonPsmubOH/Mmf3soAZnTn20s52J4pfMDO9UvxlGFu6KIWZvDUokt+0NSG6FChe
         5H+gV3HuUM4upfGx0gJy7x1iITiy/x8RypVHX7D/1bF93qrmH9T0bfiyU3c4/7/yv+E1
         9vjg76QfyVWwsDFV1/Dp0kPkPqwVUWpzcdQT/LTFe/QCMCEN4T8rqmUfRq0r4bnO6WXV
         3DNa9OhTTpVlrUm3SiSmzNSEnd83U7k4Y7fhd3A0Wa26M1e8Bb1EzsPUCC/nESCb0Wau
         msEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778946649; x=1779551449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=CSQt+o2uKUS3oYc8NnnA2vF5f8LrlC8xq0S8mwY+d51/CC6ML2CkTzW0yH862Nc5r1
         WN4Zc61TMMWhhQJ/3138rRz6LLG7z+ICQ58mlQOwOrIpkncaknqTPSlh1GWcTt1Y1dGc
         00ntFylOsT7d/ruHsSYasXXppsrlS25+VGnd7RiwLZ6f3hdHaA60AEKY8iLJIzVBkqg0
         nwBmVCyL4gAJQ+YHHs+HnYuDKVMmQXa2eMda7rdSwWSwXAahwVFFiLdRi2salBGQ9HQx
         VAapVqKMSUVvLy6Q3Rttc1C6Tmpz+xphluR2U5d6U29doWhx3kYWT51upkTNWNUuN/8G
         U4cQ==
X-Gm-Message-State: AOJu0Yzg5m1xkT5Eiaws3F8UNB3ubehajc1KRANp3KFnd54AF2tDldHg
	1gzdPqlZbsnHroq8jajLvufWvGaBCL64qWVAH9eUO6UcXU6KD/g/kmVq4oNKJVYK
X-Gm-Gg: Acq92OEexC5V/jGLWeaUTXMekPPbUiIaz5rG0XVwbVjB4iK/F02kEF0QKt7F5z4py7k
	RXuWi9BWiPeKY5lMh+H8mYDpj6KHV2EhySmoQ6kvj1MLQpM4y873Szgms6uEThklCF8m83zztvv
	4NVkBGKVBOurkEp0h47xLnQKSNrf+gS3/qlyvbMu+CrFHubuHnhbinu9qXcXZyRwc1G98a/Xb5l
	HU4c1/QmLovTzWg8KUtenn00ectsiYFvrq8lUliSGW/YldB4G0MErcjG9Qq7UXfSiG0wVVUsNRk
	skgr3nkYGldWWLmxPbaRcP1fYQrRfS4xG1p2Ly14fNKR4emMAMNHiNA8Qtol+bUwl04O1Hw8Oqk
	y06SNnnuriCFj+8oo56QwOc5IHnfw5d4EeyZJb/LTveAo3FGERSaaJB9v4aZV7cOh6xefmmzVVK
	9A8WAfqhEjhtMceH8OVu6q4/bNPvZYR/FguNd/+Y77B5tR7r1AeTQ6WWE7V6xMHgch6UrOp6nu9
	dlwyg==
X-Received: by 2002:a17:903:f8c:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd7e8057ccmr99240775ad.18.1778946649023;
        Sat, 16 May 2026 08:50:49 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:c9d8:7ea6:1f8f:17da])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600a4sm89346425ad.30.2026.05.16.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:50:48 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Sat, 16 May 2026 15:50:22 +0000
Message-Id: <20260516155025.230865-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..987d05816c5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
-- 
2.34.1

