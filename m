Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F134766AE
	for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 14:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397601; cv=none; b=mmeP8goOb9TxEEeziTOo0UQAQQpyNZNPGYCsxpouIL0RqcPac4qdbRQ7ZUovq/JmFP9Y+0MWe5zVvZe3PAret4CMfeANAL12rT2ArsgFj3Kwcl9BPeXrArAOT05QiGQ6knK+S1/MBsJ5Rxr7G+eCk7BzVcWVR/KilFH7ghcMPQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397601; c=relaxed/simple;
	bh=N5IqWztkSD6d6jT8YO/ZSljhY36WERGkX/mWHbGSs8o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sT5uM2oPXwXr8OtCOY4/g8sLhXwa5v+c5LT64wXEokGLMDR0e07EgbKsn66vl/EXaEA6TFzQ3KPQrBJC/7zx0I8BMoJfevgj19B0u6t/8vFd0RJHl+IPLfPPWoShxvfrPPVwyFE84HjdHsvKgyMffFI8fUtyEg2cCg3+79sJAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvnJp6AP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvnJp6AP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so19401295e9.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Sep 2026 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397596; x=1790002396; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vi+kgOEwQ6B298JA+n1SDDNCDc6Yrj8qSoia7I1Zars=;
        b=VvnJp6APpjN2EGtBzGQj7gGXnybmz3nf0RuIIJMArgpr3AcSj1vG45qmLc12oE+zdW
         SFXtKADARxfPvWmYdguTEq0KCt97DqYm+33wWv2uru1ObsvQNu04U34Ret8188rljZgX
         LWMfocVuY2XWUMSTLDhlCS5/kWOSUtpipv2SoPmcCyxQOfrlNLuY7krFKY5nD0tSRA0l
         SJLqDwld0KQiZUr9lHaCcuLV56qOdoLxcKXXAf1dM2AYW9lwtw+QDamTB17Mdf2AFeY3
         dgTFifRU/18ZMqhMKkSrFNW9cWynblraSH2sUnXc21VukCmOvMGQYKDcthmCaP4Gbt9+
         E/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397596; x=1790002396;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vi+kgOEwQ6B298JA+n1SDDNCDc6Yrj8qSoia7I1Zars=;
        b=NCqSLUjbI0cE51fnnneOgw1Oe4dnyrPSpldpk7YD1dFOrGHpWkTPryoiMARbANoZ62
         M0XpbjXzwfjyVVITYrSoMkUQL45p1iErjQ6uofSxBPK2LLfjIdIG+Du1cJcER2ulJppQ
         MPyZGCvBmWUbUg5XL4mHBZYuQ1x+2kyOUJkfOyZ4TZq9vb+O0F6RuVoLLVUp0NWVw4eJ
         AKNfKCEGhXHgURJqygHwgh3/GpwXsrzhykdXP0GeoL/GYKQhGFYUUEFB9I4kUoEOgfR4
         gPr0QTmo35+kKxRC2cPwWuUe6YxT6uDJw3yRjY6aZtMp1H+8eoXstzir4uKKAlNfRtVp
         0tPw==
X-Gm-Message-State: AFuF++nGoNhxkMa95H/TmYFYjF2tTfwarj6dvWZsJyhKqumUa+3h35SU
	opfVXNpV7PYx6IAMk04GGTaMrRBu99mk+RwnuB9vg8XmibUou1CkEWI0
