Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383307;
	b=JM9lvyT0ck7ygMhOAIAOJrxmsaTOdaBBLrTt1lZlUF5hGMK1Y7lyB7TipArro02v1esI
	 n7nqpBkmNgP4NL9pYy2u66A08ENm6jp3hKp+WOWVATaU/cvH37LTh3MB2vp5X51DauZ+H
	 2jUmxBkthiT/Xc/THwN/GgGTMptozZbu7oQnchHn4uS4LthNNW46qL3/qvhUl1iLN/1R3
	 2szem/cZp/WMZu7Bv8sxIR+Xj8Ujp3vmnGex8vHNdSwQojC9GrscdiSMlCQqDEVug3uxJ
	 V9qSbhXPpFHW48O4LK0HFg0IV+ZRmoOGjdCy/oaWkWGCPI7jim7YjBUcaIsAMHXneUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
	b=e2nC6aw7Rh6ebdCK3mnPfPjLKwz4zsTIHJbUxRCKG3uGcHPufSxd+dYbWW1swGYYOywl
	 skKY2d+GFEEC2sTvdaIdHWoDhSkrSLuT4HgO9uCNEOxdMHDOYP4L4dWx7N4Q1VG2Cksjz
	 dHK/6C05PviBs6q+pP88FjuWLjFJI2MAozEhS8JrhXNmqlIddg4kO6R2BwyM9/PlIz5uP
	 6OuxR+ZnXNOJPkGT+Y807/AzUWOSdQDuGuqAe/rBoNbgm1yrDdOFG9ojNwVbCZ/FXs5Bz
	 0vrnXQkgiYKirkBsWpgXoS6X2jgrPk/qRibzskp/vCmmKAV2PwyXkbvg41yAoPxBdpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ZH/j43WD";
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE120606A327
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 07:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE120606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZH/j43WD
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3adfd5771ccso22799071fa.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 23:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794383305; x=1794988105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
        b=ZH/j43WDfDu72oiNrvueKiW8j2VsNK1S80I2wm0IENldr5Y0PFj2bpnt457WBMFI9J
         fVHe+tUkqtv2N7sxzDV9ivT/TijT0iE7jp4SjvgM85ARK14pPRHtGDJwMtZxTZ9EimqR
         RNbWdlSi454l8GcMOTC9hhEVSYvi/n2lCHp2aI6JMeFo1pkPX78lBYYURnxNDbPxwPKg
         CIz0eRx7XtWnp3XXrAOamYJaCfWfpXM8iqM6SvSm5cJsIdFdp+PmntHN1bgDr7b21+9Z
         qG9hAhpZVUtH6UBYGWqbKfMDmtR92FYQ922ehQ/BRUnak2Gca1TjcqCKs1G622NBQ4VU
         nurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383305; x=1794988105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XEQ6ckoipbYo+1CPYyccgE+eWB58x58i5+B3lAE+Aw=;
        b=UGDuYTwosMp6pYUHKPWKN1pIxzYFUz6D0WTo83ltdVhdNiJ3Kr/stW+imc1DgigKDe
         JGyRZ9G9lb4s47ToQm268AEU5myJyExs+KOk5L6yv4tQ/i6+peRZqqLbUm9ZvLIm+0Ct
         mObCPq6y7c2OteFoyXEkD42TqJG2h/A/pCmuUhM7Ss/A+wZVb0DWKHTfKnbK5iByBFoy
         MGk/Cz18n/csibQxHZg+FFzPgCWwT8ztU3wANhVTPotCIJlyJMKBkQQCayAmKHYpXzT0
         RKOI5yQP5lAE8RqCRJpsnoNL0wzLsW3o/l7gv8gDhFoYNVHJV0edGJ0QWnfwVaK/aU/5
         IJyQ==
X-Forwarded-Encrypted: i=1; AL+hErHxg9USGw4NQAIK+OqPj+3AqCfp7tA+ojZN+ebG7u50cHpMmMl5zkMzNMVGvgMJAR5g9o5Bp+qRKKy11Cd9@lists.linux.dev
X-Gm-Message-State: APuU4Z/jh4bbqWAQSR6j7Q87pytBuDwwBfemPCZJktX0ZGPW6jCSgK/6
	vNmRBs0gmfMVzZ4m/444LclyqOrhtVDVgwI7J9bT5NTNqaVvn29+PUmQ
