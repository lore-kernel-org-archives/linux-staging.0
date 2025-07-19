Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D9D23DE
	for <linux-staging@lists.linux.dev>; Sat, 19 Jul 2025 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752945846; cv=none; b=Yzo/GoDF4lyo2gr+yNKCDKx4sRm8kW7A5ljPc1H2fhiosTfmzvXvqzo4aMcGSEB3OwOwG27Lvq5KJ/m7L0H9OZPoain2a+DZABtKV6y/hHwiS3TYYP4mt9BU4nhV9PDUY0OzARlsNbFJIDosyfSkjfD1xw47GdiK45w9oiSoqlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752945846; c=relaxed/simple;
	bh=PtMrpX+Xk/a6ve/Ejvcf9V5bcr4/N4StNM8AM/VOp1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j83b4BhLq3RtNQocQv2QdKaA5SXu54Bv3b0budns8DcdAfoz+VCFbcN1+YIxqTgDLRHZDYZHrQhqvVGNlvMCsHyPSTTUYg7QIC/9qx6Dg9noT7icxFmYQDoQmZ11TAb6xi4rzvmOD4q3l0jY9mh796SiunHtCz47D3lDh2hJH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aZDmSWwU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aZDmSWwU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-455b002833bso11635315e9.0
        for <linux-staging@lists.linux.dev>; Sat, 19 Jul 2025 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752945843; x=1753550643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ42d3j2YzR1hZQ1vOvPF7R6vIl0RBTD/EsQbaOFr6Y=;
        b=aZDmSWwU3T96sFuvafAt8Jcb0u2r3A3Ada6ebvFKFpGmqVA7qlzrwgiBKgp3t0BJxG
         DElc843lK/5FMrhCK/82G0ZVUu61cNVqvcLsRSweaDxvkVJtbXKF0VG+vgmH4whkojj9
         V3vBJ7sXbxvfjaw2y5ptyCnadEnvadqpsSo8pXxBsQLRs0QL8PPLK2jzw48d5Gn4l8fW
         Vdbh3fntimFHulxOZUAbbfMYbKYl9dvb31CTuSO5s8dg/bMXhIBTyBYqjwFBtifVOWm4
         MBDdjqv0OodGhX4G4j8R408h+17m3JeHhmeS5DmoZgKp16RgZ2BlJGpozIQDHAFRn6Qo
         Ur5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752945843; x=1753550643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZ42d3j2YzR1hZQ1vOvPF7R6vIl0RBTD/EsQbaOFr6Y=;
        b=BGLUWakaApmx1a1nhCLVJoKKgaPW64pqkInIXnXd+qGAospu03Bccvf1p8O1AemY0Q
         jMn6MYR3Hsc5lhHkmC6OO9/ELy/8MIDbj3ZU4zles455iuJe4UIBkJ09FU6U448Qtxgc
         lefYmizCv7uZi1AGQppCXfgTMM/Mau4vAoi5rJYXAoDsGV77x+EMfahxZVjpF0lIWz/D
         gsXFol117sqswkWP5yqVXkOfuFAsPLwJDneZjAt7dUrfZhM4ZYaVZhROW55Me28YSw9m
         8pjQc2cqv1n2Q9/z7OzN1KbIJ2r3F5L6DJ59N3wQvW2FtwuGyw2y3pomrUt+kXcSGaXK
         2r4w==
X-Forwarded-Encrypted: i=1; AJvYcCUQKcX/3vAA6iD3SUGLG6sT2i8o0WYEy9iO70T9uE/3cKVwU3/ix1wj2jLKzsMNbXC/N7sdnP+fxYNGQW9r@lists.linux.dev
X-Gm-Message-State: AOJu0YzP2TVVvGIJmMynWzATGtjyPSRoeIXjnyZ1IWqHp+11oD4OB1u9
	hREVEgFPiQ18owKXXpq75VuQQ/KHnYZNyY4cga7HDW4ZwMoa4PT9N3V+
X-Gm-Gg: ASbGncvIaXtmueY7Y2WU/YaQc4yovUlQdC4Cp02XBpikJztmPeczKA9F5OVZZt44IOV
	JXFlTbF7RYXraDulsUQQlyVY4fnmi3WRTHhI1G9FuePi4pUqz85a0EWuute2+vZEtW0YjjGoLf0
	pjbapLuu8Kb1bhhMwKiJIcW2di9omLc1EiY3FD5KyqWlL2migr3j3HMHXK9a3KoNrBFr3LUnHeO
	BR17sjbIgsGz//Qf9rmrdoOFAwb6FbkXiXqU9qPe7Nqj+sK0DEgOK1GC8m5b1pWsOjoMm54xNgD
	cVW5FXSyQNKl266SKTp2v5Zf1WkVBu5DpLycuDPJ5REW1cMNEhLU/f/8M0FIL/rODhLdnKjCxy7
	E3EkVbqpnOfREN4hjI5z0
