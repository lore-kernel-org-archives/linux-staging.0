Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B33191CA
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870726; cv=none; b=JLfKS3q0QOdrbzBAOWpvYLUDtu9C+xpy8wPduSnT5S5CDW/UnE8FgS0imZJfTa5MsFcrLakEwPECCGm/wKld9xXOfQADSaJVuUpsKLeq+EsNxmzUHPKTV/8oWEdBD7UXDvU0d0bCNjtmgHPlN0i0ZYpUyi95jzEhTmAW5OGRccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870726; c=relaxed/simple;
	bh=r3DN1E2dIqIUqXiaHXgymhrBHrwFQAOoPlTGzRyv4zs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WV5l6KneRGkRzKWmC0gmzvvnZcF0aIpLIQDCaMDQ4yjhghd+TKtSsE3VzL3I4wCRZOaom3gaRWkR+boOECxLDf3uAngG7f/RnTYV/RvyztPWjBcwYGtgukL+kdarYBGW9evTJVjhKGusualHrDc8kjS7TZ3jmlTDers/8DEPJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYDJm4Dl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYDJm4Dl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ab46931cf1so11941155ad.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870724; x=1774475524; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hSfYgSfFs/jzgOQWBqeBc0r8Z2DYgVmZ/FKdXERNoe0=;
        b=dYDJm4DljkIQ0eRkFJ0NKM8H8hPymXhb9ORWjxjj162GLCE6dAEEXfJzalrVz99UIx
         qHbldZo6iRHrRCWZjwP0KGk43SlBuiepVZ+KBcOgjdaPz/7cL5uRqf9hl83OfruSBAii
         4flCKh6EVUh6g6mmk8P2UnXU/nmkiSpBQVk2hwMfuXvu2FyS3xJl690f3smkeuDz6Pq0
         PGsZik7Syz/REFNiehVuJCjW2MXxb5QpoF3p54Pk74LB765Y1npu2og4NhBoDC1lBFOp
         OanydvflBwYGVMoEG0OSU2G3+z1H/gG1QzfW04FtyR6Q0kZ4LALjsSZYzQzsxvwwUIvA
         ByPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870724; x=1774475524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hSfYgSfFs/jzgOQWBqeBc0r8Z2DYgVmZ/FKdXERNoe0=;
        b=sx5ak9bPpr+7W/7LFeDxMroQ44RCDHu0b4/3Ap+KdRsAW54UMwZERXxUBOFqVprXDp
         nGtmsRbeqKW8GeKou84nIotHJqNHtZV+TrvNuZVzB/cqNHAhvJhZlPDnxfWib6hyw8Rr
         MGqltMbb22pv4ml3wklVdN7JrrnAfAE4ydN6JsaqoCLvkpSNP0sZioLalDA4a31HL46Y
         S92unBUK+lRsOe3aWcjNDCWHWVe52flN4U23N6/TIywFmdZwAxAMl5o7qRufnUQrA3G4
         GpNLtjzXquNPK+mAVYBd75LL26J7azJjWzufMxiDoj3B0YvMKhCkjF0eYw/RVqH2jZU8
         yudg==
X-Forwarded-Encrypted: i=1; AJvYcCVLOXApJmQW3fOdDQXvwQKkOP+Y3jiqZDWoCe8rfv51pFHD2jqeb/KIBrd24Gw1j0/02mlY2jH9DViEWmDh@lists.linux.dev
X-Gm-Message-State: AOJu0YxKD/JswC3jUte2dIoK5mhh1e5C+Ti1iV4X3ZHrnuTZwWHYq96L
	XLQnECeHqj8nDvaQ2eosi8zJwS+9t11hQT5q1sYyAeNKqiBf5EXNooD8
