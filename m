Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC712FB2
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 19:26:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z26so3105339edr.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s3GVLDESWJbtNc+7omuplm2sr4uPYhw1glHdphogE0o=;
        b=b3VMBI3ppb+C7B+PXKoOPv8///pm7CATkXsVTbZMO3UgyFa8KeMtxf9Xa4nTCT4+oP
         A5lr8qsv42xmbfgJJ5bINsmHN3sYqiFf0G/gdQxG8Ulizhf8vyV3Scv+egpzFfPs+Zi4
         3LTuCe9oWtCfgU8n9+mdmfqBwjmKPW+sfxAwAh8crtBZvgpe4perK+vZR5yjd3ykirQ7
         hbWRFUknsOLki0bcKYDdwzFTSVbvXJMCCBO5vfiFggTTy2yasQnaommq1stOHavPa7E7
         CZA+0dXq49FGCVA2wfHbgqqUCVi75hQxbQmYR0Y+t7BtwjbRmCpFfCEx0WtE3OWVcz2O
         SSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s3GVLDESWJbtNc+7omuplm2sr4uPYhw1glHdphogE0o=;
        b=UHu/l3UC67LEaNv0BvNrtFVriArNHnNt+qbSzmkKHyw2fNMKeRR6DGTizRSYc1nKCx
         HlZI0FpLGkN3kLWm7mjGhSx9b9XQu3Ttaq93aQFRtgFqjaBCgRD+h2UGbBjqMrjl6oO6
         VMeD4j9gly8/Z9fVLNk8i8Tzjuz9/p+uddTK8Ua/F71yojYNLPKEeWNkx0M4qK0qwNgF
         y+g836Bne4SYuJmoWbyKyihQj0fvYnSVggmErkAG4AYN8m+lPY0iuR2Dj7aIx98ZaN/o
         MSveNCtD42IavlUZupAOW5y6J4A1J9Y2NdZ/hGH/ZrIIMB9xEuqBEy9OhE+4LaKdTua9
         FOMQ==
X-Gm-Message-State: AOAM533dSN1YGT/HLUGmYGLoIUov3EQzO4PRccusxj08lwUiAVEUumzT
	uZKaGy+mlR4AeQozGbpl6bk=
X-Google-Smtp-Source: ABdhPJwML6Yz8wQ1b3yMKh5aIL3rBvs2pgV5auXCyPd61EJRaR+7qiulgxmsd9fyINKLUvkArob29A==
X-Received: by 2002:a05:6402:74c:: with SMTP id p12mr7310647edy.153.1627068404490;
        Fri, 23 Jul 2021 12:26:44 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id v24sm14621129eds.44.2021.07.23.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 12:26:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	David Laight <David.Laight@ACULAB.COM>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Fri, 23 Jul 2021 21:26:19 +0200
Message-Id: <20210723192620.10669-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210723192620.10669-1-fmdefrancesco@gmail.com>
References: <20210723192620.10669-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use crc32_le() in place of the custom getcrc32().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v3 --> v4:
According to a suggestion of David Laight, kill the casts of crc to __le32.

v2 --> v3:
Join two related patches in a series because they must be applied in
order (first 1/2, then 2/2). Rebase to the current Greg K-H's tree and resend.

v1 --> v2:
Use cpu_to_le32() to assign native endian return value of crc32_le to
crc in little endian byte order.

 drivers/staging/rtl8188eu/core/rtw_security.c | 45 ++++++++-----------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index 1b2cb6196463..7001f24f118d 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -11,6 +11,7 @@
 #include <wifi.h>
 #include <osdep_intf.h>
 #include <net/lib80211.h>
+#include <linux/types.h>
 
 /* WEP related ===== */
 
@@ -111,21 +112,6 @@ static void crc32_init(void)
 	bcrc32initialized = 1;
 }
 
-static __le32 getcrc32(u8 *buf, int len)
-{
-	u8 *p;
-	u32  crc;
-
-	if (bcrc32initialized == 0)
-		crc32_init();
-
-	crc = 0xffffffff;       /* preload shift register, per CRC-32 spec */
-
-	for (p = buf; len > 0; ++p, --len)
-		crc = crc32_table[(crc ^ *p) & 0xff] ^ (crc >> 8);
-	return cpu_to_le32(~crc);    /* transmit complement, per CRC-32 spec */
-}
-
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 {
@@ -564,7 +550,10 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	u32	pnh;
 	u8	rc4key[16];
 	u8   ttkey[16];
-	u8	crc[4];
+	union {
+		__le32 f0;
+		u8 f1[4];
+	} crc;
 	u8   hw_hdr_offset = 0;
 	struct arc4context mycontext;
 	int			curfragnum, length;
@@ -609,17 +598,18 @@ u32	rtw_tkip_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 
 				if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
 					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
-					*((__le32 *)crc) = getcrc32(payload, length);/* modified by Amy*/
+					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arcfour_init(&mycontext, rc4key, 16);
 					arcfour_encrypt(&mycontext, payload, payload, length);
-					arcfour_encrypt(&mycontext, payload + length, crc, 4);
+					arcfour_encrypt(&mycontext, payload + length, crc.f1, 4);
 				} else {
 					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
-					*((__le32 *)crc) = getcrc32(payload, length);/* modified by Amy*/
+					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
+
 					arcfour_init(&mycontext, rc4key, 16);
 					arcfour_encrypt(&mycontext, payload, payload, length);
-					arcfour_encrypt(&mycontext, payload + length, crc, 4);
+					arcfour_encrypt(&mycontext, payload + length, crc.f1, 4);
 
 					pframe += pxmitpriv->frag_len;
 					pframe = (u8 *)round_up((size_t)(pframe), 4);
@@ -639,7 +629,10 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 	u32 pnh;
 	u8   rc4key[16];
 	u8   ttkey[16];
-	u8	crc[4];
+	union {
+		__le32 f0;
+		u8 f1[4];
+	} crc;
 	struct arc4context mycontext;
 	int			length;
 	u8	*pframe, *payload, *iv, *prwskey;
@@ -682,12 +675,12 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 			arcfour_init(&mycontext, rc4key, 16);
 			arcfour_encrypt(&mycontext, payload, payload, length);
 
-			*((__le32 *)crc) = getcrc32(payload, length - 4);
+			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length - 4));
 
-			if (crc[3] != payload[length - 1] ||
-			    crc[2] != payload[length - 2] ||
-			    crc[1] != payload[length - 3] ||
-			    crc[0] != payload[length - 4])
+			if (crc.f1[3] != payload[length - 1] ||
+			    crc.f1[2] != payload[length - 2] ||
+			    crc.f1[1] != payload[length - 3] ||
+			    crc.f1[0] != payload[length - 4])
 				res = _FAIL;
 		} else {
 			res = _FAIL;
-- 
2.32.0