X-Gm-Gg: AYBFou05rjDEQ8U2UMzLgT3mITqIp+4PlxxkzhzjDOmaFdvJ3/UKm5wUhLBqb25d+yM
	N/HAkC5Sf/9CC8wZyl9iaknI/rpp/oAmtoEaLfi6n0dreWXQ+80sVmBOPbqWx1D/9LzyTObrhka
	A+AMHYs4bupMdT45Jv3lbBsJ0FNQCB1ppFA+zTGUQgbfWaQvhrgyxqlQ2Zz6Abx4X+Kw7Z8kcht
	Qo2NG/i3yPD/KCMmUJYsDZk6RCRbow7DsBL936PsD7tpWF9hG2Dm484swVLWsTXGjwP6THwiEdW
	ML3ggOyQtUdysE6sQHmXl4q4QfafJGxjyBBklOdnX53MKfemJmqOVfP7rTkgECR18g7Ph41EA+v
	eb+XOfBORAnxfszS14XqZVIiDe8P3SVQTdbEFznCYVR9YwjsB3mWzUXgFK1rzLMw53H2iKbov7i
	MOz6USZEqTp9xGCgBtyeXAmfG2ahmW284COMPB3k6cHnZwLGAA6cQutb6DxrtsjfDAJAzLu8+ZQ
	00fkcRPVB0GjlVr4Ga6jhPzxvDs26t90hknT60aRdbuL+RvR6EKeydEX6o+xl5FpUr+SWAPz5G4
	6v2//WVsccT7lHE1ctEWsh3BYO6DxTkNRYMPTppcxsEomC+oR5TmvLoMQXnDTb6J0DKSXSkyS9K
	YTpQAfZaLBQ==
X-Received: by 2002:a05:651c:1592:b0:3aa:ef31:e51e with SMTP id 38308e7fff4ca-3ae1268e13amr2497851fa.19.1794383304669;
        Tue, 10 Nov 2026 23:48:24 -0800 (PST)
Received: from sakairlinux ([5.165.109.20])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0920535dsm9513081fa.6.2026.11.10.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:48:22 -0800 (PST)
From: Svyatoslav Mikhailov <sakairlinux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Mikhailov <sakairlinux@gmail.com>
Subject: [PATCH] staging: sm750fb: rename p_PLL to pll in sm750_format_pll_reg()
Date: Wed, 11 Nov 2026 10:48:16 +0300
Message-ID: <20261111074816.27647-1-sakairlinux@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter p_PLL uses Hungarian notation and uppercase letters,
which does not follow the kernel coding style. Rename it to pll,
matching the naming used in sm750_calc_pll_value().

No functional change intended. Compile-tested on x86_64 with no warnings.

Signed-off-by: Svyatoslav Mikhailov <sakairlinux@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 10 +++++-----
 drivers/staging/sm750fb/ddk750_chip.h |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1d87..6ffd6a2a1b06 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -358,14 +358,14 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 	return ret;
 }
 
-unsigned int sm750_format_pll_reg(struct pll_value *p_PLL)
+unsigned int sm750_format_pll_reg(struct pll_value *pll)
 {
 #ifndef VALIDATION_CHIP
-	unsigned int POD = p_PLL->POD;
+	unsigned int POD = pll->POD;
 #endif
-	unsigned int OD = p_PLL->OD;
-	unsigned int M = p_PLL->M;
-	unsigned int N = p_PLL->N;
+	unsigned int OD = pll->OD;
+	unsigned int M = pll->M;
+	unsigned int N = pll->N;
 
 	/*
 	 * Note that all PLL's have the same format. Here, we just use
diff --git a/drivers/staging/sm750fb/ddk750_chip.h b/drivers/staging/sm750fb/ddk750_chip.h
index 2a13debc179f..685fde67c2b5 100644
--- a/drivers/staging/sm750fb/ddk750_chip.h
+++ b/drivers/staging/sm750fb/ddk750_chip.h
@@ -88,7 +88,7 @@ struct initchip_param {
 enum logical_chip_type sm750_get_chip_type(void);
 void sm750_set_chip_type(unsigned short dev_id, u8 rev_id);
 unsigned int sm750_calc_pll_value(unsigned int request, struct  pll_value *pll);
-unsigned int sm750_format_pll_reg(struct pll_value *p_PLL);
+unsigned int sm750_format_pll_reg(struct pll_value *pll);
 unsigned int ddk750_get_vm_size(void);
 int ddk750_init_hw(struct initchip_param *pinit_param);
 
-- 
2.55.0

