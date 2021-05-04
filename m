Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DF472
	for <linux-staging@lists.linux.dev>; Tue,  4 May 2021 14:51:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id h10so10725874edt.13
        for <linux-staging@lists.linux.dev>; Tue, 04 May 2021 07:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aobsat+LyL4XDzGNUuAQqRzK0JPmwBTZGHjEuui96xQ=;
        b=OcmUIStarrQImb/vGoH30Ngt2ZF2Olq7ATz4uAkEJ5qAgW3BYooMhnhFUAcO1LQFxC
         90XrJ/U89ssAYdhD3czetk83g4WDoR8uJMeIbznBUoQySrTQjku8CSdrN2C9TFPLCPyU
         fJ4AS2It+N92+YR6BbEdyV/m69IaSg3YwEjtZddVlS1UbJdvgRSm9Qfq29O5R8Wh/1kC
         89DdXO02fS86Vsqbln99zreVW48qLzU1NbPnVr14tulGCYdDexyJXGrv1TZnB8edkhkY
         AWn4xH43DyvBwL+gH03efiJW3Xlsh9rqF+t32neqTZ8BfjReLMG//GAtWTptLa7OMt33
         YfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aobsat+LyL4XDzGNUuAQqRzK0JPmwBTZGHjEuui96xQ=;
        b=P5QqR+qgrPPge+sl6Bb3xZTvzGR8xIQrznmYkHMQpgz683PMq0msEgpMw0mRJu/WNc
         qTVdz18sw5zVVJAE+SX2eYrHjyhdZNQN+X8Kj8wHKGNDhmo25YjSz1rmauTA5hXc1T52
         H4q9bNW3HiuZvvhNbeSyop34grzG4Tj1va29ZBvr09pDS03++nR+CFDHkyAR2IQsKv0j
         wIF0ePTa3reg6Lmzkx8a4a4viIpc5dK8nfZxQXdLFMK9T3346BfatwjcVE9zwrGqAaEK
         SK003/f33ZzSYBkE4q+MQZ/8Xjoel4+6d7pMRUZgcraKoayK6dAG+2gkT6V2MYzX2UKs
         XeZw==
X-Gm-Message-State: AOAM533Q6+3SqW5phtXxmN7+hyTgd0c4jNC54DXH6E2JAoVGIjsaJx2k
	Q1k3ue91nzt5RYONZvlSgDc=
X-Google-Smtp-Source: ABdhPJzJci+yBHzxM+voIx3heWPILIqvsthqs6+vWOK5BGMyYGVb+/5yJreoBNEsCiYV+lBl9P9Obg==
X-Received: by 2002:a05:6402:1587:: with SMTP id c7mr26190446edv.181.1620139905664;
        Tue, 04 May 2021 07:51:45 -0700 (PDT)
Received: from agape ([5.171.72.210])
        by smtp.gmail.com with ESMTPSA id bm26sm1527826ejb.82.2021.05.04.07.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:51:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] staging: rtl8723bs: use in-kernel aes encryption in OMAC1 routines
Date: Tue,  4 May 2021 16:51:39 +0200
Message-Id: <11ac26487aab92ded28747c1f0cb42a94183130d.1620139727.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620139727.git.fabioaiuto83@gmail.com>
References: <cover.1620139727.git.fabioaiuto83@gmail.com>
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
 drivers/staging/rtl8723bs/core/rtw_security.c | 114 ++----------------
 1 file changed, 9 insertions(+), 105 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cb603aa4ee6..35f8b39d6fdb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -7,6 +7,7 @@
 #include <linux/crc32poly.h>
 #include <drv_types.h>
 #include <rtw_debug.h>
+#include <crypto/aes.h>
 
 static const char * const _security_type_str[] = {
 	"N/A",
@@ -1931,99 +1932,6 @@ const u8 rcons[] = {
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
@@ -2037,11 +1945,6 @@ static void gf_mulx(u8 *pad)
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
@@ -2058,13 +1961,14 @@ static void aes_encrypt_deinit(void *ctx)
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
 
@@ -2087,12 +1991,12 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
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
@@ -2110,8 +2014,8 @@ static int omac1_aes_128_vector(u8 *key, size_t num_elem,
 
 	for (i = 0; i < AES_BLOCK_SIZE; i++)
 		pad[i] ^= cbc[i];
-	aes_128_encrypt(ctx, pad, mac);
-	aes_encrypt_deinit(ctx);
+	aes_encrypt(&ctx, pad, mac);
+	memzero_explicit(&ctx, sizeof(ctx));
 	return 0;
 }
 
-- 
2.20.1