X-Gm-Gg: AYBFou0HQt62bI01yFkzUeMKNtExnmW6TrhJdRBnbM++Sw58CP/LgUvUa3DJLv3Zi+f
	IrgwYM+84qovRJ6ihMtrfkMTsZej4I1nQ2UTjRkGaHWSJ7Xp/SCzn9mmlLXZDPbvM6VPFf6LXn+
	LYPuqzyQvwOTqPG+XXjYNILTRwcjd//zmmhuxsblMUV5rbsOGDli9kuKS2J6kINBZHlXC69gDpp
	GeXxLcU+WkUT12dRwWcexA6dCRK3WXDfo1MlTsDDVVThuiUIKBbWFVejRTDIbgI2OnywmdyftBA
	Tz34C/MpWtk8qoq56vilqnUwBkMgvuW4xwHodAQEM/s1qeBRk2CUuZ3FlwNSifjsrYBrk3Pq2+k
	PdznI6SCwgtDv9W5wrA4025E9mJzD7TEuC1ccioEge5yOHKr8aaFfi611DInBHml3qQxSGdkIBs
	OqxBqRfYgli+EyoVFKQua9rNG841AIoPZ3YDOeBpCbANEAIy24G3KDiiovI5EXgYqHpkNghSi4k
	X5SJuFq45dL6wN57hnTPA==
X-Received: by 2002:a7b:cb87:0:b0:49e:718f:4f2e with SMTP id 5b1f17b1804b1-49e76021236mr55872585e9.3.1789397596079;
        Mon, 14 Sep 2026 07:53:16 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e6f1sm26812525f8f.6.2026.09.14.07.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:53:15 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix lines exceeding 100 columns in rtw_security.c
Date: Mon, 14 Sep 2026 14:52:56 +0000
Message-ID: <20260914145256.996968-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reformat long lines in rtw_security.c to fit within the 100-column
limit by splitting function arguments, expressions, and moving

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 94 +++++++++++++------
 1 file changed, 66 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 2217cffac..208aa0f31 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -34,7 +34,8 @@ const char *security_type_str(u8 value)
 
 /* Need to consider the fragment  situation */
 void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	union {
 		__le32 f0;
 		unsigned char f1[4];
@@ -64,12 +65,17 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 			iv = pframe + pattrib->hdrlen;
 			memcpy(&wepkey[0], iv, 3);
-			memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength);
+			int idx = psecuritypriv->dot11PrivacyKeyIndex;
+
+			memcpy(&wepkey[3],
+			       &psecuritypriv->dot11DefKey[idx].skey[0],
+			       keylength);
 			payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
 			if ((curfragnum + 1) == pattrib->nr_frags) {	/* the last fragment */
 
-				length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+				length = pattrib->last_txcmdsz - pattrib->hdrlen -
+					 pattrib->iv_len - pattrib->icv_len;
 
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
@@ -78,7 +84,8 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 			} else {
-				length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+				length = pxmitpriv->frag_len - pattrib->hdrlen -
+					 pattrib->iv_len - pattrib->icv_len;
 				crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 				arc4_setkey(ctx, wepkey, 3 + keylength);
 				arc4_crypt(ctx, payload, payload, length);
@@ -112,9 +119,16 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
-		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
-		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		/*
+		 *  memcpy(&wepkey[3],
+		 *         &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0],
+		 *         keylength);
+		 */
+		memcpy(&wepkey[3],
+		       &psecuritypriv->dot11DefKey[keyindex].skey[0],
+		       keylength);
+		length = ((union recv_frame *)precvframe)->u.hdr.len -
+			 prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
 
@@ -157,7 +171,8 @@ void rtw_secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
-		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) | ((pmicdata->L & 0x00ff00ff) << 8);
+		pmicdata->R ^= ((pmicdata->L & 0xff00ff00) >> 8) |
+			 ((pmicdata->L & 0x00ff00ff) << 8);
 		pmicdata->L += pmicdata->R;
 		pmicdata->R ^= ROL32(pmicdata->L, 3);
 		pmicdata->L += pmicdata->R;