X-Google-Smtp-Source: AGHT+IE2JnIIhllpyVggDREkuc9v6PGBZsMmN30qjqjlVqsMMCNk8+nBTMTtQxiEP/xQA2nQvlNAwA==
X-Received: by 2002:a05:600c:1ca9:b0:456:1ab0:d56d with SMTP id 5b1f17b1804b1-4562e039c45mr123459515e9.7.1752945842214;
        Sat, 19 Jul 2025 10:24:02 -0700 (PDT)
Received: from zephyr ([77.237.185.237])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45626c8e104sm102074745e9.0.2025.07.19.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 10:24:01 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style issues and improve readability
Date: Sat, 19 Jul 2025 20:53:46 +0330
Message-ID: <20250719172346.23573-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes several coding style issues reported by checkpatch.pl,
including:

1. Comment formatting and alignment
2. Clarifying parameter names for better readability
3. Removing excess spaces and unnecessary semicolons

These changes are cosmetic and do not alter functionality.

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h  | 15 +++++++--------
 drivers/staging/rtl8723bs/include/hal_btcoex.h   |  8 ++++----
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 11 ++++++-----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 57bb717327c..640db1e79e7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -26,7 +26,7 @@
  *	1. Read/write packet content.
  *	2. Before write integer to IO.
  *	3. After read integer from IO.
-*/
+ */
 
 /*  */
 /*  Byte Swapping routine. */
@@ -94,7 +94,7 @@
 #define BIT_OFFSET_LEN_MASK_8(__bitoffset, __bitlen) \
 	(BIT_LEN_MASK_8(__bitlen) << (__bitoffset))
 
-/*Description:
+/* Description:
  * Return 4-byte value in host byte ordering from
  * 4-byte pointer in little-endian system.
  */
@@ -105,11 +105,10 @@
 #define LE_P1BYTE_TO_HOST_1BYTE(__pstart) \
 	(EF1BYTE(*((u8 *)(__pstart))))
 
-/*  */
-/* 	Description: */
-/* 		Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to */
-/* 		4-byte value in host byte ordering. */
-/*  */
+/* Description:
+ *	Translate subfield (continuous bits in little-endian) of 4-byte value in litten byte to
+ *	4-byte value in host byte ordering.
+ */
 #define LE_BITS_TO_4BYTE(__pstart, __bitoffset, __bitlen) \
 	(\
 		(LE_P4BYTE_TO_HOST_4BYTE(__pstart) >> (__bitoffset))  & \
@@ -163,7 +162,7 @@
 		(					\
 		LE_BITS_CLEARED_TO_2BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u16)__val) & BIT_LEN_MASK_16(__bitlen)) << (__bitoffset)) \
-		);
+		)
 
 #define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u8 *)(__pstart)) = EF1BYTE			\
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index 525cce3574f..df58b11605f 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -22,7 +22,7 @@ struct bt_coexist {
 
 void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist);
 bool hal_btcoex_IsBtExist(struct adapter *padapter);
-bool hal_btcoex_IsBtDisabled(struct adapter *);
+bool hal_btcoex_IsBtDisabled(struct adapter *padapter);
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
 void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
 
@@ -46,9 +46,9 @@ void hal_btcoex_Handler(struct adapter *padapter);
 s32 hal_btcoex_IsBTCoexCtrlAMPDUSize(struct adapter *padapter);
 bool hal_btcoex_IsBtControlLps(struct adapter *padapter);
 bool hal_btcoex_IsLpsOn(struct adapter *padapter);
-u8 hal_btcoex_RpwmVal(struct adapter *);
-u8 hal_btcoex_LpsVal(struct adapter *);
-u32 hal_btcoex_GetRaMask(struct adapter *);
+u8 hal_btcoex_RpwmVal(struct adapter *padapter);
+u8 hal_btcoex_LpsVal(struct adapter *padapter);
+u32 hal_btcoex_GetRaMask(struct adapter *padapter);
 void hal_btcoex_RecordPwrMode(struct adapter *padapter, u8 *pCmdBuf, u8 cmdLen);
 
 #endif /*  !__HAL_BTCOEX_H__ */
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c..60c3da009a5 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -7,9 +7,9 @@
 #include <drv_types.h>
 
 /*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
@@ -204,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
@@ -226,7 +226,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
 
 	if (cbuf) {
-		cbuf->write = cbuf->read = 0;
+		cbuf->read = 0;
+		cbuf->write = 0;
 		cbuf->size = size;
 	}
 
-- 
2.50.1

