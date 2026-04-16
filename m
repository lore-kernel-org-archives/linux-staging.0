Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA418283FCE
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 16:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776358035; cv=none; b=LV5oedjE/ODNcvWK0N5TqquKJTewJObeUM7+esbb/c1BC40k5E2EnlYzf+7p7WjN/FDLVR4ELrJ6OvFOAuYOCf9ryRV3UL0HeRq6av/Sfw2u3eTnl2NgHsM/mtCadGMEc4VQDrqviaZ9HFsFAFevEKN7VjsYRmMAaHyTe1GrXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776358035; c=relaxed/simple;
	bh=ojXH2F7K02wMz912KjmCBclcAULE9xaANKl8Rcb1Jpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZ10L6o78butp0e2U+icWxito+iEhRS1oftsbf439lX9FtaG5jOJjAO2+Kqqslnm52KDxLkpKRXjVQ0MD5JP9F5JkzKGsV6D6qVlu8W2DIXqU7vbsCZ2LV+sQGb+erD6UkSsT4oxHD8qNUHRRtUDYyNDC2r6y3srkK4z2VS2sf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sbB6O/Pe; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sbB6O/Pe"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f0fc82c76so2925455b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776358034; x=1776962834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CzDxwYfpurj8xr015y/mH2mke+/hLRvGAF/fQ7dIVG4=;
        b=sbB6O/PeSiqGp0r98IyV2AnWPDBc/S7TRNzjiux4wkjrVl/AraO+i4eQ3YD9pj6jN/
         8BsLZ1EmCYdG7bxpkzMocrOASRWXc5CWoldHGb18ygOE/623HEV6O0pwbXwh02jfitGy
         ZwAnNGukN/Z/RpU+71TXNHyobivZo2Irum5shxwly2ZbTQstaB/fY4FRAsGalQPX5G6s
         U+YXCJBSNNGrAQBl6zjgMqaHZv6T3S2crbWjrcitS267ZaRi/rcrXCA4CK2ZjNyCA1So
         3KqNCqiHP6icLUo0LK6YywQDhp7f5ubBRnMbYvwzdWZdEWPJa3qLb1UzXMWfCumE0E7M
         +zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776358034; x=1776962834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CzDxwYfpurj8xr015y/mH2mke+/hLRvGAF/fQ7dIVG4=;
        b=ZE0zEsBHFHfty/Rxcbex+gaZDRRXlVdFtJMwqdMoyOOoprEBozVnb16hrcTSz6IxuN
         4I8l2tDhvZmTWPhwjVjASm3B8+Pk17o8ICLKqD8+ov7i439H+SiLuoSnEbbL3IxHTJj6
         qNG+ICFFaMzfs7KMvKZgmfD24284JiEMIiWmdN6Ii1NdvtAn7G3XJI4Vjtig+1lBkUfl
         3giZ1qDoxMMeDxqn2M2fRwzKaBKNwL8lqycNhrwKtlaJR/dJBXV7eQk5bgqhLqKevy44
         a9DbfTKuH2UT8y8XKLxRxaiIw7mMmm3qNJoUJexGiAlUtsOT7d8lxagRityHaI2yPCmJ
         EbMg==
X-Forwarded-Encrypted: i=1; AFNElJ+I0WdYVa+89AsP8Ro8tbFyOHw8dKy1jjzqXw6e5K9+c8nqS3yn4Aofpf+o5fwgw82rSaoyt4Fb+gvsqYsr@lists.linux.dev
X-Gm-Message-State: AOJu0YwanuOqwT/5+552lr5+QjnWLjPpAQ4mFdl0qPgFjwJavIZght7l
	W/n5eE878jAeUo0nOktugtGjJD8u9B8rnnO/G4dESiIxhwekEkBxQETd
X-Gm-Gg: AeBDietLoq0ZkrazWeBMh6hhmt3w+jOYS86BqLl+67Px8Av9MZqPBgxPCAz4jqjr0hD
	1ddUJbJHBQrFO1eKyMkSYgjYmeclwHZYkoQLDaX16iGPFe0JCHiDmg9/W11swzmPr83Xge7/Om+
	9eJVWoEIr2LLvWHtAjcECvNLgndkPZK219L2Isrgp+4v5bTZIUDXO9n12mhMWnar8XuPH6EaEct
	xdfeOQIkon6Ae9Kmk5iL5JbXl66u0kHANLvkq0TBXKFM2Qh2pp9HWlonL/4KBG3aaF4gu+TpDxQ
	ID8rMxSB2W2N2/IBZ8LQC+LN+0WAtv2wA/4+e5ZW4G6tc8coJKiK/8eUDJGkBshvOcSl543u47c
	B9Y9Q3IP8P3TEkPDmtnVwKS1UNbye9bmqzGAzmQzVwN/mf4nearhfdegQXZWe0tDNHnOB+/5VWd
	LLxAfbepSUrcPfHvqQQpw0FMdZGKdeDKxYpwPXypMtEAP960aN9poa+1awBnhzQNN/6GGq1qLZF
	7F1a6Bblji529nkxRM6FpPDcw2HRnScr58=
X-Received: by 2002:a05:6a00:21d5:b0:82f:2070:2683 with SMTP id d2e1a72fcca58-82f887eb97fmr103721b3a.21.1776358034016;
        Thu, 16 Apr 2026 09:47:14 -0700 (PDT)
Received: from lucifer-Victus-by-HP-Gaming-Laptop-15-fa1xxx.iitbhu.local ([103.151.209.194])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f88a57cd1sm28808b3a.34.2026.04.16.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 09:47:13 -0700 (PDT)
From: Sachin Kumar <sachinkumar905846@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sachin Kumar <sachinkumar905846@gmail.com>
Subject: [PATCH] staging: fbtft: clarify TODO comment in fbtft-core
Date: Thu, 16 Apr 2026 22:16:43 +0530
Message-ID: <20260416164643.153765-1-sachinkumar905846@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve wording of a TODO comment to better describe the
intended optimization. The comment now clearly states that
only the changed display area should be updated instead of
refreshing the entire screen.

Signed-off-by: Sachin Kumar <sachinkumar905846@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index f427c0914..4984aad9c 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -414,7 +414,9 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
+	/* TODO: Optimize to update only the changed area instead of
+	 * refreshing the entire display
+	 */
 	par->fbtftops.mkdirty(info, -1, 0);
 }
 
-- 
2.43.0

