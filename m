Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49504227B8E
	for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 07:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776583295; cv=none; b=b5AD1Pf75UaIHDBeDVlsLtSzRwrPK9eYZT9UzFdMcihzBb8Dh/3DdSO9sUZj8DgHke8KvSZfcpf90eQcVrj8kdVne/hLo1kg7D/qE+hGxOuREXGku0TTFof89w1DHQdLebxzqCIj45tL91ylPrCpmupdE/Wm2cn7vd09tEtjaM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776583295; c=relaxed/simple;
	bh=KQ1IYoqdQDqQGjksNe6t6Lp8Nod3fcF+kfBJU5GoYOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B65yNo5yo74KgzBShRf6zYd2IZrDuyRdM0NDl2wV7AOS1CnLGw/YxkOezIpSJSz7LL5bXOgaymSyeyLaDQT0yHdrKO+WYv0+ubCYCzPrVeXcA/grtMctgpotNNjSqQH7RnsYgIUsqmjHaM2iEKeaKBHACLm7D4fCd1g+bHxcSVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9Y82efl; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9Y82efl"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7a43424f861so19263327b3.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Apr 2026 00:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776583293; x=1777188093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rziGDT9ajuSK+QeeJof3O0vJrGSogjJ1ExJTZD+ymgM=;
        b=d9Y82eflz/Q/slnHm3kQx0TaeKg8WiUx4lyzWdCrQM/H6dD2yKU2vJUaAtL6NPIh6e
         r7Fi3v62Rmi34D0Ok92NVB1srGX54o2VCAvHQ4XrQZ3bvRPOZYVzasKEfDL1tQNuUZHY
         8qzfC38LKh+r9A4VSoKDlOCnFu0IAZ4KUVEzptFExUMjuvRgtloTDFKUIAgugZzzluCF
         gs4jTmoqxAnJTQgLUsecL/ykK7AjFYAuQklPhevD+5kp6nH3E4ueoiCuxBLLKlB166MH
         Zh1nLpfnDRoFFGvp/tSqKDls7qkC4SN+MKT9MacwqdV7+RsnDqkLon/YVOPl/Z5BhXYF
         n+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776583293; x=1777188093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rziGDT9ajuSK+QeeJof3O0vJrGSogjJ1ExJTZD+ymgM=;
        b=VeJclzf5XglQHLxkXAPxbiCmjQPu3wHkr3TGGTi+46KuEHtba9shUr75cjvyMFS+qa
         JCd5mCXQ9kHrN5QMslDqIKbfQKKPjGhmBmJ5hcrfgJ8IqvBE0MydH7KK4Vxi2CMySMb2
         9uBGeAJha3/eqZVw+xpGdCiCcJg4yHFUQGrG5i7F6giCZ9BsykCV4LT+AKybGG3n8hxO
         NzhsW4pvnH3TvGJ7KtsQ5PUW8zZS1WXT4Wtlyr1DYPXL3Kw974EQEqluKRf1SjGExtTG
         ZcwmdBQQ8bgswwbCjp4hNnzBQY3Lutvh6PzTsOGFEElM2d5zOmNxKIWkicbjKIgU7lj4
         TduA==
X-Gm-Message-State: AOJu0YwE10he4nIT6iXOhqIp5Y5xaFrmOwRFdvWMUD14aI59rjWmofff
	N86ATqVdJBlM8uOIlXcbiPB5cFh7kSLnCt9Em1s1HB+h3DOW4IdqxWU5
X-Gm-Gg: AeBDieu8jxb6lgdXXZb+fIxSvJSxsZRPFYb7yNfT4ChbwVyfciDeKsSS9wgs8fsnFLV
	g7ovDJ+nSbEC2T9ogyse/CiZZf0+XvCSvtQpRVxL0Emq310Z+Ras82nf4cdk3BkPk1ZZaOKoJyY
	ZNOLNAfBsch8d+tQ9rm3y6DgeECvr33TXZ7De5GbzP5vE16YlAycZNHscEFYohoQH0P9aHI+CKl
	GZu1HRwfhrJeqIRHq8ODE6YyhDevxQIvv+uPjmmcib8Vea8syG1U3nO3o/JxBQ1yViPWcCaEr5Q
	gMhblbpZhbhCmvOwEKs8U7uYNDz+f8/aYVVnA2ma9lTVNbrfpo/N9kxta3NnmAMJiJoGQkhkAOB
	oFYlvlrMBzyGdyv/xUoemC2HwrnXZQXlVVuVKkGVfsqkMaBFXhZBRCpyI5qY7gsNF6PXlnRHdNK
	DM4kUL642yi6fp+pMlQ4aJJkH6CAaKVHgN658=
X-Received: by 2002:a53:dd05:0:b0:651:c047:f09c with SMTP id 956f58d0204a3-653109f9da6mr6019141d50.39.1776583293157;
        Sun, 19 Apr 2026 00:21:33 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314ed1150sm3341152d50.18.2026.04.19.00.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 00:21:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 02/11] staging: rtl8723bs: remove wrapper rtw_hal_read_chip_info()
Date: Sun, 19 Apr 2026 10:19:28 +0300
Message-ID: <20260419072034.19824-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260419072034.19824-1-nikolayof23@gmail.com>
References: <20260419072034.19824-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_hal_read_chip_info() function, as it's just a wrapper
that calls ReadAdapterInfo8723BS() directly. Replace all its calls to
the ReadAdapterInfo8723BS() function. This will remove an extra level of
abstraction and simplify the code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 1 -
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 3 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 491208431396..da250179fc92 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -7,11 +7,6 @@
 #include <drv_types.h>
 #include <hal_data.h>
 
-void rtw_hal_read_chip_info(struct adapter *padapter)
-{
-	ReadAdapterInfo8723BS(padapter);
-}
-
 void rtw_hal_read_chip_version(struct adapter *padapter)
 {
 	rtl8723b_read_chip_version(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7629cef95b06..8f5f2c63fc10 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -195,7 +195,6 @@ void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 
 void rtw_hal_set_hwreg_with_buf(struct adapter *padapter, u8 variable, u8 *pbuf, int len);
 
-void rtw_hal_read_chip_info(struct adapter *padapter);
 void rtw_hal_read_chip_version(struct adapter *padapter);
 
 u8 rtw_hal_get_def_var(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index f733692784bb..98eff17be9b6 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -271,7 +271,7 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	hal_btcoex_Initialize((void *)padapter);
 
 	/* 3 6. read efuse/eeprom data */
-	rtw_hal_read_chip_info(padapter);
+	ReadAdapterInfo8723BS(padapter);
 
 	/* 3 7. init driver common data */
 	if (rtw_init_drv_sw(padapter) == _FAIL)
-- 
2.53.0

