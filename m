Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C362947DD64
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119830; cv=none; b=K/yomF412QQII3waRVb+NjpHEfuUUSpTtOqGaSLINikOX6GFco1w5Q4tLMGwUxDv6GZJJHCAp4hYbmQUhuQGPiBt45BagCRiZpqQDv4lIuQ4X84dSkBAtktzOLcjdqK/lBxJ5af2tTIH5U4RxjksTlQ4dg8hsUlaszekm1B02B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119830; c=relaxed/simple;
	bh=NOu+QKY6jsX2LnO+iETScrif+QOXGjEILuQoLxRWFUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u8mJag2cN7OND4+Y0MjNcDpRh/Ftxnke5nQULX20j0iMX8y/N5efGzIeDNB8IM5H1aogVfInt7bx8MKwNFhH1FoJLgH6afFmAF3BDYs3UlMhyo0ujRN5gFHTgdXOS1f09IUG9ofZLGJujkordUK9kpeX2VRrV+H0CWcb63UzJzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY0Bmcmx; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY0Bmcmx"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015b2d792so6326818e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119825; x=1784724625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZEnR8SqaeKZjrKQV+NuifoqLhEKS4MdSPiq8mhVLsXU=;
        b=VY0BmcmxFdSyNLXnWDLecEIdlBDzq+osIACkFDv5AvCCeGibFircjKJjDzJY1Z8uzj
         ms4c8mcr7SZhPE4f7cd/1815GRQ622t28VnpzI89GXSayyv8S0ktzpk1MMCEtciWnXtK
         WwlX1cV0F4s4dg09r8NSbrai/1ES8oZmdVMb5R1LWTvm05Ah5ZsJQXN5AACyvU50Jo+I
         GQNvHmCywjNZlnuXjor2wbX5MvsQbXOMKVydVaETGl7hwBgcNVVJJ0aqGzPOZpSBeF7v
         ORnppkamDuLRGO+eVeHDYwpYKWRh7sFxV/m5SNajaXtrBTFp1xDUaRx+6j5tIxPWzGFg
         5LGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119825; x=1784724625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZEnR8SqaeKZjrKQV+NuifoqLhEKS4MdSPiq8mhVLsXU=;
        b=Is+zgUOGtrw6Z0BT+Jd7mGUaIdE3pqCz85qIIXkLilSjEAZzuL9RVbJeFOT6pzhKKL
         QMFignPHtpuyQwv7f9rL3TN6xFIerjeur2qjStY5ft7CdP/Bdbk7DAZ1S+u/6SVEu11Q
         R3Z1jhgai1SepWTIsG+0HNsuxgDwUMep2lYzoi729WWRcSzJ+1n8avKCbzRPAGlIEm5R
         mE+Nbn5dVznfr3ZOy+LWEKzsl9yqiEGHtdCRX2uznjYOHYwAxknew25Gbz2GDnMeXRwR
         mIlzgY1UZtGoLAWFOoWjcvxqkxl5HCjA932/NWhGbNARUlmd5ucuIyB+n/STQKjx3oRJ
         bCug==
X-Gm-Message-State: AOJu0YyOWS36C9epDFRm2E8W6m/PVUPW/YNHL9PFc+kfVebLXLWKAmw1
	+M9U+H1jVr7g/Gr+0A95fGejKU+peYSO8mTg2kIK2y/3UpmokPmkAZOc
X-Gm-Gg: AfdE7cm7fpHzzoa52eie2lKFrRYYZiOsUefZt+lJVO76Biu7aeokLKrcPXshVus/FZb
	yCQ9WPZQt4qnUI1aQbpmdVSE2qqehLNliMf0639DT1hoklMxCQOV752b1RqYX9Zeo3KRcpK7MEW
	VmvtEaDMwyrV1yCw0kJs+5eV0vNMJk+MRXsg7WYpvlk7axEJMZnIYTOkeDgDTDkJaUdXOuyBpY3
	3rmiIC7BAJesjkMuhwR4vw5Rj22IVmXqdSDwFjvdj3dhE3/5kaM/XRoV6LfGSzk8BlWNvtJA1CE
	5cPxtN1V6P0ufdt2O8tNWQkBqUgbHysmPGCoOTbJQQjdChVq1kBiWzgu3Di96gprDg6OP08n1Kc
	cwFbfYL95ETvZhTBIIjU2ar4k0E45Obh+/YhqGm7kQi+fMv1MuyzQPSuW9rPh7rj/R0cHRffBwY
	76Mt5k6k6sNewG8tY2le3JQuK+LLgrBEncc5IcC1hBd6B1Z56N92sLTVvtYbrwOCjv/RMHlJEP/
	rpyC4UTCnwTTg==
X-Received: by 2002:a05:6512:3414:b0:5ae:bf95:38e7 with SMTP id 2adb3069b0e04-5b159b6abddmr1397925e87.10.1784119824588;
        Wed, 15 Jul 2026 05:50:24 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:24 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 12/61] staging: rtl8723bs: replace custom CMAC with kernel Crypto API helper
Date: Wed, 15 Jul 2026 19:47:40 +0700
Message-ID: <20260715124829.90290-13-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce rtw_bip_cmac() as a wrapper around the kernel Crypto API
"cmac(aes)" to handle 802.11w BIP MIC calculation. Convert both callers
to use this new helper function. This allows complete removal of the
custom, duplicated implementations of omac1_aes_128() and
omac1_aes_128_vector(), along with the now unused gf_mulx() helper,
significantly cleaning up the driver code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 114 +++---------------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |   3 +-
 .../staging/rtl8723bs/include/rtw_security.h  |   2 +-
 3 files changed, 18 insertions(+), 101 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 0cfd7734c..a4a4f0e6d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -9,6 +9,7 @@
 #include <drv_types.h>
 #include <crypto/aes.h>
 #include <crypto/utils.h>
