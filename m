Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9BB3ED12F
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 19:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776369244; cv=none; b=Ogv8VfMCiBnCPdgRplsNbrKaIDL7wId8mO8nbZQ89it11eoE0uwUwyOqA+FNWcucpF+XU3f5v42wsUAjVpr7/OnQivbV2ZSdelAEKI8MwhxqJHOJj4MxDE8V6tIHTR2qoW0lq5Gg8eKHZZK8Xp8T6+3AqV4xTYe/EUXCG9BFVVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776369244; c=relaxed/simple;
	bh=Jqn6NBGtIPKfTmnyVbUNLgQw7od0yuWg45CyDha81So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2dlZT87miAZsuU1+4klRtxaqsFGFQSqAbiHj0X31vJSUP4oMsZGFSIvP+fzPj7exWjM7OS06+DWqEj4GX12X1GcQQ+gM9U5aVVGT9dKrMGi7nGvhyjKFOf/ILIr/ZN1H/e5atsXz9pqEG9XxMveY70zgjZfMawNsjlTdUuiyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dIvL8wdf; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIvL8wdf"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so77263345e9.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776369236; x=1776974036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y/vrJewcXPzMxyBWDzVYAU+RhLkHTcNgASdF7wEpk4=;
        b=dIvL8wdf0JznjJnE8SuLWVBw9oSX8lQMP9byEaE2u5eYwVsKitOgw/uFl/e94yp3UV
         Aae8IIOl8579fBFK3T9m47Dfv358tMMIuLI5+ehJDd2+7FtMmL3sQ2EaUf2DDC+SS9G0
         dsU2BsTBxLXYycRtxeb0m9Y4LNdecBOTHp3m7379GdUnURL9/ceRznatVlYsu8nYwdgY
         YgrJX5t7Ssq2VcJewwVSnKhbjTAgtQ4AAhCwUnacP8d2q7oROq5mbJ2Cl2QWacAsxU9m
         4j84IhVxs6fFCr2zNhNLxl1MUT0TJZa+bkYWB1hUq19S0Y3Eoywat1dOb0+O3q72Jf7m
         6Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776369236; x=1776974036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3y/vrJewcXPzMxyBWDzVYAU+RhLkHTcNgASdF7wEpk4=;
        b=q+GSqZYsoGZYHgwxMh1sbtU3+upP2cjd+BCxbjKmi7aCNs2mIUC19fJ2eDgGrp9sgv
         UbJHf93QQgfx/7aCCWjVTOFiab5Rmr1waWM/hz7uwReAvXY+5B2/sky+2wakvs/aboZS
         CX5C2NhLbTuxM/rGO8/Rob1RnqPCCsRsj3xh2INks/MZXM6nTDvaXl5okcol4/mb2vtV
         CVhhkOvUutXJqpvstHa5AvswNxXYBT8HWqvctOZZ+0xf7ne9cGOPjlDvzG1AkF2P5DJI
         MCczvv39Uu25MGV1K0h7RlVGHRJ/B3b3TOjS6cjf/HDGB1doLLrpQjyua0OY8Mt8csV9
         D2hQ==
X-Gm-Message-State: AOJu0YwgzK5nj4T7anqqn+j/3Rjp0dypZJt7ICkk0ydkaxPxqRuFtyMA
	vfdOkXxGYLy7ZR0W+DBqGb7Q/eQt72mGU+yd/7j3+aJGLpueYCuNNY2P
X-Gm-Gg: AeBDiesibV9P+cFNU25u/kQ2aFwKvFhoKh/4c2n1/tAT06BOMTbtrdLC5ZgLLZFPY2Q
	5WZSba/N7BXv/yBg8LYT0qkkiXLjm+ProM8TyoY2NH92HHK1vQuJIhY489JDLzvvyatOR4+SZsG
	26/kqF9qkcGdpoMIMIC9/KfpvQaHflIKAzbjX1ViuyrcbGT3nLR3h4eNFNFna29C0qLE9dNFhW5
	yIiBo1YCZf0j1BMz8mgaAiXbOrQCrPmTv88F/9nJW2pqPEcUOxxAvGFHJnGg7bzjcG0pfrm8pCI
	Bgwqw/zhLHFgoAdbc6ESyfPdU2cxDsgzmnMHbp+Cwp3AXTpeNPXfh6SVQznMGuVp2Tm3aVTYhMW
	9Cc1xt/v0eVk+n7tJhY7ymuNhCtH1HqMwZvorm6IuOiUj6rJk84sciJRC3bjdSti8g/QK6Dia1y
	ti559ebmVdFofMVgT22O+Iqb6suvDJ
X-Received: by 2002:a05:600c:4707:b0:488:bfc3:efc with SMTP id 5b1f17b1804b1-488fb6e8eb5mr916295e9.0.1776369235372;
        Thu, 16 Apr 2026 12:53:55 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5818e51sm125156685e9.5.2026.04.16.12.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 12:53:54 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	ethantidmore06@gmail.com,
	starpt.official@gmail.com,
	straube.linux@gmail.com,
	sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com,
	luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: reduce nesting
Date: Thu, 16 Apr 2026 23:53:38 +0400
Message-ID: <20260416195338.324428-2-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260416195338.324428-1-mpikhotskyi@gmail.com>
References: <20260415184727.285753-1-mpikhotskyi@gmail.com>
 <20260416195338.324428-1-mpikhotskyi@gmail.com>
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