X-Gm-Gg: ATEYQzxiqCIR+Pgzk2ozmxViXGfrIqvnZA7IOsMdKlXAh+9NvoEOSYMupHzpPwjwmcp
	c0qIknglsRPxV1gZ6vIOnskt/o3PRD1/VzbnuZFwae3ptIHkRLiQhwzKG3GJ49Ebblq1v6osJzh
	2ENYWFCEkm8mKHGi/ezXTzJxYn7MJuUG2nC83n4KBVCglktG7H9eiZyoknm/ooUIdNyeBcx3KCU
	MRO8BrHwegVBhHqlvyRRpK5OVZ3QdjgpDDuFPlaek6b3wiq8sQ/C+ImDnGcjm/DXl+GHWmKgv7j
	TJ9B//r5PgsG7jz02q2ebtnsKkdih/u7Wtu7ZHK2yaFJe8Yw55gOne+R2qzwCH84ccY93fGOdZp
	hqbm02Ehai8yY9iEbOiK2YNuIccXkUcDEhv0A3eTQfyN5XyDqaWzPehDF7f6pqNgUUUktfWjZa/
	DxdutUZItAvdokmcRNEdHPo+lQANJKINJn6kC3+O6eAYQ87LtO4eE3jC4LaO4+XngwGV8kADrIo
	KIg3ObtVaSsxiYGJSabcoY+FxHUEitWUnJicA==
X-Received: by 2002:a17:903:1a08:b0:2b0:4cf1:cd4a with SMTP id d9443c01a7336-2b077216458mr7952675ad.24.1773870724474;
        Wed, 18 Mar 2026 14:52:04 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef58asm36511925ad.47.2026.03.18.14.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:52:04 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: rtl8723bs: use guard clause for AES check
Date: Thu, 19 Mar 2026 05:51:23 +0800
Message-Id: <20260318215124.22612-2-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318215124.22612-1-starpt.official@gmail.com>
References: <2026031810-kitty-untamed-2812@gregkh>
 <20260318215124.22612-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the AES encryption check by using a guard clause to
reduce the indentation level of the subsequent logic.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 107 +++++++++---------
 1 file changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..971d913ec6b3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1213,68 +1213,71 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
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
+	if (prxattrib->encrypt != _AES_)
+		goto exit;
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (stainfo) {
+		if (is_multicast_ether_addr(prxattrib->ra)) {
+			static unsigned long start;
+			static u32 no_gkey_bc_cnt;
+			static u32 no_gkey_mc_cnt;
+
+			if (!psecuritypriv->binstallGrpkey) {
+				res = _FAIL;
 
-					if (start == 0)
-						start = jiffies;
+				if (start == 0)
+					start = jiffies;
 
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
+				if (is_broadcast_mac_addr(prxattrib->ra))
+					no_gkey_bc_cnt++;
+				else
+					no_gkey_mc_cnt++;
+
+				if (jiffies_to_msecs(jiffies - start) > 1000) {
+					if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+						netdev_dbg(padapter->pnetdev,
+							   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+							   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
+							   no_gkey_mc_cnt);
 					}
-
-					goto exit;
+					start = jiffies;
+					no_gkey_bc_cnt = 0;
+					no_gkey_mc_cnt = 0;
 				}
 
-				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-						   FUNC_ADPT_ARG(padapter),
-						   no_gkey_bc_cnt,
-						   no_gkey_mc_cnt);
-				}
-				start = 0;
-				no_gkey_bc_cnt = 0;
-				no_gkey_mc_cnt = 0;
+				goto exit;
+			}
 
-				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-					res = _FAIL;
-					goto exit;
-				}
-			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+			if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+				netdev_dbg(padapter->pnetdev,
+					   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+					   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
+					   no_gkey_mc_cnt);
+			}
+			start = 0;
+			no_gkey_bc_cnt = 0;
+			no_gkey_mc_cnt = 0;
+
+			prwskey =
+				psecuritypriv
+					->dot118021XGrpKey[prxattrib->key_index]
+					.skey;
+			if (psecuritypriv->dot118021XGrpKeyid !=
+			    prxattrib->key_index) {
+				res = _FAIL;
+				goto exit;
 			}
+		} else {
+			prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+		}
 
-			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+		length = ((union recv_frame *)precvframe)->u.hdr.len -
+			 prxattrib->hdrlen - prxattrib->iv_len;
 
-			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+		res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 
-		} else {
-			res = _FAIL;
-		}
+	} else {
+		res = _FAIL;
 	}
 exit:
 	return res;
-- 
2.34.1

