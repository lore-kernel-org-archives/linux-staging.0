Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920970
	for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 14:42:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id n2so30827832ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 21 May 2021 07:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9SKo3NdGGBNovIrQCqMGuOHB6KkkTbrheBEMJXD0tM=;
        b=erkxw1RrQ11ukOtS5y3enOxrVQWqCFSEhTWhvRZpHralUu9dmOLzlpFi+RDUjqGbP8
         kqm84lzHdle7KSnSUpPVoHzSdZpuZDdyBt6outjt56jJvBTN8m31IjlKbwOLV4XlM+KD
         7h2fIAc1gRm2faPrEwRKlaEOH2wR+WA9FhiTdfQ6wSD10/D3Ly5jvgjazXkH9AjDbTnM
         ga+cs8q7gR7m7IPzxLbYUyN19vPa6PAyR88XAVh44gxXOqrVpL/JtygEjTh+QRKCkREu
         AfW6TE5f8n/6CIIeQxQvhsaihhSCmze+9pNREoINpYMkyl6S0IL6GYmwXS1k+YzyzKxr
         R+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J9SKo3NdGGBNovIrQCqMGuOHB6KkkTbrheBEMJXD0tM=;
        b=RWqyK/nGqFzrMQcFEpqXW+IYatQ/JAVrucPe59+hZyvHLwNlEKUTpccHkNkRT/PRuS
         mFXlSnJmBYwtBndy7sFwYNmuCL7tGYBiVMlQh2Ao0Pv4yZevq0Aq2d5lKwkCYq/6i1n2
         vqpXP1nq+bGhY9lQETTsCZHh5yY23Qemyt2r9yFT9L82+uaZZJBAhdGgnP4EEakQMzJP
         92XDapxQxuhSI7JKnBDCQ+vyIqm9Pf/StShXt8P7mRBg9mXdC1GzBIZ+f3eAKPl6aNv0
         IXMFs2iaQWTRplKOL6QoMfnDPKVC/ONNU45TuXRpkRXp4QKqDF9wYGC1EcTYTRPceuWY
         eiNg==
X-Gm-Message-State: AOAM531OjOigr2glDp9X/ahFS25v8fzWt3+KxlTa85wyxhWq/CZ8YrZ0
	gOxy4sQLraPinobM/DAvYzU=
X-Google-Smtp-Source: ABdhPJy3GwopMX6WLD88OU2cJB+4XnpgJlTQanXQbXIFkP2XDHec7z0Dqseiqxm3tfvID0UzEOdyWg==
X-Received: by 2002:a17:906:13db:: with SMTP id g27mr10795477ejc.88.1621608119699;
        Fri, 21 May 2021 07:41:59 -0700 (PDT)
Received: from agape ([109.52.244.91])
        by smtp.gmail.com with ESMTPSA id dk21sm3672277ejb.54.2021.05.21.07.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 07:41:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] staging: rtl8723bs: moved contexts for arc4 encryption in struct security_priv
Date: Fri, 21 May 2021 16:41:58 +0200
Message-Id: <20210521144158.2440-1-fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

moved struct arc4_ctx in struct security_priv to avoid stack allocation
inside encryption routines.

this has been done to fix the following 0-DAY issues:

>> drivers/staging/rtl8723bs/core/rtw_security.c:89:6: warning:
stack frame size of 1120 bytes in function 'rtw_wep_encrypt'
[-Wframe-$
   void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
        ^
>> drivers/staging/rtl8723bs/core/rtw_security.c:145:6:
warning: stack frame size of 1088 bytes in function 'rtw_wep_decrypt'
[-Wframe$
   void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
        ^
>> drivers/staging/rtl8723bs/core/rtw_security.c:514:5:
warning: stack frame size of 1136 bytes in function 'rtw_tkip_encrypt'
[-Wfram$
   u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
       ^
>> drivers/staging/rtl8723bs/core/rtw_security.c:586:5:
warning: stack frame size of 1104 bytes in function 'rtw_tkip_decrypt'
[-Wfram$
   u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
       ^

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 41 +++++++++----------
 .../staging/rtl8723bs/include/rtw_security.h  |  3 ++
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 5ff8926c1865..a99f439328f1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -8,7 +8,6 @@
 #include <drv_types.h>
 #include <rtw_debug.h>
 #include <crypto/aes.h>
-#include <crypto/arc4.h>
 
 static const char * const _security_type_str[] = {
 	"N/A",
@@ -38,7 +37,6 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
 
 	unsigned char crc[4];
-	struct arc4_ctx	mycontext;
 
 	signed int	curfragnum, length;
 	u32 keylength;
@@ -49,6 +47,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	struct pkt_attrib *pattrib = &((struct xmit_frame *)pxmitframe)->attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct arc4_ctx *ctx = &psecuritypriv->xmit_arc4_ctx;
 
 	if (((struct xmit_frame *)pxmitframe)->buf_addr == NULL)
 		return;
@@ -72,16 +71,16 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 				*((__le32 *)crc) = ~crc32_le(~0, payload, length);
 
-				arc4_setkey(&mycontext, wepkey, 3 + keylength);
-				arc4_crypt(&mycontext, payload, payload, length);
-				arc4_crypt(&mycontext, payload + length, crc, 4);
+				arc4_setkey(ctx, wepkey, 3 + keylength);
+				arc4_crypt(ctx, payload, payload, length);
+				arc4_crypt(ctx, payload + length, crc, 4);
 
 			} else {
 				length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
 				*((__le32 *)crc) = ~crc32_le(~0, payload, length);
-				arc4_setkey(&mycontext, wepkey, 3 + keylength);
-				arc4_crypt(&mycontext, payload, payload, length);
-				arc4_crypt(&mycontext, payload + length, crc, 4);
+				arc4_setkey(ctx, wepkey, 3 + keylength);
+				arc4_crypt(ctx, payload, payload, length);
+				arc4_crypt(ctx, payload + length, crc, 4);
 
 				pframe += pxmitpriv->frag_len;
 				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
@@ -94,13 +93,13 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 {
 	/*  exclude ICV */
 	u8 crc[4];
-	struct arc4_ctx	 mycontext;
 	signed int	length;
 	u32 keylength;
 	u8 *pframe, *payload, *iv, wepkey[16];
 	u8  keyindex;
 	struct	rx_pkt_attrib	 *prxattrib = &(((union recv_frame *)precvframe)->u.hdr.attrib);
 	struct	security_priv *psecuritypriv = &padapter->securitypriv;
+	struct arc4_ctx *ctx = &psecuritypriv->recv_arc4_ctx;
 
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 
@@ -118,8 +117,8 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		payload = pframe+prxattrib->iv_len+prxattrib->hdrlen;
 
 		/* decrypt payload include icv */
-		arc4_setkey(&mycontext, wepkey, 3 + keylength);
-		arc4_crypt(&mycontext, payload, payload,  length);
+		arc4_setkey(ctx, wepkey, 3 + keylength);
+		arc4_crypt(ctx, payload, payload,  length);
 
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
@@ -467,7 +466,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	u8   ttkey[16];
 	u8 crc[4];
 	u8   hw_hdr_offset = 0;
-	struct arc4_ctx mycontext;
 	signed int			curfragnum, length;
 
 	u8 *pframe, *payload, *iv, *prwskey;
@@ -475,6 +473,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	struct pkt_attrib *pattrib = &((struct xmit_frame *)pxmitframe)->attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
+	struct arc4_ctx *ctx = &psecuritypriv->xmit_arc4_ctx;
 	u32 res = _SUCCESS;
 
 	if (((struct xmit_frame *)pxmitframe)->buf_addr == NULL)
@@ -509,17 +508,17 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
 					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
 
-					arc4_setkey(&mycontext, rc4key, 16);
-					arc4_crypt(&mycontext, payload, payload, length);
-					arc4_crypt(&mycontext, payload + length, crc, 4);
+					arc4_setkey(ctx, rc4key, 16);
+					arc4_crypt(ctx, payload, payload, length);
+					arc4_crypt(ctx, payload + length, crc, 4);
 
 				} else {
 					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
 					*((__le32 *)crc) = ~crc32_le(~0, payload, length);
 
-					arc4_setkey(&mycontext, rc4key, 16);
-					arc4_crypt(&mycontext, payload, payload, length);
-					arc4_crypt(&mycontext, payload + length, crc, 4);
+					arc4_setkey(ctx, rc4key, 16);
+					arc4_crypt(ctx, payload, payload, length);
+					arc4_crypt(ctx, payload + length, crc, 4);
 
 					pframe += pxmitpriv->frag_len;
 					pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
@@ -539,7 +538,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	u8   rc4key[16];
 	u8   ttkey[16];
 	u8 crc[4];
-	struct arc4_ctx mycontext;
 	signed int			length;
 
 	u8 *pframe, *payload, *iv, *prwskey;
@@ -547,6 +545,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	struct sta_info *stainfo;
 	struct rx_pkt_attrib *prxattrib = &((union recv_frame *)precvframe)->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
+	struct arc4_ctx *ctx = &psecuritypriv->recv_arc4_ctx;
 	u32 res = _SUCCESS;
 
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
@@ -616,8 +615,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 			/* 4 decrypt payload include icv */
 
-			arc4_setkey(&mycontext, rc4key, 16);
-			arc4_crypt(&mycontext, payload, payload, length);
+			arc4_setkey(ctx, rc4key, 16);
+			arc4_crypt(ctx, payload, payload, length);
 
 			*((u32 *)crc) = le32_to_cpu(~crc32_le(~0, payload, length - 4));
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 83b711c5df0b..a68b73858462 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -7,6 +7,7 @@
 #ifndef __RTW_SECURITY_H_
 #define __RTW_SECURITY_H_
 
+#include <crypto/arc4.h>
 
 #define _NO_PRIVACY_		0x0
 #define _WEP40_				0x1
@@ -127,6 +128,8 @@ struct security_priv {
 	u8 wps_ie[MAX_WPS_IE_LEN];/* added in assoc req */
 	int wps_ie_len;
 
+	struct arc4_ctx xmit_arc4_ctx;
+	struct arc4_ctx recv_arc4_ctx;
 
 	u8 binstallGrpkey;
 	u8 binstallBIPkey;
-- 
2.20.1

