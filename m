Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2040671
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 13:13:04 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id l7so1714726edb.1
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JMYW12LTBZO0IZcSGTCQhCiS4Zcg5+/BzYNJVHEcYMM=;
        b=OcjDrj83vTKIVAy3nKDoO5yJN2qKlxPBgOdZI7aZZT2YRLeg7t6BkpCrkmg15lDwcL
         //WTvN6tiND6F5RCLbORHQTLU9x3hw6rkgAxlYcAwiL2GpSL6IRIjFUTdKSqk20YMFHJ
         ysw3EJgBMGeURdhzgGdxXZsiIxoCJedAj583G7WutsCZl0us/RhY7dWCakH8jWa1JW59
         V/B+77BywC4F+yn+JKCXmyvn2qQ4TYVzhz9HzqD9M3i21Bsrpndb3rWLdSPEMo7WjaHW
         o2rVauACU/lhHKtXPfRYQPSkykqRm+nvEqvhXdxdmOHnBKMIqlO8u16LKO60245QpcGO
         lzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JMYW12LTBZO0IZcSGTCQhCiS4Zcg5+/BzYNJVHEcYMM=;
        b=k99AU+gBa6/+Hfu1Meg0CYIRHRbS5NC7LsibdTUzO3/7t3xy1R2OzbiElV7VVm5EcF
         4mOjpklkzfA43TjMoFUjZSfa9siPdAzTlFVhjCjFRXPVR4bknU05QBK+9eqDjNPC725p
         X2xoOu9q+MeoCiqfBSiabCr2saSDqSm0uFic4pC6ltWtajCcpro20r1NRpWZOEOBCopI
         I/juY6WYd4X0m0Lm6Dx7diUrUpvLMBYrZqnlzNjcVStZC9NZxWM1xDb8y1r/sLfp//4b
         D1oRjNAVUTHl4nG/akUbRnPCmIRPzuxqRYqIw6s5gJsuOHJwzHD8SnJ8YWJ2YkwsNv/R
         lCfg==
X-Gm-Message-State: AOAM5334ZuTMBGZajxVd0HP6Xkvhvi6d+Ef/16JpxUvqnscCiyzpXEww
	3GVAaaf1Y+BFEkf0vKsd7WQ=
X-Google-Smtp-Source: ABdhPJyWOukYrdjcvmajebLAxFn3gv9okn+zFuOZG9Do4LJcMZDEydtuvIrszRl1iC2kA51Fp02rxA==
X-Received: by 2002:a05:6402:50c6:: with SMTP id h6mr9919699edb.327.1620133982619;
        Tue, 04 May 2021 06:13:02 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id h23sm1359628ejx.90.2021.05.04.06.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:13:02 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines
Date: Tue,  4 May 2021 15:12:56 +0200
Message-Id: <8c1c680a6498045746ca579e4caa3c87d13b3b49.1620133620.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620133620.git.fabioaiuto83@gmail.com>
References: <cover.1620133620.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace private aes encryption subroutines with
public in-kernel ones in OMAC1 computation routines.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 113 ++----------------
 .../staging/rtl8723bs/include/rtw_security.h  |   1 +
 2 files changed, 9 insertions(+), 105 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cb603aa4ee6..4f82dc9a3642 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1931,99 +1931,6 @@ const u8 rcons[] = {
 	/* for 128-bit blocks, Rijndael never uses more than 10 rcon values */
 };
 
