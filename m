Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155313D5674
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 12:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782216847; cv=none; b=ojoxE7J8L0IoHqwJKtSjaXxLWAhQWFUzER5Hw3c/6cvz/oLnDZWoMQiQDJiUhbeQwBNqm/p7poKfD4uH4NP1kvRIDDNiwxVElenm/2OS3VX3g+oEW0+SaaAck9qO8wWaNgY3B3ZZh3Yr5rYr2qXxSA0uV0Dy6iW846lH0lGmN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782216847; c=relaxed/simple;
	bh=CUB++f9XjhntXvc7MViwGfS4/rQIMkusJ/XMrm1V3V0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBEpsb1c2///HjLO5WokVIBsMmTjCRxhY/v0aSvbeaUKQ4ZeOoisGBS1X/L7ntC0gGOqypFnmcPbNvAQR6cIt0v5QzAAO60tNFOmGkQZFDo1Lbga1HtX2XBPidP9uKMGTvfEX9HZzXFBgEBSxcYtFKUWa4/uxl8A35uqkdgajCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8KjyFfH; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8KjyFfH"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-37cb36ca63bso2858281a91.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782216845; x=1782821645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7Nkrwlxlnsqrd19xIf30RwveNhFArO/IgBaWF9HmKI=;
        b=N8KjyFfHSWVGOZ2vs6zaUnVcmWaUu/XAQ72tGWsHeEwcZWcUslV75eAJVc5FS8WskI
         rehvkJ1O1XkiJxPbG9VT8okSNH8sQybm8M5uOUhOhwCvVO1NbdWbFEJsh8x8JDIA84jj
         +y3zgAoHHBpH1JUO+q3WrWXIh6u2yKD/GCY473cmBBpSsAxLuXlb2rPXotkmQo4CjBBB
         HKAUYGKIdakds8+bPSVoQOq+0Fh7rqOOeXGUafbySLV1Q5NR+QPtIhC0K6bweHBf1eeb
         ImFlxLek42Mmyz50v1OfdilwcsjsCKzh8jSlN7WwiWYKN6pVv8jnqlcDFKgTLn1rUNKq
         qyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782216845; x=1782821645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V7Nkrwlxlnsqrd19xIf30RwveNhFArO/IgBaWF9HmKI=;
        b=JNuG6/0Isvq7yXjbzFA6br4NoZ6Uk4dFrdfKvrrUreJAHmWryw6RxrM41w4QajMRLv
         abbuSPtiLrVH0Oh7slswmXXyiO2tydJqUbr9kfZbrKsCQGNzUvx1fz9Q37EmW13pFneQ
         XWdNfR31mLi7AOKSWe5FwZc428bz6MnehLU1EfkKl1bs5u7QdjRSsG0lyEazCFneA66N
         vgwsucitKXHjUm2QdX17+oBe0dHGgQOcdEh3CD6quQiTbovxs0xr08syjxRX6UHIYEhx
         2fN6j+LPkbe7tVYiwXlRo6bK3mwcsT+BpoIdLz9o78gHgbP7aoIJk5Fqo+2edbVOIPTJ
         RV3A==
X-Forwarded-Encrypted: i=1; AHgh+Rrjl7Zse8R+LIaOR9e2MIaFiDReADRNXMfLGH1Iw27POdLB8Strii8q7kMZvP10sPEnWS2V5JSzhgdKYrnr@lists.linux.dev
X-Gm-Message-State: AOJu0YzqkZLELvNfzHPKF0K5kchWKLret0o3gXcO+yue+YPZGZrlzkE0
	wI4cA/jFGDsOuP113+z5Zms+BPyXDpmmnmbGrlS1CXxT8MX68MOFHo9a
X-Gm-Gg: AfdE7cmlcSj20+DmGuBt2MhMQdvGkIMR9eQMC9OWhc9bg/MPUkMgeRaO8KxraORdCYA
	kLOcmK1bnhCUdhIgcVkh2opkSixe2uhLMEDLVca4q4OLlQmIDZ82IsDKdZX+c+9Wredwp/jiKS6
	MaX8mgwCfIH0QbUtwfqptD7V7fOOFOY1GBOk8JV4kmfsA9npZtcOwcBAnaq6Ns4Sxhrnh+E1eqb
	tiXn7dBvww8Y2RkaiQbA6vEVE9Gfabl10k3beRwrQsO1sb9dkZpBNTKMPQUdflMJeiEufeQxN5L
	ks/4SZg7e7JgqaNOKG7ReNDs5G+7QJdkrGctlX3D/BCPGEVPASYmf9NeNQpUmbPKKFma9HNbvk3
	mJXLdpMVHNC88RB9WJ4slQC0H34oc5Kd9/2fpZYpzH7DqIXkzu6y5Ic8djwQwIUhH6UHMzh5eGx
	5ZdCsx78NRfbaA8Bsj7XEuq1V4/z39TUu7JYP9hcn6RgqsNFMU03c2ZiLE7YEYR4c=
X-Received: by 2002:a17:90b:4d84:b0:36b:b06c:30a1 with SMTP id 98e67ed59e1d1-37dd16c2673mr2498589a91.1.1782216845067;
        Tue, 23 Jun 2026 05:14:05 -0700 (PDT)
Received: from localhost.localdomain ([2408:8362:1ec6:4980:1a3c:b7ff:fef1:8b0f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede3f9sm9705032a91.3.2026.06.23.05.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:14:04 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix CamelCase warning for Address
Date: Tue, 23 Jun 2026 20:08:14 +0800
Message-ID: <20260623120815.14737-3-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623120815.14737-1-oubruce1234@gmail.com>
References: <20260623120815.14737-1-oubruce1234@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the coding style warning reported by checkpatch.pl regarding
the CamelCase local variable Address by renaming it to address.

No functional changes are introduced.

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
Changes in v2:
  - Split from a single comprehensive patch into a standalone patch.

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 4bf205e078e7..6767c6bbaa1b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -44,7 +44,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
 u8
 rtw_efuse_read_1_byte(
 struct adapter *Adapter,
-u16		Address)
+u16		address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
@@ -53,13 +53,13 @@ u16		Address)
 
 	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &contentLen);
 
-	if (Address < contentLen) {/* E-fuse 512Byte */
+	if (address < contentLen) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
+		temp = address & 0xFF;
 		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
 		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
+		temp = ((address >> 8) & 0x03) | (Bytetemp & 0xFC);
 		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
 
 		/* Write 0x30[31]= 0 */
-- 
2.43.0

