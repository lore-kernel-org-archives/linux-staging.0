Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5CE3B3BEB
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419808; cv=none; b=GN6el/r6Eu03mB7rFlaA7iu1uy5Iv9E+TB4pvD/JiNs1QtkP+8Li9iaNH9MoE1mzQuLM/x+7huYFkDTD9gPdDluJrloqqG2Fn7WoC8QIvznz5oDEplTzHVcTBZmSsHYlT7fB1wa2OHAup60uBB7Jt+vw65plSXUK0MyZgJ8ExI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419808; c=relaxed/simple;
	bh=yr9hpcefTpgDAxjTv2InilnrEKuRm5a8VFfH95C+g20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+xegTi/O1WPbVuA9b8sREP26u/FgoyUT31ff40ooqhvPzxG/10H5VDvlIIDibcCG33/STih6TIR2az4e/tfU9MGls+rKAGji9A1zuNGir7aFWaHl8lsS5dm/kdIXFIS3lBr6GcdyMkxRu/SbgiU71ucHkH0UdXOGc2fduBn0xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bN420pTO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bN420pTO"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso6407785e9.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776419805; x=1777024605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMbR6aAXTCuyPAmN58Jxxr71oeAqRD0VzttHJfA2KIA=;
        b=bN420pTO6RKbtClA39lfoXX+67z/5YRMaU8fqohXRppJa75xGMNJYxP1BKrGqaCBIE
         1LFMCUFzMyp0c6SIgHVsWhj8+0w5e3pTP9OcOsdhDiKa20YPFcQaiNuL8gWFMmOXOZoC
         RvLXQ1XnpMGxkXeDfNGRNvuNeJ1oNywwJsSL/2ZZ77GlhnW2m0sO+yi51iVuc6WCC4+y
         zDlAldqFzuZ7Xwq9uHoI8uooqe7S+SaAcywjqO51fLzgnaf5J2yPhuYcrqK037Iztd5d
         pTjv8Q8mWXSBlU5m32t80sAMq6F42uGQkn/IYZw5k4H26qCgeaVxfvCIHnUOAfgGuYw/
         MWPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419805; x=1777024605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xMbR6aAXTCuyPAmN58Jxxr71oeAqRD0VzttHJfA2KIA=;
        b=G7g8Rlw0u02++VcMdNjvBruo7eeSAk5NJXgJqweDu/RXi5sj9TD0AjXsZQAESjHho2
         ap5S/tVzqn8ApP3NkrcQxX7K8i6mNBKAyDzZf7QDJc10ipk/sdEP7xeOplhEPibUXD3+
         QQfMS3yHVSL5XjdhxhzDpepcGrB0MARu3Ua6z1edu/7qpbwE598/36yLnKw6Ux+SEN0+
         JQKajKummq1lwWG7LsHobwyM27NfGEf3iTUPALvATDusy1C5o19llD86NlM9IlECXecI
         kA0kDoy2VijBiVf6hxwpLSqpKJRh/URiRgGbSTdnC1AsIS3mCjYjd1bPL5lgYwcmdhla
         XTvg==
X-Gm-Message-State: AOJu0YyNwGii4x9d446p+qFVMN6xMYg/NngV/+H7JUBqMklbZ5t9jgMe
	/t2DkvrXPz5BSdpwHwyXEimnRjYN6q6PHznHFi/17qwJp5qjUIFGB6Ww
X-Gm-Gg: AeBDieussvRav7AsrqcdT5H5zvwVOfanZUYm3mpONLUd5FJOZJzAFxPJFYZd2pDbkV8
	If5V0i6GkdWQidZ2DSP6l6Nhwfpw0TTJ+4NeTnpAEZuOBReql9kObzuUEVAE8QidHljNq5B3NqX
	8wgGJFceMPYwBvyxqPsmfG7u5eV6MUJsFTK5AvpWhy3gD8huZs11TJxjCJNPt2KSNA3x9GWy1iN
	9mpRguc0tC1mzXpj1mkd7a9FfLgBi3H2846N+D/RuDMGp9b9UqgLr2h+Ttwt4zIWqjVbERwPJ9Y
	vtm3mCdG25hKybaniFd4XA0DS0PduhXNisvHWbabjcLoHh0iD+Q6hs5mNmzQ5Rd2ndqs5EMuCyx
	vdlTZjDfF6llZOb8sfFx8wMogQTsMNVC5CbTnyK0719zbCYj8veS1YFY1vcrsyEo2xkrGmVAbFx
	MK3tU8dqnMKpdB+YwG3TYuTbeRAtGq
X-Received: by 2002:a05:6000:22c5:b0:43d:6fb7:fedb with SMTP id ffacd0b85a97d-43fe3e1645emr3021656f8f.36.1776419805267;
        Fri, 17 Apr 2026 02:56:45 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a166sm3454917f8f.19.2026.04.17.02.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:56:44 -0700 (PDT)
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
Subject: [PATCH v3 2/2] staging: rtl8723bs: reduce nesting in rtw_security.c
Date: Fri, 17 Apr 2026 13:54:52 +0400
Message-ID: <20260417095452.23440-2-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417095452.23440-1-mpikhotskyi@gmail.com>
References: <20260417095452.23440-1-mpikhotskyi@gmail.com>
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

