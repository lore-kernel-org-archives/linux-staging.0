Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180881AF0CA
	for <linux-staging@lists.linux.dev>; Sat,  8 Feb 2025 08:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002601; cv=none; b=HQAqI/h6mKgUknw0XjPUumbmzgWS+gQyg7b6wz9HM5WdeB2Fd1mhLNTOTvv+NMbrklUl0ZpM63C9FB53wxcCESAo83/vCJ8APUvB+htgh9rE+4Jr2I3Sp3/Vnp1bsNe+b6Jv1rsY22UzIIyz9wl4AXmAZzpfBbSKTpsF8V1Ghr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002601; c=relaxed/simple;
	bh=n9CAaUySQhQlxLGra9vISpqse25aiGAxjeymW89Rapk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAU1ZBAPk3g5MYoQ3IMumdMIk2F1aqgSrzgXvqRbFTajZn1fqoUIXQ44sQj69PT/ewmthlSuaTDIGUJAgOldjs9n26XNJn7ih+JtOO+y/pHsm7Fo8rcMEP4DYKOzmm/+6GNY6dgywQylmkQiPSGteuo8aNu31gfz5g4Pw4BTv6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqQCEEMu; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqQCEEMu"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5fc69795ecbso230331eaf.1
        for <linux-staging@lists.linux.dev>; Sat, 08 Feb 2025 00:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002598; x=1739607398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvH6zYruV3R+pLZlTPyxREbVhpSdp2y4jHvklQV4/fU=;
        b=iqQCEEMuiC8dMHsmbOUqN1b3Y8hCpqX9Ao29rdENRi2Tb64gVj7fl4H2RrYuXlX6kj
         +/Y4/6Zq7e6MHpjaCjVb2diKe6mgBiAaTZYIPgfQoSFoOAPMnTDFxzAHNgRUKkxCUvkH
         NSRi3pYWR0dLI4pzWsTEAGP2hmVUHTZcYd2qECKcr38zhrrjlnKaZiBFj/3dvog+wWfr
         yUmEMBUZqAS1HQXsKB2pICkAXY9+GWMGtml2Gm39+Ti97c8xasZ+jqKKapPvRSScdxM/
         L8gDS4mYYxmSwvayHjA0iDdZ9J7EdkeY62uHYNYPyK+JVtJjOwpaF2HDeXzR12Y6/5X0
         DLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002598; x=1739607398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvH6zYruV3R+pLZlTPyxREbVhpSdp2y4jHvklQV4/fU=;
        b=Obhq/M/cV2RR8pHXVozZBxlvBxm3J40AtmIHOO9zG33keH+Vnon0A7JGsqwKkS7S71
         +9IYllZQ6bpTg/f5VHyxSvxYA13yn5Yofo4l1TPg35Iy5W9DYapQR2GYzoQ7s+vcl53X
         71biNRzzXy1MCCJAwXRcqx26IY9MNLSIJgcDfVF+iJEsPWHGOorXwXEHFklSYrB4Z9rX
         49NverEjwau77VX14zGxZnATSkO1ArrBxQmX70HSkMpBWKJoCdwvRqkFEm+kt5Lnv7hr
         2K+iomh8O0Q3Ot7UCt2ppRoaZ/YZ60cDqKdLk+JYSw3zeLoSFc91CWbzxLd9zI5roBoG
         diug==
X-Gm-Message-State: AOJu0YyWLA6sdJ5rs7eplBW6w4UcTyLc7u5+gu9lwoQbfOgVCRDBqESq
	d/7LdNg2EwRu6towQnZykn8ESxQ2EmKsdqVAl/jKfvtpAEJ79w1T
