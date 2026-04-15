Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9C035B649
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776278855; cv=none; b=CSxQhNu6/Pec+cURYtTT2+583YsQEukJdMwQn2mfFYSr0f6Jzoy+ZJ2f96GKj2LU7DsOKNWc5Pm7ixeIw1wjKtc4aMTICyvTlHB40+NMKwmYGZ4V8SqyIvwd3UPFh1kKyxlfjkk9GJYYQLBzstptsqLXIS9tipifTm5I38AXqWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776278855; c=relaxed/simple;
	bh=3UYWonrhpLRKFUbRV+51pP/n3K79aGN+ZBzAx10NcWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QDXxh3mfGl5Clpzpxsq3lP6U6MH1wxbQ50tf0fFQW7ImBZWsZLVaKdeeIx9GxU8lvUos7mVIoiHXB1bvbhl5EJuNaKc7yXLhvNsPuzIJSIZYuOuKaz5MQPXRYuzNydz44TzOUtuUUJRqJmyQ90PbgYwV2L7SuYgoC4I8BP1+z4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiUxOfKt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiUxOfKt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488b150559bso56306315e9.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776278852; x=1776883652; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0nwJhwUJsav6HVUL3AaAxSVFrQ/sv4ki5nzAIqwDFlI=;
        b=YiUxOfKtsD0KpuArU/iMfaOEt/FJZG/+nl83vXrgsQZ017RsfWe/0YCbYrrDUIw0sG
         Q1Fz7wdfMHbbMM47Kg0xVVQ4wpiFW/iQCkVuG2meB7kzU/2SvgSQ5Y5PLIjwjv1iu7Zy
         Ix2TxcafmpwZFFkFzNmBzMBHzk1nB64MkEx3uXonE/7QM4irFuC3DEU1WoZXdgfR/O5g
         oj4UftY+X4sSJsSu1a1NvIOnlQ1+cKg/3sy2drMxjDqfpTfPJPGvvl1c1tZG8K/eIpDk
         ch+uSQ/5ZEoPbRmnN4YARY0KWzUNmaKqZjzVfc5t1/HN7CbMv2iN0SoT68WZ9bt4cAWl
         lgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776278852; x=1776883652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nwJhwUJsav6HVUL3AaAxSVFrQ/sv4ki5nzAIqwDFlI=;
        b=rJm1uhnjuAq13haNu6eW702LdWuykLvNyz6xg90LSIFkPrX313rxrpTmIqNFcTKGsN
         EWvY44Hb3HIajoqLdaZOESSVY+nKIMeh7N8kwymKB5YLxmxDnqYfh2AMKVilToeijCJ+
         WgTubKRatODIFhKjFnMNKhM46VQkACNmr2LIaIy5E7ZMWXSUtYMpX6r65516zVZRo1AY
         b6CGEf9zgTy3DGlqNIhCsNhsz3Hl9YPKmQhW1DCnBIl5WVUR6sNK+RxytfxvnA8MHuvv
         PopcYGRN6yj308UGtM71kIQ/Dr/tP80DOdlGkRG2ouwvPRsT5QxyUx8UuzdQzfFMiqOG
         TmKg==
X-Gm-Message-State: AOJu0YyVJjeCfet4wOEjkuhzBuXDufaGeGqSJgvkuB07BqeNbaK4Xziz
	iIWYCdkACKhj/rjGAE/vSPOIHThFVx090RmlM+iS2x58lRfAqWrfE62j
X-Gm-Gg: AeBDiesIK8F5/+itXkyiDRTPMUlhrbkXH31yzKqgmBBDZnaBsgfeeKmNXD3By2LWDTY
	WTFRlkPOsYvJG9KyNABxn5PuG2zxCYj660q1wy+8Bj6hmN9aLBAjfq7KpHLIYiE7rtqyCWbgwO3
	67foPBdHtIEffuY0oz7/n9a5ksW2qb5rO3hoVl/C4qEdPZm47m5I9aL2KjDuEVxwb2Kr5I6T7z4
	Hus34VuuzFkLp8CT3wS3OgX4irJ5qOol3ziQSO07g/Z+M/kGaKqYb0rORl6COuQcOYL+jLPK/Az
	ZD7IIM1vdqQp5YyIxU3b4EShuUJhEnpr4BJA3+x4Uh7asQsiPUBiD1y4DEx6Tx0Iz0jhQTRqTCv
	ohw9BFG+RSI3siKP6UG9RKbEZwHhInHTOzGm6w+ViPpW70DIvaXlDY0+tgKyBQQZhKG9z5/RTdP
	1Bt3R4fDGZF+Lcw+MHig==