-/*
- * Expand the cipher key into the encryption key schedule.
- *
- * @return	the number of rounds for the given cipher key size.
- */
-static void rijndaelKeySetupEnc(u32 rk[/*44*/], const u8 cipherKey[])
-{
-	int i;
-	u32 temp;
-
-	rk[0] = GETU32(cipherKey);
-	rk[1] = GETU32(cipherKey +  4);
-	rk[2] = GETU32(cipherKey +  8);
-	rk[3] = GETU32(cipherKey + 12);
-	for (i = 0; i < 10; i++) {
-		temp  = rk[3];
-		rk[4] = rk[0] ^
-			TE421(temp) ^ TE432(temp) ^ TE443(temp) ^ TE414(temp) ^
-			RCON(i);
-		rk[5] = rk[1] ^ rk[4];
-		rk[6] = rk[2] ^ rk[5];
-		rk[7] = rk[3] ^ rk[6];
-		rk += 4;
-	}
-}
-
-static void rijndaelEncrypt(u32 rk[/*44*/], u8 pt[16], u8 ct[16])
-{
-	u32 s0, s1, s2, s3, t0, t1, t2, t3;
-	int Nr = 10;
-	int r;
-
-	/*
-	 * map byte array block to cipher state
-	 * and add initial round key:
-	 */
-	s0 = GETU32(pt) ^ rk[0];
-	s1 = GETU32(pt +  4) ^ rk[1];
-	s2 = GETU32(pt +  8) ^ rk[2];
-	s3 = GETU32(pt + 12) ^ rk[3];
-
-#define ROUND(i, d, s) \
-	do { \
-		d##0 = TE0(s##0) ^ TE1(s##1) ^ TE2(s##2) ^ TE3(s##3) ^ rk[4 * i]; \
-		d##1 = TE0(s##1) ^ TE1(s##2) ^ TE2(s##3) ^ TE3(s##0) ^ rk[4 * i + 1]; \
-		d##2 = TE0(s##2) ^ TE1(s##3) ^ TE2(s##0) ^ TE3(s##1) ^ rk[4 * i + 2]; \
-		d##3 = TE0(s##3) ^ TE1(s##0) ^ TE2(s##1) ^ TE3(s##2) ^ rk[4 * i + 3]; \
-	} while (0)
-
-	/* Nr - 1 full rounds: */
-	r = Nr >> 1;
-	for (;;) {
-		ROUND(1, t, s);
-		rk += 8;
-		if (--r == 0)
-			break;
-		ROUND(0, s, t);
-	}
-
-#undef ROUND
-
-	/*
-	 * apply last round and
-	 * map cipher state to byte array block:
-	 */
-	s0 = TE41(t0) ^ TE42(t1) ^ TE43(t2) ^ TE44(t3) ^ rk[0];
-	PUTU32(ct, s0);
-	s1 = TE41(t1) ^ TE42(t2) ^ TE43(t3) ^ TE44(t0) ^ rk[1];
-	PUTU32(ct +  4, s1);
-	s2 = TE41(t2) ^ TE42(t3) ^ TE43(t0) ^ TE44(t1) ^ rk[2];
-	PUTU32(ct +  8, s2);
-	s3 = TE41(t3) ^ TE42(t0) ^ TE43(t1) ^ TE44(t2) ^ rk[3];
-	PUTU32(ct + 12, s3);
-}
-
-static void *aes_encrypt_init(u8 *key, size_t len)
-{
-	u32 *rk;
-
-	if (len != 16)
-		return NULL;
-	rk = rtw_malloc(AES_PRIV_SIZE);
-	if (rk == NULL)
-		return NULL;
-	rijndaelKeySetupEnc(rk, key);
-	return rk;
-}
-
-static void aes_128_encrypt(void *ctx, u8 *plain, u8 *crypt)
-{
-	rijndaelEncrypt(ctx, plain, crypt);
-}
-
 static void gf_mulx(u8 *pad)
 {
 	int i, carry;
@@ -2037,11 +1944,6 @@ static void gf_mulx(u8 *pad)
 		pad[AES_BLOCK_SIZE - 1] ^= 0x87;
 }
 
-static void aes_encrypt_deinit(void *ctx)
-{
-	kfree_sensitive(ctx);
-}
-
 /**
  * omac1_aes_128_vector - One-Key CBC MAC (OMAC1) hash with AES-128
  * @key: 128-bit key for the hash operation
@@ -2058,13 +1960,14 @@ static void aes_encrypt_deinit(void *ctx)
 static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 				u8 *addr[], size_t *len, u8 *mac)
 {
-	void *ctx;
+	struct crypto_aes_ctx ctx;
 	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
 	u8 *pos, *end;
 	size_t i, e, left, total_len;
+	int ret;
 
-	ctx = aes_encrypt_init(key, 16);
-	if (ctx == NULL)
+	ret = aes_expandkey(&ctx, key, 16);
+	if (ret)
 		return -1;
 	memset(cbc, 0, AES_BLOCK_SIZE);
 
@@ -2087,12 +1990,12 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 			}
 		}
 		if (left > AES_BLOCK_SIZE)
-			aes_128_encrypt(ctx, cbc, cbc);
+			aes_encrypt(&ctx, cbc, cbc);
 		left -= AES_BLOCK_SIZE;
 	}
 
 	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_128_encrypt(ctx, pad, pad);
+	aes_encrypt(&ctx, pad, pad);
 	gf_mulx(pad);
 
 	if (left || total_len == 0) {
@@ -2110,8 +2013,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 
 	for (i = 0; i < AES_BLOCK_SIZE; i++)
 		pad[i] ^= cbc[i];
-	aes_128_encrypt(ctx, pad, mac);
-	aes_encrypt_deinit(ctx);
+	aes_encrypt(&ctx, pad, mac);
+	memzero_explicit(&ctx, sizeof(ctx));
 	return 0;
 }
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 5c787e999aab..032e520317e7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -7,6 +7,7 @@
 #ifndef __RTW_SECURITY_H_
 #define __RTW_SECURITY_H_
 
+#include <crypto/aes.h>
 
 #define _NO_PRIVACY_		0x0
 #define _WEP40_				0x1
-- 
2.20.1