X-Gm-Gg: ASbGncv/KcZNuuHHIxYJhN7T81OKC4EmYp5NHcRLH8y+XA1OMSIeE9A4aYnQa+G6jar
	HAZe3dl6Cwb4YpIPdwfytHisBnX4fEw70ri5Xw+wVtaGLDoJ6QQFfcRRMhsUGXXYGPW4R90V4ub
	1cxmI1LrTIlMdETs/u2ngZHBqMuLN6NqvMsfTJpDcC9ktgm6ecLJt4bc3w5lW4B6ExjNSyHbqlk
	RT5+IdTgP2mjyao5VvuoABf+ETEnTVFzKoLOYTORQkmqLJB7qN3nQh8rzFt7TwL4bk7vKPrcMkW
	Q2EG5XvmB6m73JuK07/5vCWYCVS0+xR/ENMmtTeBHcMaMzOLETrb/P/3apnOFBRu36fLFh74h1n
	Y
X-Google-Smtp-Source: AGHT+IF1nfHFesvyC7XVS1zMJMt0YH/gyC5fXeGTEbkUfEAmVkZsMWqJkAEzXs7mI9pMCsC+ffxm5w==
X-Received: by 2002:a05:6820:612:b0:5fa:5c7d:db42 with SMTP id 006d021491bc7-5fc5e444891mr3899471eaf.0.1739002597870;
        Sat, 08 Feb 2025 00:16:37 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc545bafe7sm1241055eaf.30.2025.02.08.00.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:37 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 2/3] stagin: rtl8723bs: fix spacing
Date: Sat,  8 Feb 2025 00:15:55 -0800
Message-ID: <163cf9064401145bb38035aedd3b1d3fee43079a.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739001527.git.onlyian4981@gmail.com>
References: <cover.1739001527.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21806; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=n9CAaUySQhQlxLGra9vISpqse25aiGAxjeymW89Rapk=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK40WElvT3F3+8JF3/93CjO9Czihc75i4liM
 wly9kaTQVeJAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D8kXD/433MZ2zTKpdYUMYhuVq/WGDTtFNtmHQoRRzDF7In2yCBdwvb3fEqPsvUy3ip/C+dO5y3L
 H6IB9YkZmw/odr++SNM//rMx/mbgnafadix3S8vP7TUfEfUvSPJNlalMuCHtQkWJw7xweRrPev0
 ythjuEz6++DumuQURe+7teSaJBEI26FlQcOHaMF82sm/pnSWHwfhON9gvvwZuf14JrxNg148RXx
 xBdxlst9nCo5FhB8geIIjYPH8ygylCvQk6Ze2NAFc0d9GCqSaA+9+DRlOYXdwaHyc97cL9LlHAB
 kVoHlojg7phiM5YYGTg/KjdkpxtymUhqt2VZRV0eBlSv3+yeHMetAmsKXQK4EiN8jjchVurIQLe
 SNubU3hO0WTWVan8ZnWgfAQW9eXmbxTHZLOZt9dy0w4igOA0CldTHBaJA2KaffB9U8XpzZbJHc3
 DyrQiyiVKPA03f5n6DeseZsJsayanXxVpg1J/E/KnbnI42j/Bu1gWl8RkX0PXbQxIClln5xXyzE
 XU+22XpF6Dma7kI2s2dwkScKrKRaafmjswu40ll60W/2CagV79ErzqQIAt3wZtSFZNmAKxl9yVh
 8VbnG6kHlSYeerlhVQIofWo/zVlpLqJEqalqv1RRHmilqdvzE7tOg/qgB+ZVbFegIi1/6m6PpY3 gdszIJljIgH64ig==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Fixed spacing issues. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 166 +++++++++---------
 1 file changed, 82 insertions(+), 84 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3281751436fd..394f164b3bf4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -61,14 +61,14 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		keylength = psecuritypriv->dot11DefKeylen[psecuritypriv->dot11PrivacyKeyIndex];
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-			iv = pframe+pattrib->hdrlen;
+			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
 			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
