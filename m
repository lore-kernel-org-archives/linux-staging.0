Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40572EC096
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 07:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769759487; cv=none; b=tlrJj19PLkv/hfWJvVQud4cLzI4rh1MSKJF/JXXSGDpf5GHb/n5XtV5os9PJvsicrg4oHxz4s0j6t750ok24lTPdk6b1QF2UOVnQ/c2a2K8aawsKSfHZejSsa9jAMMK9vWPSUYg4oY05u6VkQOu/Clf4VQVQx2jv30Xf/Xkr7Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769759487; c=relaxed/simple;
	bh=OtqpskiRHinTNYIo1so3B49+jdqv4EaJ7ulxmT+E84A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o+RDx1VheiNg64Qiil8+SGdRl+3FOxZKVU8vI6KfEb/a+Kafg41DPyZmqIIXHt5Hb6j205t51xUUPowtEuhImdkF2Qq18w9P73gMOf8+WBR3iG9Nf+0v4Q45nxiO2mJVYdT8qeFDufrXhK9uOrksLGG2FOt0Ur34NScEyq7b1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cynpv76R; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cynpv76R"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso1057595b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 23:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769759486; x=1770364286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdjfaAMe7i3Y77xkWmVmlbZ6HZaBYnYgt+qo5FS/RlY=;
        b=Cynpv76R5ZQdke/AAfMFeRqgCD23U3z2nf25chMmBXDyGuLTAe689OftFFrkfpCrPT
         t7oPnMH6a0i0CO3maX3VTAEWDrLHORBcMMb3dbgQlCc9q8RS6QLIvnC5CqEgg+uaXeUI
         dr1jvEEGX7KhnBraf3WsFZXS+JuwcSIFYzQgtLHgL1ypbsOuqwCju5XlB+x4aODzl+OL
         2W2kBeVWZdal+3RdyBtBqbCOdBS/LoHThdq6pnIpciCeuIwvkotgwXbZmlBfHP1c6M+7
         eajUAXRiTZcJnC6z+1l1qN0toFQjFQ7zv/p/7nzT6vrgJHAPNVe8kpJ+bufCdhp6aCOn
         XV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759486; x=1770364286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdjfaAMe7i3Y77xkWmVmlbZ6HZaBYnYgt+qo5FS/RlY=;
        b=iUdHv8Su69CdnfdkMlvhwdC/ST2nFSGB4WxvpZ1m4oc+l9+d5Pz5JvvVC1xpAddqsZ
         mO8u6QN0SGfz4JJXWOt2Zg3TyEJ+qGz9B2fv08tAmoqBnVZkVFFkT7mYDJCnI1r/0Kpp
         O+nj+p1QNeLvxUoABm2MS6K1VxJq8DeBTr0g9X+BWM6Xb5FH3Zypcj/JcUusrnI/uZCH
         GQuQQfiY0mcpVx0S75x3AhSqoxRGIASA/JB+4GvL2eNOaYLLXX1DmzlAUX1ovPmUzKhU
         L8n4os8e/lMO8OI3+1302l2Hw4fE7Y9O4aZOZj6PxhE8/KOOkMzGfLfZKOZh7L9XXsSY
         MGBg==
X-Forwarded-Encrypted: i=1; AJvYcCUrRxxrFnOtrsM0b4PEOXS2nhqcgYnpDtV5sqf3+FTTzyzpsSyTwdN6rp30UdrKHl2tUja8OI7PXKBl6sDx@lists.linux.dev
X-Gm-Message-State: AOJu0YzkSTFnUXOpbWaTGzfJsw1KdC1D9F5QJ3WKJnQ9vHpqSXvWaJAr
	cPJ2KqEgOPe1ccFezNIF8iT+/UUO0oTWzn1l4XlhKwVVEjn4ynl++WZZ+jSAW4iX
