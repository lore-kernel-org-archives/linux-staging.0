Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946CA37F0FC
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239778; cv=none; b=nTfONqvBKQK7IBdMVs3n63JwaLgnKw7nSYWkUGk1et8TWLrsFRYukzuEaUuBJDESOFzLe66XF5m3Ri2eZ6iHPFMk8D5sJ7CZsPO2T3kaWOTNdfNT6sE6axfOzyW92FgIzG34CktXnHFcdnZGMyv2JFUr+shUSB4Y56f6b5ADhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239778; c=relaxed/simple;
	bh=oczvgUagggC2fLtQB8nfpw+mDrzNoqZVGjwF6rzurRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUpN2ox21qInZlmkrznuk9Y3HT6VONrbojMvRW2Mar0iXzWbeo1kaZ0XDa/JzGs+kUl2zXDlgrtj+iTczTl2NoEiBg6uvyX5TutpCyJVQtjlpWhZ6w7BH369TRndestDIEtMgRrvKXvJa/5yFJBxevLoVtCPzONrrNr4dKy37T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZfyYaXj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZfyYaXj"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso72056395e9.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239774; x=1768844574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izNZC0iiIO0S9XPDee36+IZ6Fnp0qoBVwlUwBgrDZz8=;
        b=EZfyYaXjYIvMUpnezT7Nenj55KNuLswRjcLThM77L8iKvSPIDPwd3eq+0zmNAYr6vQ
         zFH0h/MfOCK3Awfqi56O5kHyz1mn2O+P6XaGrVTVNZHHt4gWKzyg4Avps2wpXoHMW89g
         qxGSVRKpt7MNZGOkqIECeQEU8GB9tE/uOJVWaQEB76+On+ufInayJWlSBVmYMGgZ+cbm
         N4Pclk3QbOmaOd4viK3L9chcxC4xohTNde0QGXgOGGofiF79h98n6wfaleAqVH451+Xd
         Jy2BTohnojvxXrYt8mki3w6Jr34Jz8ellypxYH/TxZ2Y5u5JZZdKBKfbIDVskeLZSJTa
         njtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239774; x=1768844574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izNZC0iiIO0S9XPDee36+IZ6Fnp0qoBVwlUwBgrDZz8=;
        b=Xel/IBhCK9Gpnss6z4jicToExrBASD5yv6po1TCbfSk/gOu3WOC01hrPBjnUFCsDJN
         zlVDPDnjnlEz2T6mPJg9Crq5Av+gcjekkzUmIOK6zzS8/L+WchPDwGkTg3vsKzu1VnbG
         YKp2yyWpOCnzNK+3+p+VLQuGyJCWibjFgPRkkT1vURoQ/uyLf1R9cE/4kaODRp1gSISB
         S0O/EoMWJgQEl2g2fyczTGjaXHQbKJX7n6OSv5pb3G3Vvx929EiVKHKNm+GOgzoHivcf
         7J0mWvwmX2GK0fhx0ftYlYLXDdFytT3xd1kg5kDz8LYjgvMC0eUq2K+mTOUwLryqD0X6
         340w==
X-Gm-Message-State: AOJu0YxwwC7gCQAXnFjzbI2mY4Oh2W8lJYM0IBgWFj+t9qaga+unxP4h
	s4/MGXqILhKU1dnvEmF7MbvdNXqAJDzRgK+U6NpbQbIKrfp+CP8yIiY7
X-Gm-Gg: AY/fxX4c71B1cxir27o7iib4Ysz78vNgZpjzW1dCE1UBzWIvsjXrH85Jlwd9iVG2vhJ
	bk7wXqVXluqhWf83bPrEqzOUBT9wF80Ac4cOsHCh+d0KqK9ByGxSCxKottvkmSrN4BpvZpoIqAO
	BUFienfgwrraKECXTjP3HGGuHzGS0fEkbJhAt2ISTlEx+7iVPZDFYEZL1SWBBEp0X4D1UVuGms8
	4KCJFFZRcvOYmmeOp5q6YF23v3qMfApd2Iy0lrZbSWTpWmPTboQDD9KmaY9Cv9l0Wj96kX3a896
	qBIAmvgQujFnkdpRZvK7fUuCdsq56OFsKaO1o1mTJe3YMS9VLT0O/xWItyW+5mTyl/MH7w5In1M
	A8rmd9BeXkXknxUnMp0JQKXA+OBGEMXzqsCcx3WUJfIJ/qvisIZJwk/CgLD5+TmPwkJUEbUhc2/
	XOk0m1Aa73fZTCWBUYfZXW7dX65AKE75S+c5OqmpEIXcWJwU+TJA==