+#include <crypto/hash.h>
 
 static const char * const _security_type_str[] = {
 	"N/A",
@@ -1315,7 +1316,8 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
+		if (rtw_bip_cmac(
+		padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
@@ -1335,109 +1337,23 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	return res;
 }
 
-static void gf_mulx(u8 *pad)
-{
-	int i, carry;
-
-	carry = pad[0] & 0x80;
-	for (i = 0; i < AES_BLOCK_SIZE - 1; i++)
-		pad[i] = (pad[i] << 1) | (pad[i + 1] >> 7);
 
-	pad[AES_BLOCK_SIZE - 1] <<= 1;
-	if (carry)
-		pad[AES_BLOCK_SIZE - 1] ^= 0x87;
-}
-
-/**
- * omac1_aes_128_vector - One-Key CBC MAC (OMAC1) hash with AES-128
- * @key: 128-bit key for the hash operation
- * @num_elem: Number of elements in the data vector
- * @addr: Pointers to the data areas
- * @len: Lengths of the data blocks
- * @mac: Buffer for MAC (128 bits, i.e., 16 bytes)
- * Returns: 0 on success, -1 on failure
- *
- * This is a mode for using block cipher (AES in this case) for authentication.
- * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
- * (SP) 800-38B.
- */
-static int omac1_aes_128_vector(u8 *key, size_t num_elem,
-				u8 *addr[], size_t *len, u8 *mac)
+int rtw_bip_cmac(u8 *key, u8 *data, size_t data_len, u8 *mac)
 {
-	struct aes_enckey aes;
-	u8 cbc[AES_BLOCK_SIZE], pad[AES_BLOCK_SIZE];
-	u8 *pos, *end;
-	size_t i, e, left, total_len;
-	int ret;
-
-	ret = aes_prepareenckey(&aes, key, 16);
-	if (ret)
-		return -1;
-	memset(cbc, 0, AES_BLOCK_SIZE);
-
-	total_len = 0;
-	for (e = 0; e < num_elem; e++)
-		total_len += len[e];
-	left = total_len;
-
-	e = 0;
-	pos = addr[0];
-	end = pos + len[0];
-
-	while (left >= AES_BLOCK_SIZE) {
-		for (i = 0; i < AES_BLOCK_SIZE; i++) {
-			cbc[i] ^= *pos++;
-			if (pos >= end) {
-				e++;
-				pos = addr[e];
-				end = pos + len[e];
-			}
-		}
-		if (left > AES_BLOCK_SIZE)
-			aes_encrypt(&aes, cbc, cbc);
-		left -= AES_BLOCK_SIZE;
-	}
+	struct crypto_shash *tfm;
+	int err;
 
-	memset(pad, 0, AES_BLOCK_SIZE);
-	aes_encrypt(&aes, pad, pad);
-	gf_mulx(pad);
-
-	if (left || total_len == 0) {
-		for (i = 0; i < left; i++) {
-			cbc[i] ^= *pos++;
-			if (pos >= end) {
-				e++;
-				pos = addr[e];
-				end = pos + len[e];
-			}
-		}
-		cbc[left] ^= 0x80;
-		gf_mulx(pad);
-	}
+	tfm = crypto_alloc_shash("cmac(aes)", 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
 
-	for (i = 0; i < AES_BLOCK_SIZE; i++)
-		pad[i] ^= cbc[i];
-	aes_encrypt(&aes, pad, mac);
-	memzero_explicit(&aes, sizeof(aes));
-	return 0;
-}
+	err = crypto_shash_setkey(tfm, key, 16);
+	if (err) {
+		crypto_free_shash(tfm);
+		return err;
+	}
 
-/**
- * omac1_aes_128 - One-Key CBC MAC (OMAC1) hash with AES-128 (aka AES-CMAC)
- * @key: 128-bit key for the hash operation
- * @data: Data buffer for which a MAC is determined
- * @data_len: Length of data buffer in bytes
- * @mac: Buffer for MAC (128 bits, i.e., 16 bytes)
- * Returns: 0 on success, -1 on failure
- *
- * This is a mode for using block cipher (AES in this case) for authentication.
- * OMAC1 was standardized with the name CMAC by NIST in a Special Publication
- * (SP) 800-38B.
- * modify for CONFIG_IEEE80211W
- */
-int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac)
-{
-	return omac1_aes_128_vector(key, 1, &data, &data_len, mac);
+	return crypto_shash_tfm_digest(tfm, data, data_len, mac);
 }
 
 /* Restore HW wep key setting according to key_mask */
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0d..fdda407c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1283,7 +1283,8 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		/* copy management fram body */
 		memcpy(BIP_AAD + BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
+		if (rtw_bip_cmac(
+		padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, BIP_AAD_SIZE + frame_body_len, mic))
 			goto xmitframe_coalesce_fail;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 32f6d3a5e..22eec2215 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -243,7 +243,7 @@ struct mic_data {
  * public domain by Tom St Denis.
  */
 
-int omac1_aes_128(u8 *key, u8 *data, size_t data_len, u8 *mac);
+int rtw_bip_cmac(u8 *key, u8 *data, size_t data_len, u8 *mac);
 void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key);
 void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b);
 void rtw_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nBytes);
-- 
2.55.0

