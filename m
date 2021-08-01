Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2658C3484
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id n12so18797669wrr.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kdV8/s2ZaGPcTKUx15rayYaL1wTrixDIcE4vWJaabZA=;
        b=JrbrLlsAYrGkATQSUcuiwomKZxeBmcauJIKTu00+jlrEkdV01KWPzVQbI1eLZ53ack
         jD5G9Fjct+QaUjVmXLRdGm5adnDZsYIoVXrCs7t+cvwXMfCAtft4/Spmyh3abibtNsXO
         9Ud7ABQVWQyCgyzUhWAFKzMQaVR4ran/nDTAbnf/pF5sZjRBNDsLW0arPh3ytIHY8K7j
         qxLIarH0rXeVk945ReKOzjLuKtdT6N5R0A+QkQ8j2wyUT+HUQuKrGpfuNjY0p9SdxGLg
         77ZeTYjSiVWiaK2SsLFQFb4rHc/Jzba0Pzzf9o/O/QKFfjI11Zl3WRwCznCgDIeZnSjW
         U9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kdV8/s2ZaGPcTKUx15rayYaL1wTrixDIcE4vWJaabZA=;
        b=UhObl8oXULRGZxUoNkTDrUx8AniCD1PPWORLo3v+4852h7NCcXTeX3zoYnv+TmBqaY
         ubyQbIcVbzrFjyImZ04vokJ+LAr1vDdj1UDlx4B/40+KsqqLtMjpGRy5Xhx6a8Zbdm6V
         CWIdPD8kY11NOQ0dQDiDNnGaPvsI5uQV5esMvNrcJyCUIROAiFmDcsoW4jlWwuV5pO24
         nBXMIw4YfBMT2hiopEEWWYOhozRadTklCUjlVhuAWj5Trr0JqgrycEYhYqesqrdoDFDC
         hI0nFNo2PKM+C4NNeL32DlGrVCmxkqsdGs8dnol2Ht039rk7EyvI/iY1lddBazzWDNxz
         3osA==
X-Gm-Message-State: AOAM532vF2Hrb63d5YxrS2RZ4JEUqYB4zpl6Un1lRI1bfExF8aD9eUo2
	vZmS7ARxJbsed2WjTL8lKm4SwQ==
X-Google-Smtp-Source: ABdhPJzRZKWMkdgyLLV5rr5ehzTGnvsBpCYMMPh3BkXCR2VkHdbZl0N+n/agw5mFTPhGxGJfkl37xg==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr13794723wru.7.1627844687490;
        Sun, 01 Aug 2021 12:04:47 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:47 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 10/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_security.c
Date: Sun,  1 Aug 2021 20:04:32 +0100
Message-Id: <20210801190437.82017-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_security.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_security.c | 37 +--------------------
 1 file changed, 1 insertion(+), 36 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 2c1b9a6dcdf2..1305031c0908 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -170,15 +170,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 		/* calculate icv and compare the icv */
 		crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
-
-		if (crc.f1[3] != payload[length-1] ||
-		    crc.f1[2] != payload[length-2] ||
-		    crc.f1[1] != payload[length-3] ||
-		    crc.f1[0] != payload[length-4]) {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_,
-				 ("rtw_wep_decrypt:icv error crc (%4ph)!=payload (%4ph)\n",
-				 &crc, &payload[length-4]));
-		}
 	}
 
 	return;
@@ -556,8 +547,6 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			stainfo = rtw_get_stainfo(&padapter->stapriv, &pattrib->ra[0]);
 
 		if (stainfo != NULL) {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_tkip_encrypt: stainfo!= NULL!!!\n"));
-
 			if (IS_MCAST(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
@@ -576,9 +565,6 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
-					RT_TRACE(_module_rtl871x_security_c_, _drv_info_,
-						 ("pattrib->iv_len=%x, pattrib->icv_len=%x\n",
-						 pattrib->iv_len, pattrib->icv_len));
 					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arcfour_init(&mycontext, rc4key, 16);
@@ -597,7 +583,6 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				}
 			}
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_tkip_encrypt: stainfo==NULL!!!\n"));
 			res = _FAIL;
 		}
 	}
@@ -640,7 +625,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 			} else {
-				RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_tkip_decrypt: stainfo!= NULL!!!\n"));
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 
@@ -666,14 +650,9 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (crc.f1[3] != payload[length-1] ||
 			    crc.f1[2] != payload[length-2] ||
 			    crc.f1[1] != payload[length-3] ||
-			    crc.f1[0] != payload[length-4]) {
-				RT_TRACE(_module_rtl871x_security_c_, _drv_err_,
-					 ("rtw_wep_decrypt:icv error crc (%4ph)!=payload (%4ph)\n",
-					 &crc, &payload[length-4]));
+			    crc.f1[0] != payload[length-4])
 				res = _FAIL;
-			}
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_tkip_decrypt: stainfo==NULL!!!\n"));
 			res = _FAIL;
 		}
 	}
@@ -1218,8 +1197,6 @@ u32	rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			stainfo = rtw_get_stainfo(&padapter->stapriv, &pattrib->ra[0]);
 
 		if (stainfo != NULL) {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_aes_encrypt: stainfo!= NULL!!!\n"));
-
 			if (IS_MCAST(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
 			else
@@ -1238,7 +1215,6 @@ u32	rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				}
 			}
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_aes_encrypt: stainfo==NULL!!!\n"));
 			res = _FAIL;
 		}
 	}
@@ -1430,9 +1406,6 @@ static int aes_decipher(u8 *key, uint	hdrlen,
 	/* compare the mic */
 	for (i = 0; i < 8; i++) {
 		if (pframe[hdrlen+8+plen-8+i] != message[hdrlen+8+plen-8+i]) {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_,
-				 ("aes_decipher:mic check error mic[%d]: pframe(%x)!=message(%x)\n",
-				 i, pframe[hdrlen+8+plen-8+i], message[hdrlen+8+plen-8+i]));
 			DBG_88E("aes_decipher:mic check error mic[%d]: pframe(%x)!=message(%x)\n",
 				i, pframe[hdrlen+8+plen-8+i], message[hdrlen+8+plen-8+i]);
 			res = _FAIL;
@@ -1457,8 +1430,6 @@ u32	rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if ((prxattrib->encrypt == _AES_)) {
 		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
 		if (stainfo != NULL) {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_aes_decrypt: stainfo!= NULL!!!\n"));
-
 			if (IS_MCAST(prxattrib->ra)) {
 				/* in concurrent we should use sw descrypt in group key, so we remove this message */
 				if (!psecuritypriv->binstallGrpkey) {
@@ -1479,7 +1450,6 @@ u32	rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			length = ((struct recv_frame *)precvframe)->len-prxattrib->hdrlen-prxattrib->iv_len;
 			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 		} else {
-			RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("rtw_aes_encrypt: stainfo==NULL!!!\n"));
 			res = _FAIL;
 		}
 	}
@@ -1691,10 +1661,5 @@ void rtw_use_tkipkey_handler(void *FunctionContext)
 {
 	struct adapter *padapter = (struct adapter *)FunctionContext;
 
-	RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("^^^rtw_use_tkipkey_handler ^^^\n"));
-
 	padapter->securitypriv.busetkipkey = true;
-
-	RT_TRACE(_module_rtl871x_security_c_, _drv_err_, ("^^^rtw_use_tkipkey_handler padapter->securitypriv.busetkipkey=%d^^^\n", padapter->securitypriv.busetkipkey));
-
 }
-- 
2.31.1