X-Google-Smtp-Source: AGHT+IFkXjKkiTPkR8xojxRU7NFsJZMxDKpwXyTP6xfXG+DngwrxUNH9sJGOtnZMJgd8PKgZNORBGw==
X-Received: by 2002:a05:6000:1448:b0:432:5c43:5d with SMTP id ffacd0b85a97d-432c37c87bbmr20777182f8f.36.1768239774393;
        Mon, 12 Jan 2026 09:42:54 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:54 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 09/10] staging: rtl8723bs: Fix operator spacing issues in HalHWImg8723B_RF.c
Date: Mon, 12 Jan 2026 22:42:26 +0500
Message-ID: <20260112174227.14922-10-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add spaces around arithmetic and bitwise operators (+, -, |) to fix
multiple checkpatch.pl checks.

Adhere to the kernel coding style by adding spaces around arithmetic and
bitwise operators.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 .../staging/rtl8723bs/hal/HalHWImg8723B_RF.c  | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
index 22be62ad8e0e..1ae82afbcb64 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_RF.c
@@ -212,7 +212,7 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ArrayLen; i += 2) {
 		u32 v1 = Array[i];
-		u32 v2 = Array[i+1];
+		u32 v2 = Array[i + 1];
 
 		/*  This (offset, data) pair doesn't care the condition. */
 		if (v1 < 0x40000000) {
@@ -221,7 +221,7 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 		} else {
 			/*  This line is the beginning of branch. */
 			bool bMatched = true;
-			u8  cCond  = (u8)((v1 & (BIT29|BIT28)) >> 28);
+			u8  cCond  = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 
 			if (cCond == COND_ELSE) { /*  ELSE, ENDIF */
 				bMatched = true;
@@ -241,22 +241,22 @@ void ODM_ReadAndConfig_MP_8723B_RadioA(struct dm_odm_t *pDM_Odm)
 				 *  Condition isn't matched.
 				 *  Discard the following (offset, data) pairs.
 				 */
-				while (v1 < 0x40000000 && i < ArrayLen-2)
+				while (v1 < 0x40000000 && i < ArrayLen - 2)
 					READ_NEXT_PAIR(v1, v2, i);
 
 				i -= 2; /*  prevent from for-loop += 2 */
 			} else {
 				/*  Configure matched pairs and skip to end of if-else. */
-				while (v1 < 0x40000000 && i < ArrayLen-2) {
+				while (v1 < 0x40000000 && i < ArrayLen - 2) {
 					odm_ConfigRF_RadioA_8723B(pDM_Odm, v1, v2);
 					READ_NEXT_PAIR(v1, v2, i);
 				}
 
 				/*  Keeps reading until ENDIF. */
-				cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
-				while (cCond != COND_ENDIF && i < ArrayLen-2) {
+				cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
+				while (cCond != COND_ENDIF && i < ArrayLen - 2) {
 					READ_NEXT_PAIR(v1, v2, i);
-					cCond = (u8)((v1 & (BIT29|BIT28)) >> 28);
+					cCond = (u8)((v1 & (BIT29 | BIT28)) >> 28);
 				}
 			}
 		}
@@ -513,11 +513,11 @@ void ODM_ReadAndConfig_MP_8723B_TXPWR_LMT(struct dm_odm_t *pDM_Odm)
 
 	for (i = 0; i < ARRAY_SIZE(Array_MP_8723B_TXPWR_LMT); i += 6) {
 		u8 *regulation = Array[i];
-		u8 *bandwidth = Array[i+1];
-		u8 *rate = Array[i+2];
-		u8 *rfPath = Array[i+3];
-		u8 *chnl = Array[i+4];
-		u8 *val = Array[i+5];
+		u8 *bandwidth = Array[i + 1];
+		u8 *rate = Array[i + 2];
+		u8 *rfPath = Array[i + 3];
+		u8 *chnl = Array[i + 4];
+		u8 *val = Array[i + 5];
 
 		odm_ConfigBB_TXPWR_LMT_8723B(pDM_Odm,
 					     regulation,
-- 
2.47.3