X-Received: by 2002:a05:600c:a105:b0:486:d76c:fa57 with SMTP id 5b1f17b1804b1-488d685b75emr223265165e9.17.1776278851571;
        Wed, 15 Apr 2026 11:47:31 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e9c668sm40311565e9.4.2026.04.15.11.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:47:31 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	nathan@kernel.org,
	arthur.stupa@gmail.com,
	sameekshasankpal@gmail.com,
	ebiggers@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH] staging: r8723bs: reduce nesting
Date: Wed, 15 Apr 2026 22:47:27 +0400
Message-ID: <20260415184727.285753-1-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduce nesting by early returns.

Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 299 +++++++++---------
 1 file changed, 149 insertions(+), 150 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..412edfdf9636 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -453,47 +453,45 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
 
 	/* 4 start to encrypt each fragment */
-	if (pattrib->encrypt == _TKIP_) {
+	if (pattrib->encrypt != _TKIP_)
+		return _SUCCESS;
 
-		{
-			if (is_multicast_ether_addr(pattrib->ra))
-				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
-			else
-				prwskey = pattrib->dot118021x_UncstKey.skey;
+	if (is_multicast_ether_addr(pattrib->ra))
+		prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+	else
+		prwskey = pattrib->dot118021x_UncstKey.skey;
 
-			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-				iv = pframe + pattrib->hdrlen;
-				payload = pframe + pattrib->iv_len + pattrib->hdrlen;
+	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+		iv = pframe + pattrib->hdrlen;
+		payload = pframe + pattrib->iv_len + pattrib->hdrlen;
 
-				GET_TKIP_PN(iv, dot11txpn);
+		GET_TKIP_PN(iv, dot11txpn);
 
-				pnl = (u16)(dot11txpn.val);
-				pnh = (u32)(dot11txpn.val >> 16);
+		pnl = (u16)(dot11txpn.val);
+		pnh = (u32)(dot11txpn.val >> 16);
 
-				phase1((u16 *)&ttkey[0], prwskey, &pattrib->ta[0], pnh);
+		phase1((u16 *)&ttkey[0], prwskey, &pattrib->ta[0], pnh);
 
-				phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
+		phase2(&rc4key[0], prwskey, (u16 *)&ttkey[0], pnl);
 
-				if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-					length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
-					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
+		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
+			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
-					arc4_setkey(ctx, rc4key, 16);
-					arc4_crypt(ctx, payload, payload, length);
-					arc4_crypt(ctx, payload + length, crc.f1, 4);
+			arc4_setkey(ctx, rc4key, 16);
+			arc4_crypt(ctx, payload, payload, length);
+			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
-				} else {
-					length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
-					crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
+		} else {
+			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+			crc.f0 = cpu_to_le32(~crc32_le(~0, payload, length));
 
-					arc4_setkey(ctx, rc4key, 16);
-					arc4_crypt(ctx, payload, payload, length);
-					arc4_crypt(ctx, payload + length, crc.f1, 4);
+			arc4_setkey(ctx, rc4key, 16);
+			arc4_crypt(ctx, payload, payload, length);
+			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
-					pframe += pxmitpriv->frag_len;
-					pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
-				}
-			}
+			pframe += pxmitpriv->frag_len;
+			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
 		}
 	}
 	return res;
@@ -521,82 +519,82 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 
 	/* 4 start to decrypt recvframe */
-	if (prxattrib->encrypt == _TKIP_) {
-		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-		if (stainfo) {
-			if (is_multicast_ether_addr(prxattrib->ra)) {
-				static unsigned long start;
-				static u32 no_gkey_bc_cnt;
-				static u32 no_gkey_mc_cnt;
-
-				if (!psecuritypriv->binstallGrpkey) {
-					res = _FAIL;
-
-					if (start == 0)
-						start = jiffies;
-
-					if (is_broadcast_mac_addr(prxattrib->ra))
-						no_gkey_bc_cnt++;
-					else
-						no_gkey_mc_cnt++;
-
-					if (jiffies_to_msecs(jiffies - start) > 1000) {
-						if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-							netdev_dbg(padapter->pnetdev,
-								   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-								   FUNC_ADPT_ARG(padapter),
-								   no_gkey_bc_cnt,
-								   no_gkey_mc_cnt);
-						}
-						start = jiffies;
-						no_gkey_bc_cnt = 0;
-						no_gkey_mc_cnt = 0;
-					}
-					goto exit;
-				}
+	if (prxattrib->encrypt != _TKIP_)
+		return _SUCCESS;
+
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (!stainfo)
+		return _FAIL;
+
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
+
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
+
+			if (start == 0)
+				start = jiffies;
 
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
+
+			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
 				}
-				start = 0;
+				start = jiffies;
 				no_gkey_bc_cnt = 0;
 				no_gkey_mc_cnt = 0;
-
-				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
+			goto exit;
+		}
 
-			iv = pframe + prxattrib->hdrlen;
-			payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+			netdev_dbg(padapter->pnetdev,
+				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_ARG(padapter),
+				   no_gkey_bc_cnt,
+				   no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
-			GET_TKIP_PN(iv, dot11txpn);
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
+	} else {
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+	}
 