@@ -418,7 +433,8 @@ static void phase2(u8 *rc4key, const u8 *tk, const u16 *p1k, u16 iv16)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8 rc4key[16];
@@ -467,7 +483,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 		phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
 
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pattrib->last_txcmdsz - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -475,7 +492,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 		} else {
-			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pxmitpriv->frag_len - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
 			arc4_setkey(ctx, rc4key, 16);
@@ -491,7 +509,8 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
-{																	/*  exclude ICV */
+{
+	/*  exclude ICV */
 	u16 pnl;
 	u32 pnh;
 	u8   rc4key[16];
@@ -536,7 +555,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -550,7 +570,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -566,7 +587,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 
 	iv = pframe + prxattrib->hdrlen;
 	payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	GET_TKIP_PN(iv, dot11txpn);
 
@@ -757,10 +779,12 @@ static void construct_ctr_preload(u8 *ctr_preload,
 	if (frtype == WIFI_MGT_TYPE)
 		ctr_preload[1] |= BIT(4);
 
+	/* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
 	for (i = 2; i < 8; i++)
-		ctr_preload[i] = mpdu[i + 8];                       /* ctr_preload[2:7] = A2[0:5] = mpdu[10:15] */
+		ctr_preload[i] = mpdu[i + 8];
+	/* ctr_preload[8:13] = PN[5:0] */
 	for (i = 8; i < 14; i++)
-		ctr_preload[i] =    pn_vector[13 - i];          /* ctr_preload[8:13] = PN[5:0] */
+		ctr_preload[i] =    pn_vector[13 - i];
 	ctr_preload[14] = (unsigned char)(c / 256); /* Ctr */
 	ctr_preload[15] = (unsigned char)(c % 256);
 }
@@ -952,11 +976,13 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
 		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pattrib->last_txcmdsz - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 		} else {
-			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			length = pxmitpriv->frag_len - pattrib->hdrlen -
+				 pattrib->iv_len - pattrib->icv_len;
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 			pframe += pxmitpriv->frag_len;
@@ -1205,7 +1231,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT
+						   " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
@@ -1220,7 +1247,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_FMT
+				   " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 				   FUNC_ADPT_ARG(padapter),
 				   no_gkey_bc_cnt,
 				   no_gkey_mc_cnt);
@@ -1238,7 +1266,8 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
 
-	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
 
 	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
@@ -1269,9 +1298,14 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 	/* mapping to wlan header */
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 	/* save the frame body + MME */
-	memcpy(BIP_AAD + BIP_AAD_SIZE, pframe + WLAN_HDR_A3_LEN, pattrib->pkt_len - WLAN_HDR_A3_LEN);
+	memcpy(BIP_AAD + BIP_AAD_SIZE,
+	       pframe + WLAN_HDR_A3_LEN,
+	       pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* find MME IE pointer */
-	p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE, WLAN_EID_MMIE, &len, pattrib->pkt_len - WLAN_HDR_A3_LEN);
+	p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE,
+		       WLAN_EID_MMIE,
+		       &len,
+		       pattrib->pkt_len - WLAN_HDR_A3_LEN);
 	/* Baron */
 	if (p) {
 		u16 keyid = 0;
@@ -1300,8 +1334,10 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		/* conscruct AAD, copy address 1 to address 3 */
 		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
-		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
-			, BIP_AAD, ori_len, mic))
+		int keyid = padapter->securitypriv.dot11wBIPKeyid;
+		u8 *bip_key = padapter->securitypriv.dot11wBIPKey[keyid].skey;
+
+		if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
 			goto BIP_exit;
 
 		/* MIC field should be last 8 bytes of packet (packet without FCS) */
@@ -1430,7 +1466,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &adapter->securitypriv;
 	signed int keyid;
 
-	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) || (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
+	if ((securitypriv->dot11_privacy_algrthm == _WEP40_) ||
+	    (securitypriv->dot11_privacy_algrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
@@ -1448,7 +1485,8 @@ u8 rtw_handle_tkip_countermeasure(struct adapter *adapter, const char *caller)
 	u8 status = _SUCCESS;
 
 	if (securitypriv->btkip_countermeasure) {
-		unsigned long passing_ms = jiffies_to_msecs(jiffies - securitypriv->btkip_countermeasure_time);
+		unsigned long elapsed = jiffies - securitypriv->btkip_countermeasure_time;
+		unsigned long passing_ms = jiffies_to_msecs(elapsed);
 
 		if (passing_ms > 60 * 1000) {
 			netdev_dbg(adapter->pnetdev,
-- 
2.43.0