-			payload = pframe+pattrib->iv_len+pattrib->hdrlen;
+			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
-			if ((curfragnum+1) == pattrib->nr_frags) {	/* the last fragment */
+			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
 
-				length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+				length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
@@ -77,7 +77,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 			} else {
-				length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+				length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 				arc4_setkey(ctx, wepkey, 3 + keylength);
 				arc4_crypt(ctx, payload, payload, length);
@@ -106,16 +106,16 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 	/* start to decrypt recvframe */
 	if ((prxattrib->encrypt == _WEP40_) || (prxattrib->encrypt == _WEP104_)) {
-		iv = pframe+prxattrib->hdrlen;
+		iv = pframe + prxattrib->hdrlen;
 		/* keyindex =(iv[3]&0x3); */
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
-		length = ((union recv_frame *)precvframe)->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len;
+		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
-		payload = pframe+prxattrib->iv_len+prxattrib->hdrlen;
+		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
 
 		/* decrypt payload include icv */
 		arc4_setkey(ctx, wepkey, 3 + keylength);
@@ -147,7 +147,7 @@ static void secmicputuint32(u8 *p, u32 val)
 	long i;
 
 	for (i = 0; i < 4; i++) {
-		*p++ = (u8) (val & 0xff);
+		*p++ = (u8)(val & 0xff);
 		val >>= 8;
 	}
 }
@@ -173,7 +173,7 @@ void rtw_secmicsetkey(struct mic_data *pmicdata, u8 *key)
 void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 {
 	/*  Append the byte to our word-sized buffer */
-	pmicdata->M |= ((unsigned long)b) << (8*pmicdata->nBytesInM);
+	pmicdata->M |= ((unsigned long)b) << (8 * pmicdata->nBytesInM);
 	pmicdata->nBytesInM++;
 	/*  Process the word if it is full. */
 	if (pmicdata->nBytesInM >= 4) {
@@ -260,7 +260,7 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
 #define  Mk16(hi, lo) ((lo) ^ (((u16)(hi)) << 8))
 
 /* select the Nth 16-bit word of the temporal key unsigned char array TK[]   */
-#define  TK16(N)     Mk16(tk[2*(N)+1], tk[2*(N)])
+#define  TK16(N)     Mk16(tk[2 * (N) + 1], tk[2 * (N)])
 
 /* S-box lookup: 16 bits --> 16 bits */
 #define _S_(v16)     (Sbox1[0][Lo8(v16)] ^ Sbox1[1][Hi8(v16)])
@@ -415,7 +415,7 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	for (i = 0; i < 5; i++)
 		PPK[i] = p1k[i];      /* first, copy P1K to PPK      */
 
-	PPK[5]  =  p1k[4]+iv16;             /* next,  add in IV16          */
+	PPK[5]  =  p1k[4] + iv16;             /* next,  add in IV16          */
 
 	/* Bijective non-linear mixing of the 96 bits of PPK[0..5]           */
 	PPK[0] +=    _S_(PPK[5] ^ TK16(0));   /* Mix key in each "round"     */
@@ -443,15 +443,13 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 	rc4key[2] = Lo8(iv16);
 	rc4key[3] = Lo8((PPK[5] ^ TK16(0)) >> 1);
 
-
 	/* Copy 96 bits of PPK[0..5] to RC4KEY[4..15]  (little-endian)       */
 	for (i = 0; i < 6; i++) {
-		rc4key[4+2*i] = Lo8(PPK[i]);
-		rc4key[5+2*i] = Hi8(PPK[i]);
+		rc4key[4 + 2 * i] = Lo8(PPK[i]);
+		rc4key[5 + 2 * i] = Hi8(PPK[i]);
 	}
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {																	/*  exclude ICV */
@@ -490,20 +488,20 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				prwskey = pattrib->dot118021x_UncstKey.skey;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-				iv = pframe+pattrib->hdrlen;
-				payload = pframe+pattrib->iv_len+pattrib->hdrlen;
+				iv = pframe + pattrib->hdrlen;
+				payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 				GET_TKIP_PN(iv, dot11txpn);
 
 				pnl = (u16)(dot11txpn.val);
-				pnh = (u32)(dot11txpn.val>>16);
+				pnh = (u32)(dot11txpn.val >> 16);
 
 				phase1((u16 *)&ttkey[0], prwskey, &pattrib->ta[0], pnh);
 
 				phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
 
-				if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
-					length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+				if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
+					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arc4_setkey(ctx, rc4key, 16);
@@ -511,7 +509,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 					arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 				} else {
-					length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 					arc4_setkey(ctx, rc4key, 16);
@@ -599,14 +597,14 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 
-			iv = pframe+prxattrib->hdrlen;
-			payload = pframe+prxattrib->iv_len+prxattrib->hdrlen;
-			length = ((union recv_frame *)precvframe)->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len;
+			iv = pframe + prxattrib->hdrlen;
+			payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
+			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 			GET_TKIP_PN(iv, dot11txpn);
 
 			pnl = (u16)(dot11txpn.val);
-			pnh = (u32)(dot11txpn.val>>16);
+			pnh = (u32)(dot11txpn.val >> 16);
 
 			phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
 			phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
@@ -721,8 +719,8 @@ static void construct_mic_iv(u8 *mic_iv,
 		for (i = 8; i < 14; i++)
 			mic_iv[i] = pn_vector[13 - i];          /* mic_iv[8:13] = PN[5:0] */
 		#endif
-		mic_iv[14] = (unsigned char) (payload_length / 256);
-		mic_iv[15] = (unsigned char) (payload_length % 256);
+		mic_iv[14] = (unsigned char)(payload_length / 256);
+		mic_iv[15] = (unsigned char)(payload_length % 256);
 }
 
 /************************************************/
@@ -787,7 +785,7 @@ static void construct_mic_header2(u8 *mic_header2,
 
 		if (!qc_exists && a4_exists) {
 			for (i = 0; i < 6; i++)
-				mic_header2[8+i] = mpdu[24+i];   /* A4 */
+				mic_header2[8 + i] = mpdu[24 + i];   /* A4 */
 		}
 
 		if (qc_exists && !a4_exists) {
@@ -797,7 +795,7 @@ static void construct_mic_header2(u8 *mic_header2,
 
 		if (qc_exists && a4_exists) {
 			for (i = 0; i < 6; i++)
-				mic_header2[8+i] = mpdu[24+i];   /* A4 */
+				mic_header2[8 + i] = mpdu[24 + i];   /* A4 */
 
 			mic_header2[14] = mpdu[30] & 0x0f;
 			mic_header2[15] = mpdu[31] & 0x00;
@@ -844,8 +842,8 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	for (i = 8; i < 14; i++)
 		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
 #endif
-	ctr_preload[14] =  (unsigned char) (c / 256); /* Ctr */
-	ctr_preload[15] =  (unsigned char) (c % 256);
+	ctr_preload[14] =  (unsigned char)(c / 256); /* Ctr */
+	ctr_preload[15] =  (unsigned char)(c % 256);
 }
 
 /************************************/
@@ -861,7 +859,7 @@ static void bitwise_xor(u8 *ina, u8 *inb, u8 *out)
 }
 
 static signed int aes_cipher(u8 *key, uint	hdrlen,
-			u8 *pframe, uint plen)
+			     u8 *pframe, uint plen)
 {
 	uint	qc_exists, a4_exists, i, j, payload_remainder,
 		num_blocks, payload_index;
@@ -880,7 +878,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	uint	frtype  = GetFrameType(pframe);
 	uint	frsubtype  = GetFrameSubType(pframe);
 
-	frsubtype = frsubtype>>4;
+	frsubtype = frsubtype >> 4;
 
 	memset((void *)mic_iv, 0, 16);
 	memset((void *)mic_header1, 0, 16);
@@ -895,9 +893,9 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	else
 		a4_exists = 1;
 
-	if (((frtype|frsubtype) == WIFI_DATA_CFACK) ||
-	    ((frtype|frsubtype) == WIFI_DATA_CFPOLL) ||
-	    ((frtype|frsubtype) == WIFI_DATA_CFACKPOLL)) {
+	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
+	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
+	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
 		qc_exists = 1;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
@@ -916,11 +914,11 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	}
 
 	pn_vector[0] = pframe[hdrlen];
-	pn_vector[1] = pframe[hdrlen+1];
-	pn_vector[2] = pframe[hdrlen+4];
-	pn_vector[3] = pframe[hdrlen+5];
-	pn_vector[4] = pframe[hdrlen+6];
-	pn_vector[5] = pframe[hdrlen+7];
+	pn_vector[1] = pframe[hdrlen + 1];
+	pn_vector[2] = pframe[hdrlen + 4];
+	pn_vector[3] = pframe[hdrlen + 5];
+	pn_vector[4] = pframe[hdrlen + 6];
+	pn_vector[5] = pframe[hdrlen + 7];
 
 	construct_mic_iv(mic_iv,
 			 qc_exists,
@@ -976,12 +974,12 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 
 	/* Insert MIC into payload */
 	for (j = 0; j < 8; j++)
-		pframe[payload_index+j] = mic[j];
+		pframe[payload_index + j] = mic[j];
 
 	payload_index = hdrlen + 8;
 	for (i = 0; i < num_blocks; i++) {
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, /* message, */
-				      pn_vector, i+1, frtype);
+				      pn_vector, i + 1, frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
 		bitwise_xor(aes_out, &pframe[payload_index], chain_buffer);
@@ -993,13 +991,13 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 		/* If there is a short final block, then pad it,*/
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, /* message, */
-				      pn_vector, num_blocks+1, frtype);
+				      pn_vector, num_blocks + 1, frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
 		for (j = 0; j < payload_remainder; j++)
-			padded_buffer[j] = pframe[payload_index+j];
+			padded_buffer[j] = pframe[payload_index + j];
 
 		aes128k128d(key, ctr_preload, aes_out);
 		bitwise_xor(aes_out, padded_buffer, chain_buffer);
@@ -1015,7 +1013,7 @@ static signed int aes_cipher(u8 *key, uint	hdrlen,
 	for (j = 0; j < 16; j++)
 		padded_buffer[j] = 0x00;
 	for (j = 0; j < 8; j++)
-		padded_buffer[j] = pframe[j+hdrlen+8+plen];
+		padded_buffer[j] = pframe[j + hdrlen + 8 + plen];
 
 	aes128k128d(key, ctr_preload, aes_out);
 	bitwise_xor(aes_out, padded_buffer, chain_buffer);
@@ -1055,12 +1053,12 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			prwskey = pattrib->dot118021x_UncstKey.skey;
 
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-			if ((curfragnum+1) == pattrib->nr_frags) {	/* 4 the last fragment */
-				length = pattrib->last_txcmdsz-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+			if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
+				length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 
 				aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 			} else {
-				length = pxmitpriv->frag_len-pattrib->hdrlen-pattrib->iv_len-pattrib->icv_len;
+				length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 
 				aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 				pframe += pxmitpriv->frag_len;
@@ -1072,7 +1070,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 }
 
 static signed int aes_decipher(u8 *key, uint	hdrlen,
-			 u8 *pframe, uint plen)
+			       u8 *pframe, uint plen)
 {
 	static u8 message[MAX_MSG_SIZE];
 	uint qc_exists, a4_exists, i, j, payload_remainder,
@@ -1093,7 +1091,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	uint frtype  = GetFrameType(pframe);
 	uint frsubtype  = GetFrameSubType(pframe);
 
-	frsubtype = frsubtype>>4;
+	frsubtype = frsubtype >> 4;
 
 	memset((void *)mic_iv, 0, 16);
 	memset((void *)mic_header1, 0, 16);
@@ -1105,9 +1103,9 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* start to decrypt the payload */
 
-	num_blocks = (plen-8) / 16; /* plen including LLC, payload_length and mic) */
+	num_blocks = (plen - 8) / 16; /* plen including LLC, payload_length and mic) */
 
-	payload_remainder = (plen-8) % 16;
+	payload_remainder = (plen - 8) % 16;
 
 	pn_vector[0]  = pframe[hdrlen];
 	pn_vector[1]  = pframe[hdrlen + 1];
@@ -1121,9 +1119,9 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	else
 		a4_exists = 1;
 
-	if (((frtype|frsubtype) == WIFI_DATA_CFACK) ||
-	    ((frtype|frsubtype) == WIFI_DATA_CFPOLL) ||
-	    ((frtype|frsubtype) == WIFI_DATA_CFACKPOLL)) {
+	if (((frtype | frsubtype) == WIFI_DATA_CFACK) ||
+	    ((frtype | frsubtype) == WIFI_DATA_CFPOLL) ||
+	    ((frtype | frsubtype) == WIFI_DATA_CFACKPOLL)) {
 		qc_exists = 1;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
@@ -1162,13 +1160,13 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		/* If there is a short final block, then pad it,*/
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, pframe, pn_vector,
-				      num_blocks+1, frtype);
+				      num_blocks + 1, frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
 		for (j = 0; j < payload_remainder; j++)
-			padded_buffer[j] = pframe[payload_index+j];
+			padded_buffer[j] = pframe[payload_index + j];
 
 		aes128k128d(key, ctr_preload, aes_out);
 		bitwise_xor(aes_out, padded_buffer, chain_buffer);
@@ -1177,25 +1175,25 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	}
 
 	/* start to calculate the mic */
-	if ((hdrlen + plen+8) <= MAX_MSG_SIZE)
-		memcpy((void *)message, pframe, (hdrlen + plen+8)); /* 8 is for ext iv len */
+	if ((hdrlen + plen + 8) <= MAX_MSG_SIZE)
+		memcpy((void *)message, pframe, (hdrlen + plen + 8)); /* 8 is for ext iv len */
 
 	pn_vector[0] = pframe[hdrlen];
-	pn_vector[1] = pframe[hdrlen+1];
-	pn_vector[2] = pframe[hdrlen+4];
-	pn_vector[3] = pframe[hdrlen+5];
-	pn_vector[4] = pframe[hdrlen+6];
-	pn_vector[5] = pframe[hdrlen+7];
+	pn_vector[1] = pframe[hdrlen + 1];
+	pn_vector[2] = pframe[hdrlen + 4];
+	pn_vector[3] = pframe[hdrlen + 5];
+	pn_vector[4] = pframe[hdrlen + 6];
+	pn_vector[5] = pframe[hdrlen + 7];
 
-	construct_mic_iv(mic_iv, qc_exists, a4_exists, message, plen-8, pn_vector, frtype);
+	construct_mic_iv(mic_iv, qc_exists, a4_exists, message, plen - 8, pn_vector, frtype);
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 	construct_mic_header1(mic_header1, hdrlen, message, frtype);
 	/*  add for CONFIG_IEEE80211W, none 11w also can use */
 	construct_mic_header2(mic_header2, message, a4_exists, qc_exists);
 
-	payload_remainder = (plen-8) % 16;
-	num_blocks = (plen-8) / 16;
+	payload_remainder = (plen - 8) % 16;
+	num_blocks = (plen - 8) / 16;
 
 	/* Find start of payload */
 	payload_index = (hdrlen + 8);
@@ -1230,11 +1228,11 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 
 	/* Insert MIC into payload */
 	for (j = 0; j < 8; j++)
-		message[payload_index+j] = mic[j];
+		message[payload_index + j] = mic[j];
 
 	payload_index = hdrlen + 8;
 	for (i = 0; i < num_blocks; i++) {
-		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector, i+1,
+		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector, i + 1,
 				      frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 		aes128k128d(key, ctr_preload, aes_out);
@@ -1247,13 +1245,13 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 		/* If there is a short final block, then pad it,*/
 		/* encrypt it and copy the unpadded part back   */
 		construct_ctr_preload(ctr_preload, a4_exists, qc_exists, message, pn_vector,
-				      num_blocks+1, frtype);
+				      num_blocks + 1, frtype);
 		/*  add for CONFIG_IEEE80211W, none 11w also can use */
 
 		for (j = 0; j < 16; j++)
 			padded_buffer[j] = 0x00;
 		for (j = 0; j < payload_remainder; j++)
-			padded_buffer[j] = message[payload_index+j];
+			padded_buffer[j] = message[payload_index + j];
 
 		aes128k128d(key, ctr_preload, aes_out);
 		bitwise_xor(aes_out, padded_buffer, chain_buffer);
@@ -1268,7 +1266,7 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 	for (j = 0; j < 16; j++)
 		padded_buffer[j] = 0x00;
 	for (j = 0; j < 8; j++)
-		padded_buffer[j] = message[j+hdrlen+8+plen-8];
+		padded_buffer[j] = message[j + hdrlen + 8 + plen - 8];
 
 	aes128k128d(key, ctr_preload, aes_out);
 	bitwise_xor(aes_out, padded_buffer, chain_buffer);
@@ -1355,7 +1353,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 
-			length = ((union recv_frame *)precvframe)->u.hdr.len-prxattrib->hdrlen-prxattrib->iv_len;
+			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
@@ -1380,7 +1378,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	__le16 le_tmp;
 	__le64 le_tmp64;
 
-	ori_len = pattrib->pkt_len-WLAN_HDR_A3_LEN+BIP_AAD_SIZE;
+	ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
 	BIP_AAD = rtw_zmalloc(ori_len);
 
 	if (!BIP_AAD)
@@ -1391,28 +1389,28 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	/* mapping to wlan header */
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 	/* save the frame body + MME */
-	memcpy(BIP_AAD+BIP_AAD_SIZE, pframe+WLAN_HDR_A3_LEN, pattrib->pkt_len-WLAN_HDR_A3_LEN);
+	memcpy(BIP_AAD + BIP_AAD_SIZE, pframe + WLAN_HDR_A3_LEN, pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* find MME IE pointer */
-	p = rtw_get_ie(BIP_AAD+BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len-WLAN_HDR_A3_LEN);
+	p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* Baron */
 	if (p) {
 		u16 keyid = 0;
 		u64 temp_ipn = 0;
 		/* save packet number */
-		memcpy(&le_tmp64, p+4, 6);
+		memcpy(&le_tmp64, p + 4, 6);
 		temp_ipn = le64_to_cpu(le_tmp64);
 		/* BIP packet number should bigger than previous BIP packet */
 		if (temp_ipn <= pmlmeext->mgnt_80211w_IPN_rx)
 			goto BIP_exit;
 
 		/* copy key index */
-		memcpy(&le_tmp, p+2, 2);
+		memcpy(&le_tmp, p + 2, 2);
 		keyid = le16_to_cpu(le_tmp);
 		if (keyid != padapter->securitypriv.dot11wBIPKeyid)
 			goto BIP_exit;
 
 		/* clear the MIC field of MME to zero */
-		memset(p+2+len-8, 0, 8);
+		memset(p + 2 + len - 8, 0, 8);
 
 		/* conscruct AAD, copy frame control field */
 		memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
@@ -1420,14 +1418,14 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, pwlanhdr->addr1, 18);
 
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
 		/* MIC field should be last 8 bytes of packet (packet without FCS) */
-		if (!memcmp(mic, pframe+pattrib->pkt_len-8, 8)) {
+		if (!memcmp(mic, pframe + pattrib->pkt_len - 8, 8)) {
 			pmlmeext->mgnt_80211w_IPN_rx = temp_ipn;
 			res = _SUCCESS;
 		} else {
@@ -1573,7 +1571,7 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 	if (securitypriv->btkip_countermeasure) {
 		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
 
-		if (passing_ms > 60*1000) {
+		if (passing_ms > 60 * 1000) {
 			netdev_dbg(adapter->pnetdev,
 				   "%s(%s) countermeasure time:%lus > 60s\n",
 				   caller, ADPT_ARG(adapter),
-- 
2.45.3

