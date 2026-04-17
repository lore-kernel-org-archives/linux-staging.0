Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FA2DEA61
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419537; cv=none; b=khIGp51TrCB8804foEh3km2jcVBcjvS0yoWc8XBjJF4I51hYSvTopfTkgMCMhiMktFbzucJXdpkSKFp4Rn12KE8n9u+i4mHrrbgQchZf7RTtljAbECUwItDhP3jMFX0v250WKl7XhKZB56EqUgrvJhzvElOyhYyhQ6g/tYr+kWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419537; c=relaxed/simple;
	bh=yr9hpcefTpgDAxjTv2InilnrEKuRm5a8VFfH95C+g20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzEjlKU3DAV25mMaSW9U9zkPRgaSGJe9r9hrDVSnvHNAkliqkzFY2pnioVwwPx70Zou2dydr9Pr7q7VwnxOG+lBLbutFQ6mdTLFTpMLbQgNXqU9II5cPbrYAkTHWp7+2uEZDKSNb1RY6BBubWpCknmBLEI4FU7Ft4BA6tT1HQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sMMkr9hq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sMMkr9hq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so207486f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776419534; x=1777024334; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMbR6aAXTCuyPAmN58Jxxr71oeAqRD0VzttHJfA2KIA=;
        b=sMMkr9hqQD1r1P+gnSb7m0868qjVIa7AfzbvgO7ixBEL5y23Y14iy5arNmF1eJCWP0
         g+9DCxAYcAfB6gYBMESHSH5Tt/t4uliB36AUp4v6GdiwKD6SJ3GXkKvZWy+6PIIkbm2J
         VszktmRrVQ2OBSmmaMw+VlP58sU9ltXNYj5Dqpv/MmkiiyYtiQRpmSWgfvY4QqmUsRqL
         3UQRcOqCWB+/zgGAuW8F3mbzBQcmB6q222kPWEHhu2PJ0gvkIzRxqY4PHS0i8oei7BwQ
         70wehF95Akk0D7rm3VtUQgMul5FmtXkRoWJXP3gr+jGh5BDccP9fQMmxDzuA3IC+AY1w
         XWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419534; x=1777024334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xMbR6aAXTCuyPAmN58Jxxr71oeAqRD0VzttHJfA2KIA=;
        b=ep8Hi2ViAUpKv8LW7zS4fHNoAobv06Lutheive3nLfpD9BxGwQpjT2bMe2I1RUoAZi
         fsZEg8razbiVKacXx3Z9Vo7F8J9j989lp0iBSpZ6theBLPoiCn/TdaJr5pJvP+NsIleU
         14C7q+g39Yp38L5kls/6U7+cV58INjlWUKaSjpAOdRDgvSjf+3mJD4frHK2PEdS6dyjd
         RsqXMf6m0LkNtE72odWKjbDIlV6xFe0Z+emWflARuBFhgaXR57F3MW597jNuEYIO9L0N
         tMOl+g9l6/to7MnqvH+/6eEwCIbiZdmdLKvX85oRpTAAkdD7mCY6ooLzYLxi4CpOsxMf
         bEew==
X-Gm-Message-State: AOJu0YzNckq8wTXK7zDOyncarMSb3iG55HTl64yoaL+yiEGXyvgInuP+
	0c2kQj19ZOkWAjV2qGoM4bxoeXq2hCc5inwbkzHh6s9FU0wF9X+qTQQM
X-Gm-Gg: AeBDievxqj1UWGnP3CPLBVqO/y+hXjl0LlozkLqd5HegVOiJUoDQw+869/UBPciKz5Q
	ml0X1KrpU0OPHbS/0fci2QM8fENDnX+qqtt1ybJYjBIEauVbX9Lo8WwF0u4YYN5omsqpNaUM1Cr
	nSearNxvAFtAysEsGe1lL27wC/0c61VnpF+Cr1qynupLkahcR6RvJ8YUtbFMhebyzW4CpdY5d4c
	AG+Nyry5bx9Qafg6Yx9G2kVWYUr/yr1IQ2c6BvHPV01CELxgVVS/RkrYe+Ex0F6Q0uoBqIQEHpG
	ExNDfBCHRFmHUPwsfKScAaXqUq1Xkp0if/E4NXQd6mgIjXfmd9pQl+e5jFrpiKMhCC+TJHjs8n5
	hOFFNwti+yx4iPtcAeZs8iFaMeQMlQp4JaTWd4QEgBcI+cuQ8px/SHUu1ctAL5osA4TgIV+eTfj
	4FJxqKkyg/Ynei4aBGfV1PiQYXFPqa
X-Received: by 2002:a05:6000:2303:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-43fe3e0ad55mr3243609f8f.39.1776419533490;
        Fri, 17 Apr 2026 02:52:13 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm3356783f8f.7.2026.04.17.02.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:52:13 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	ethantidmore06@gmail.com,
	starpt.official@gmail.com,
	straube.linux@gmail.com,
	sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com,
	luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: reduce nesting in rtw_security.c
Date: Fri, 17 Apr 2026 13:51:19 +0400
Message-ID: <20260417095119.22948-2-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417095119.22948-1-mpikhotskyi@gmail.com>
References: <20260417095119.22948-1-mpikhotskyi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve readability of functions:
rtw_tkip_encrypt, rtw_tkip_decrypt, rtw_aes_encrypt
in rtw_security.c by adding early returns for the
encryption type check and the stainfo null check.

Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
---
v2: rebase on staging-next. split into a series of patches.
v3: make subject line and commit message more descriptive.
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 205 +++++++++---------
 1 file changed, 102 insertions(+), 103 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index f467cb5b1dca..2a5a4c0de9b1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -449,47 +449,45 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
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
@@ -517,82 +515,82 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
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
-					if (is_broadcast_ether_addr(prxattrib->ra))
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
+
+			if (is_broadcast_ether_addr(prxattrib->ra))
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
@@ -965,24 +963,25 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
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
-- 
2.51.0