-			pnl = (u16)(dot11txpn.val);
-			pnh = (u32)(dot11txpn.val >> 16);
+	iv = pframe + prxattrib->hdrlen;
+	payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
+	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
-			phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
-			phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
+	GET_TKIP_PN(iv, dot11txpn);
 
-			/* 4 decrypt payload include icv */
+	pnl = (u16)(dot11txpn.val);
+	pnh = (u32)(dot11txpn.val >> 16);
 
-			arc4_setkey(ctx, rc4key, 16);
-			arc4_crypt(ctx, payload, payload, length);
+	phase1((u16 *)&ttkey[0], prwskey, &prxattrib->ta[0], pnh);
+	phase2(&rc4key[0], prwskey, (unsigned short *)&ttkey[0], pnl);
 
-			*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
+	/* 4 decrypt payload include icv */
 
-			if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
-			    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
-				res = _FAIL;
-		} else {
-			res = _FAIL;
-		}
-	}
+	arc4_setkey(ctx, rc4key, 16);
+	arc4_crypt(ctx, payload, payload, length);
+
+	*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
+
+	if (crc[3] != payload[length - 1] || crc[2] != payload[length - 2] ||
+	    crc[1] != payload[length - 3] || crc[0] != payload[length - 4])
+		res = _FAIL;
 exit:
 	return res;
 }
@@ -969,24 +967,25 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	pframe = ((struct xmit_frame *)pxmitframe)->buf_addr + hw_hdr_offset;
 
 	/* 4 start to encrypt each fragment */
-	if (pattrib->encrypt == _AES_) {
-		if (is_multicast_ether_addr(pattrib->ra))
-			prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
-		else
-			prwskey = pattrib->dot118021x_UncstKey.skey;
+	if (pattrib->encrypt != _AES_)
+		return _SUCCESS;
 
-		for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-			if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
-				length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+	if (is_multicast_ether_addr(pattrib->ra))
+		prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
+	else
+		prwskey = pattrib->dot118021x_UncstKey.skey;
 
-				aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
-			} else {
-				length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+	for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
+		if ((curfragnum + 1) == pattrib->nr_frags) {	/* 4 the last fragment */
+			length = pattrib->last_txcmdsz - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
 
-				aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
-				pframe += pxmitpriv->frag_len;
-				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
-			}
+			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
+		} else {
+			length = pxmitpriv->frag_len - pattrib->hdrlen - pattrib->iv_len - pattrib->icv_len;
+
+			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
+			pframe += pxmitpriv->frag_len;
+			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
 		}
 	}
 	return res;
@@ -1213,69 +1212,69 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 	/* 4 start to encrypt each fragment */
-	if (prxattrib->encrypt == _AES_) {
-		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-		if (stainfo) {
-			if (is_multicast_ether_addr(prxattrib->ra)) {
-				static unsigned long start;
-				static u32 no_gkey_bc_cnt;
-				static u32 no_gkey_mc_cnt;
-
-				if (!psecuritypriv->binstallGrpkey) {
-					res = _FAIL;
-
-					if (start == 0)
-						start = jiffies;
-
-					if (is_broadcast_mac_addr(prxattrib->ra))
-						no_gkey_bc_cnt++;
-					else
-						no_gkey_mc_cnt++;
-
-					if (jiffies_to_msecs(jiffies - start) > 1000) {
-						if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-							netdev_dbg(padapter->pnetdev,
-								   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-								   FUNC_ADPT_ARG(padapter),
-								   no_gkey_bc_cnt,
-								   no_gkey_mc_cnt);
-						}
-						start = jiffies;
-						no_gkey_bc_cnt = 0;
-						no_gkey_mc_cnt = 0;
-					}
-
-					goto exit;
-				}
+	if (prxattrib->encrypt != _AES_)
+		return _SUCCESS;
+
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (!stainfo)
+		return _FAIL;
+
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
 
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
+
+			if (start == 0)
+				start = jiffies;
+
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
+
+			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
 						   FUNC_ADPT_ARG(padapter),
 						   no_gkey_bc_cnt,
 						   no_gkey_mc_cnt);
 				}
-				start = 0;
+				start = jiffies;
 				no_gkey_bc_cnt = 0;
 				no_gkey_mc_cnt = 0;
-
-				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-					res = _FAIL;
-					goto exit;
-				}
-			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 
-			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+			goto exit;
+		}
 
-			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+			netdev_dbg(padapter->pnetdev,
+				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_ARG(padapter),
+				   no_gkey_bc_cnt,
+				   no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
-		} else {
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
+		if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
 			res = _FAIL;
+			goto exit;
 		}
+	} else {
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
+
+	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+
+	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+
 exit:
 	return res;
 }
-- 
2.51.0

