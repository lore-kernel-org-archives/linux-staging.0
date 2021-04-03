Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8112129DE
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:20 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id v4so6512455wrp.13
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnlRqa1pV52c6wUAyz/EYgtXOO506MKaz/mlftdWmZc=;
        b=aBUQ6iRAOKzzmWHzIZ9cMJ4G00yoij6U+v6tpxsrc/AMweZh6DZq/wo47LZercCUL1
         WO9RT0lmgtvqCSj21hGY4pQXtQjcfQO/KKd0qn467lktQAp0HGPYRaKftKVO04VXtxAq
         BympThFD+nUHHAcrIPmbofFayA9WPsQQNn6Ak378k3ylfi/0RZ+QtNDSPQX/+638f363
         wBl060nyRlcH2CGfNuHaXmOEfqjAtAJww626fnFIyOZJbo/WGQZZkZ6BlHphOhKGvjWB
         lFX2/CRtz1dgiVKg8VN2kE2zsT1KpqZObqoeFYo9shSdko7rzQ0/fPW2j6ZvlbFIZqpL
         O++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnlRqa1pV52c6wUAyz/EYgtXOO506MKaz/mlftdWmZc=;
        b=Atx+5swdQI8MRbdJcQYyubSuRwmBh2V1E4ix4ZeKHK4pFkgh2DB7IHnIkVZ1ARY8wX
         5ebPUK2Nk3+VbeMnI42KOJkcE61BN2zCmryT2J0OE3Ydw3OvzNJflLVLYNkCeRsViBf5
         lw7N/A6QngjeIY4VsuhtmDYCHGg+ENCkBsME2tsB8YYIMyLh5hLJBz5U9R0hBW5urKmj
         5QW23PWV2l8w4Y6fNbQwoYo67SHfxJP1fL+/p2nNLn43XpDomdWCimvXO++3IS0N3x1J
         Dhd5YkiqHI1pYc2Qkj5xNkTOCQyjk0dl6HXYVorWyYKgkE6ifi/ZzXYHIxiFmo6IoTqP
         uWog==
X-Gm-Message-State: AOAM530d5G/CcmVOLuLumsXLoeaIfoEZUd78bhKeikMu2EfMUqG/kccc
	Zry6NoRswDuTjAoDPcMZBbA=
X-Google-Smtp-Source: ABdhPJw3QS6XGPQhioaekiGb7wrzgIMpu69s7WzuPUHrdyyyABGIrpSwipuXADZ2cw434wUmiaUkZg==
X-Received: by 2002:a5d:50c7:: with SMTP id f7mr19786986wrt.18.1617441259096;
        Sat, 03 Apr 2021 02:14:19 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id l1sm18778174wrv.87.2021.04.03.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:18 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 03/30] staging: rtl8723bs: remove RT_TRACE logs in core/rtw_security.c
Date: Sat,  3 Apr 2021 11:13:25 +0200
Message-Id: <14207c2b7ea789e8b0f3bd37d2758e979eff997c.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all of the RT_TRACE logs in the core/rtw_security.c file as they
currently do nothing as they require the code to be modified by
hand in order to be turned on. This obviously has not happened
since the code was merged. Moreover it relies on an unneeded
private log level tracing which overrides the in-kernel public one,
so just remove them as they are unused.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 40 +------------------
 1 file changed, 1 insertion(+), 39 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8a447e149438..689419a76d94 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -236,16 +236,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-		if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4]) {
-			RT_TRACE(_module_rtl871x_security_c_,
-				 _drv_err_,
-				 ("%s:icv error crc[3](%x)!=payload[length-1](%x) || crc[2](%x)!=payload[length-2](%x) || crc[1](%x)!=payload[length-3](%x) || crc[0](%x)!=payload[length-4](%x)\n",
-					__func__,
-					crc[3], payload[length - 1],
-					crc[2], payload[length - 2],
-					crc[1], payload[length - 3],
-					crc[0], payload[length - 4]));
-		}
 	}
 }
 
@@ -609,8 +599,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	if (pattrib->encrypt == _TKIP_) {
 
 		{
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("%s: stainfo!= NULL!!!\n", __func__));
-
 			if (IS_MCAST(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
@@ -631,7 +619,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					RT_TRACE(_module_rtl871x_security_c_, _drv_info_, ("pattrib->iv_len =%x, pattrib->icv_len =%x\n", pattrib->iv_len, pattrib->icv_len));
 					*((__le32 *)crc) = getcrc32(payload, length);/* modified by Amy*/
 
 					arcfour_init(&mycontext, rc4key, 16);
@@ -739,18 +726,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			*((u32 *)crc) = le32_to_cpu(getcrc32(payload, length-4));
 
-			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4]) {
-				RT_TRACE(_module_rtl871x_security_c_,
-					 _drv_err_,
-					 ("rtw_wep_decrypt:icv error crc[3](%x)!=payload[length-1](%x) || crc[2](%x)!=payload[length-2](%x) || crc[1](%x)!=payload[length-3](%x) || crc[0](%x)!=payload[length-4](%x)\n",
-						crc[3], payload[length - 1],
-						crc[2], payload[length - 2],
-						crc[1], payload[length - 3],
-						crc[0], payload[length - 4]));
+			if (crc[3] != payload[length-1] || crc[2] != payload[length-2] || crc[1] != payload[length-3] || crc[0] != payload[length-4])
 				res = _FAIL;
-			}
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("%s: stainfo == NULL!!!\n", __func__));
 			res = _FAIL;
 		}
 	}
@@ -1380,8 +1358,6 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _AES_) {
-		RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("%s: stainfo!= NULL!!!\n", __func__));
-
 		if (IS_MCAST(pattrib->ra))
 			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 		else
@@ -1611,13 +1587,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	/* compare the mic */
 	for (i = 0; i < 8; i++) {
 		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i]) {
-			RT_TRACE(_module_rtl871x_security_c_,
-				 _drv_err_,
-				 ("%s:mic check error mic[%d]: pframe(%x) != message(%x)\n",
-					__func__,
-					i,
-					pframe[hdrlen + 8 + plen - 8 + i],
-					message[hdrlen + 8 + plen - 8 + i]));
 			DBG_871X("%s:mic check error mic[%d]: pframe(%x) != message(%x)\n",
 					__func__,
 					i,
@@ -1649,10 +1618,6 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt == _AES_) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo) {
-			RT_TRACE(_module_rtl871x_security_c_,
-				 _drv_err_,
-				 ("%s: stainfo!= NULL!!!\n", __func__));
-
 			if (IS_MCAST(prxattrib->ra)) {
 				static unsigned long start;
 				static u32 no_gkey_bc_cnt;
@@ -1706,9 +1671,6 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_,
-				 _drv_err_,
-				 ("%s: stainfo == NULL!!!\n", __func__));
 			res = _FAIL;
 		}
 	}
-- 
2.20.1