X-Gm-Gg: AZuq6aLvM0BRBmGLY2ffX7oHuF3VAOm/g7uSdv6zJHJTH6oHmHrCwt4YAAoU0/9X+ut
	f+9uuTk0OpcNmF/NmW222TDj0F6BNd+BgxFd370KlqjA7E3C9Sj+sR7UzHkHnWKnJ6hzaZTSEbe
	UNEMrdqdZkl36tT/iaiklalih1fxaYb/VNw9PdAAufP2HKkLJpMxs/PzpntuC7Qyjv3Rhp7+cjB
	BZ5p9HGf+1rTdE+10Xw9blR4oqF+SBbcGQvI+mxlZ3+NZDGsAJsmq4SpRfgV70Fg/1sHLjLeKhV
	+eX0k8hq5r4ZKJIAGfQxFecrubNKtgWKoUxyZsApCl+oGDiAUcRYtFSHIuXNEaXj4gHs+8KCp1s
	X2tVDvKIoR80KOZuQQ+mW4aVQ7M7tQKuHLXS6O4fkCEWtK4D4oAsB6k4QtWVyOjl3hrXxKhBrgd
	UWvrTyVDpKCEO0nqQHq3H4oOddjFSEcg==
X-Received: by 2002:a05:6a00:ad5:b0:81f:4dc7:d44 with SMTP id d2e1a72fcca58-823aa94032fmr2091381b3a.66.1769759485812;
        Thu, 29 Jan 2026 23:51:25 -0800 (PST)
Received: from debian.ari ([152.58.179.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bff93esm8679447b3a.41.2026.01.29.23.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 23:51:25 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Archit Anant <architanant5@gmail.com>
Subject: [PATCH] staging: rtl8723bs: use unaligned access macros in rtw_security.c
Date: Fri, 30 Jan 2026 13:21:13 +0530
Message-Id: <20260130075113.34666-1-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver defines custom functions secmicgetuint32() and
secmicputuint32() to handle little-endian byte-to-integer conversion.
This is redundant as the kernel provides optimized standard macros for
this purpose in <linux/unaligned.h>.

Replace the custom implementations with get_unaligned_le32() and
put_unaligned_le32() and delete the now-unused local functions.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2f941ffbd465..fd63fce6f12d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <linux/crc32.h>
+#include <linux/unaligned.h>
 #include <drv_types.h>
 #include <crypto/aes.h>
 #include <crypto/utils.h>
@@ -128,29 +129,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 /* 3		=====TKIP related ===== */
 
-static u32 secmicgetuint32(u8 *p)
-/*  Convert from Byte[] to Us3232 in a portable way */
-{
-	s32 i;
-	u32 res = 0;
-
-	for (i = 0; i < 4; i++)
-		res |= ((u32)(*p++)) << (8 * i);
-
-	return res;
-}
-
-static void secmicputuint32(u8 *p, u32 val)
-/*  Convert from Us3232 to Byte[] in a portable way */
-{
-	long i;
-
-	for (i = 0; i < 4; i++) {
-		*p++ = (u8) (val & 0xff);
-		val >>= 8;
-	}
-}
-
 static void secmicclear(struct mic_data *pmicdata)
 {
 /*  Reset the state to the empty message. */
@@ -163,8 +141,8 @@ static void secmicclear(struct mic_data *pmicdata)
 void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key)
 {
 	/*  Set the key */
-	pmicdata->K0 = secmicgetuint32(key);
-	pmicdata->K1 = secmicgetuint32(key + 4);
+	pmicdata->K0 = get_unaligned_le32(key);
+	pmicdata->K1 = get_unaligned_le32(key + 4);
 	/*  and reset the message */
 	secmicclear(pmicdata);
 }
@@ -212,8 +190,8 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	while (pmicdata->nBytesInM != 0)
 		rtw_secmicappendbyte(pmicdata, 0);
 	/*  The appendByte function has already computed the result. */
-	secmicputuint32(dst, pmicdata->L);
-	secmicputuint32(dst + 4, pmicdata->R);
+	put_unaligned_le32(pmicdata->L, dst);
+	put_unaligned_le32(pmicdata->R, dst + 4);
 	/*  Reset to the empty message. */
 	secmicclear(pmicdata);
 }
-- 
2.39.5

