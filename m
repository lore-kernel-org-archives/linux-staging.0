Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8684C3F54C2
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766331; cv=none; b=c9yGqrGKX9BssAhYYDypPWbOlz8xHNE7UJ5PZsV/hmjMF7lV/E3ZmRfNHGjnyzR0qNZBHJSLqTML09YDu3MZqGm3+hIHaU8fYhRvjtEWxx+qSH33X/5vGS2xULO8RTaavabgiMJwMUjTPOLdY9Rc4c/c2/OcvIq26A4A9lRsB0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766331; c=relaxed/simple;
	bh=fRxiA25HBhWv1sjaEGJIbNYjRK88Lnr5cMVOhUhF3wA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nAYq2iRqs4zLjCpkbKCVJ0cgG0kn5gTj6fhEhSmX2JU69oJAhJ5N2sMGziHXuzEkYOp7j/U2rjE41CdRwPqyl45T87zcx8BaPlEEzMMxd/X71YMNQ0/kN734pKnCo/q4XR7hsoidc1NxC6qrxfHAzYh5BcKoeUoeSeARWlNQV5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7e0rqut; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7e0rqut"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829a9d08644so3463525b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 09:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773766330; x=1774371130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kovSUhP9uXrM0WSzENziXtNAdFAkMxJ9taYN2mKORio=;
        b=H7e0rqutn8R4Vu8fTHfRK7337X3/sIvtFRJJlq1Ig9gZoiyqFodgHM7SfsBXF1xxsy
         y842l5hRPJvcXWDbAwbjGnI8O0ihH40fiYmeB1vaRLk/HVESa73tvedeo/9alCJ8u2qs
         nIh4RuKS8wqyLEj2WQWxRLIZ+1fnFvhj2pyAcOSw8erU9C4HHikwrNy5aqDlqFjm/yDk
         Suz1aHZprwB1vywuqLY55KTR1TWUP+wM5ls5NZEcqhMM+achB8+bv5Qs42E7ouNR9ogq
         CjCQJkZAb4kH4Hu+JbL8KSxtctcoTGgXI6vCK0f3k7RlEYoE+RZKJJRO00BdQOnmtsVz
         9Icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773766330; x=1774371130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kovSUhP9uXrM0WSzENziXtNAdFAkMxJ9taYN2mKORio=;
        b=P9u7lqp/E2n/kdcw28VhoLvMNywZljWji1HJaScN6vAXqOoWXbIeBKxjfbXs/3UQFn
         AHYvc4FpzbQouDTSBa18kShX1RV9YMeJLxcfIMKwC6hPjfLDzgpYOfiLYMXQYhiW2gtq
         szcCyCn9ALV7oPu+V33FdFzzBSV0swnWWhFpEoP1qxYQpp/HIpAP7P6v8YyYmYe72DcY
         eaoJfpvQL8fSlayaXpU41tRjA28EK87HH2sUWQHUlixAgV8HozpGQwQVtR90rxoBlZTm
         JlzRguQ20vQlZVaopro4BlbkqVSgCO1NOA36HnfkBECmaH4Vwwj/Ju9swlUxe8UIc2U7
         lsdA==
X-Forwarded-Encrypted: i=1; AJvYcCU/qgypYEMu2zokl6T7//QPqOj6+zhd1jPdNjMbkYpsPKevmAEFBkEzcbklrpdx0qf57dZgk/OQRG21rxLK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2g/w6zXBP88xJbjc5leNeqrKmTzrQiC2X/NAoVhL8J+NlMSoR
	lKT8BG9xWoPaOiDQNx/ODIdCrUpNkhZ85kwh7obR3fRRjD5kvZowFuCt
X-Gm-Gg: ATEYQzw/BwZgraFHQb7M2MNDG0SkpnZO9c01SoL4girk4zSERzHq3Uev27p6qUprSoa
	t4hZBUp266lr8yFtwfQzZkBJb79Gux0LzlyOxFnGlkZJQ4W7KSezbY2qZzCENrFuDl7pw6x77EJ
	ZMr4ZxRkDwRKDN7U3NdfETh6pqn9XdURFpJIMpUNZdxO/z7U/lnYprqIbr8lTrlOZl+uM/wqaBx
	dxb1xHBWJ2fAZcpXTtTFdivrO5d3R1gygtqBxUwVcqRR9J6AN22WFJxwg4wnTEzrPFXYBnD2KMT
	c0Z3NKnyy8GLF6lbIHQqOYuw1YbpXoeSLXusMpO3OQfOZLpMKbXj/h3t9l4uM+WWghSy5b1ynIL
	CR+V3z/TUNIkvdJDnkNEtlNuXjbwi3nxJ9zz03VaZ9bn9U+jFqGHcC4PzHnYGyMb5nBKOF2oRZ0
	ZI/M/pvcbgryXS0efMdn1FlXs5XE0ctH8jYq6sVtcd7MYYYJ69+XKDWg9sBYxDLPQ8WVfT6LBfr
	u32ZklhbhMgHUionY58MK5O3z7MRN0R/lWgMg==
X-Received: by 2002:a05:6a00:1992:b0:829:8aa3:2ebf with SMTP id d2e1a72fcca58-82a6ac3955dmr87946b3a.2.1773766329655;
        Tue, 17 Mar 2026 09:52:09 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-d048-971a-a9b6-71d1.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:d048:971a:a9b6:71d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a073403a9sm17638823b3a.40.2026.03.17.09.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 09:52:08 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: refactor rtw_aes_decrypt() to reduce nesting
Date: Wed, 18 Mar 2026 00:51:49 +0800
Message-Id: <20260317165149.16751-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve code readability by refactoring rtw_aes_decrypt() to use
guard clauses and early exits. This reduces the maximum indentation
level and flattens the logic flow for key assignment and decryption.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 91 ++++++++++---------
 1 file changed, 46 insertions(+), 45 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..9229e0a1c792 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1213,69 +1213,70 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
 	pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
 	/* 4 start to encrypt each fragment */
-	if (prxattrib->encrypt == _AES_) {
-		stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-		if (stainfo) {
-			if (is_multicast_ether_addr(prxattrib->ra)) {
-				static unsigned long start;
-				static u32 no_gkey_bc_cnt;
-				static u32 no_gkey_mc_cnt;
+	if (prxattrib->encrypt != _AES_)
+		goto exit;
 
-				if (!psecuritypriv->binstallGrpkey) {
-					res = _FAIL;
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (!stainfo) {
+		res = _FAIL;
+		goto exit;
+	}
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
 
-					if (start == 0)
-						start = jiffies;
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
 
-					if (is_broadcast_mac_addr(prxattrib->ra))
-						no_gkey_bc_cnt++;
-					else
-						no_gkey_mc_cnt++;
+			if (start == 0)
+				start = jiffies;
 
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
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
 
+			if (jiffies_to_msecs(jiffies - start) > 1000) {
 				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-						   FUNC_ADPT_ARG(padapter),
-						   no_gkey_bc_cnt,
+						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
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
+				   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
+				   no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
-		} else {
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index]
+				  .skey;
+		if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
 			res = _FAIL;
+			goto exit;
 		}
+	} else {
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
+
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
+
+	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+
 exit:
 	return res;
 }
-- 
2.34.1

