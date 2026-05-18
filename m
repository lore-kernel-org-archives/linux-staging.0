Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F116381B14
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 18:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127614; cv=none; b=rhpR1FPiPziJbLAAu6rGEDAkyu/1BXGi2G/LXYBE3EITi2S4OokpqIc1ZBQl7ynDyPW/gCLfYxrG7Y10Fuo4/PCQuW/6zaaxY3qt7H3E42BeIYq4xDwEskBiVZULNEDVEt1c8UGuhHUbVkwx8glB9kTsfn2Q1rIkG1P9zAhADvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127614; c=relaxed/simple;
	bh=h8DXU2c3BT8kyRfWFYRRCTCjPoAIECvTYYCOUb/IJwU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UmRq2I2H6L2pyT5fSiO+Q65+qKabouJjo0wAaryf2t78NgTtLoPGvtdP8yhMX3hZJ62IpBTC8z+Uy8aWiFnSzEzel6BiziAjImgX1L9XR+zVeYYdScCtcZPhrVp3qE+aeWVKeOTwCEXJZkS3mIrhyOeLw6StxFj45HmTq4f/ftU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR1uTo9D; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR1uTo9D"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c8025f1c227so2194780a12.2
        for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 11:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779127612; x=1779732412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crep8fKLL4OTE4wef1xJrHY8Enkspia+kMPHukQUXyE=;
        b=hR1uTo9DeE1rEA9lB/h70tNRvQe+BRLu0wTaoNrtPneTDJ/vhQ7Kx8u9Vwum5HYoM9
         EFFaVa++bv6ggr/zQfDgn/gJOLayTPqsSXNcB3Ztx3X6EKF/FU/wv/JYihTu5WdGikXq
         aGKQsrncU3W+TxaNSom2vkhkmI1sUMgqxDtHh3isWTWKmWQ3WW0wBu9ExyTJgDdp3fLn
         Q9gF1U5kleCzcP80h6o4J6+HVRK0lWdGTaF0TJhLurPSKeS66Jn/j9+NfeBYu0ypMg4v
         E/Zp7BCIWnGibORPwakGBRzrRm7GRsylm1BFFvEbgNVUnQfCqHlSYaWlNb/cKBZl2DZR
         SqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127612; x=1779732412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=crep8fKLL4OTE4wef1xJrHY8Enkspia+kMPHukQUXyE=;
        b=fh7KZnXkZ5+Dpf/x6PnXuzBUjA0mcZBugLd31vd5KoLD7I1LG8HcwuGSKyRaDbwRls
         n/8jJgAS1SEk6oy+LR2yukaCkadqKvqW/5/TQ2tJGKWsKCdUiBpql4N0tUrB4dL1eEru
         3aH6uAMCvLSyBy613aj1w3HqmT3Ma95qYCqht6h0yrxoJxe51GOaWX5jmSQNeeE3zJxI
         H1EJ2ZEqwTVKi5SVjIi1ye2ZC5j3PCVQKDlv4JCWRQbfZ61z3QtcviRd5Dw4BaHqmm+r
         rnJzDrxF95t9xophjRC/PCoQ5Xj0SO4f1kNQM2e3zQZC8aTUags7yZUo5w3kuA1136O4
         dXsQ==
X-Gm-Message-State: AOJu0YzMIkdPrJua+8SqGVmuk5ZmyXWKPWtjbpfHYZsQvAIEKuNY5RRh
	wCKzgAVU0kub1Ykw5bClO3ZLTdF60GzZXK0HGKwxoiZ9+hsW7owxuexTnWeHsDMb
X-Gm-Gg: Acq92OHAKNJGwdWfmbbtZNV6Ly3/2n94vjhMoTn+SVOEebMYzYYOia+X9dZtBhENgK6
	zvUEumOW4IuvkxDK+vTMr42/V5vjHFuwgFkvQQU5A0g+RrJmpeG/wQe3CxbBKnd19WWV1470CaV
	qPRKqz6ZI5Erx8MDJ4USoV9wWngMOpDbXuPE1LKjARFE6wKRNRUq9BNn7B6xcZc40k7wWbiBhCg
	3Zo86K0+In7DceQh3GEUhcJ+hlwoQWLhH31XybE6D48EuG8zLdIOFJd/U5G2WVBz/o2XRjj6e/r
	bGN09Fdi8aOdy6NbXIXdUOkKjl66rDOYWRavMfbYKXWV8nhOUlMcFB9W5i3+biChsB/GvlWfV48
	P3NZndS05axIDUC9WuCRvLiOcggbwAunlb4gKgCmdixMK8fZ+0lhHPUzPI/YJl0AooinsPF2UlL
	ee4r3Vi4esxBC/U2xAFhJZZK9I32zGpWr0fJhokDVRPxn+EcQwldFMgn11WvAjDUsKRdxjKW/LA
	uvPIA==
X-Received: by 2002:a05:6a21:32a7:b0:3a3:23a2:e85b with SMTP id adf61e73a8af0-3b22edd061emr18539873637.49.1779127612300;
        Mon, 18 May 2026 11:06:52 -0700 (PDT)
Received: from localhost.localdomain ([2407:4840:a002:5ef4:41ce:f2b7:a7ca:2637])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb0ff0edsm14642773a12.20.2026.05.18.11.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:06:51 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	mokshpanicker.7@gmail.com
Subject: [PATCH v5 1/3] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Mon, 18 May 2026 18:06:39 +0000
Message-Id: <20260518180641.44421-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
References: <20260518180641.44421-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Also fix the missing brace/comment spacing in rtw_efuse_read_1_byte().

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..afece04c09cd 100644
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
@@ -78,7 +75,7 @@ u16		Address)
 		return rtw_read8(Adapter, EFUSE_CTRL);
 	} else
 		return 0xFF;
-
+	}
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-- 
2.34.1

