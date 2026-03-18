Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D72314B82
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870733; cv=none; b=LPNJ3prROnqFaWayMSy2Ce/vzcx2G++2dqgcJ4WfBrOJhMIe+fswCiuuqZhMQT9aFrNogQ+k9Vqw2m9nnJhy98PvplorE2f0QXVYevOwxG2U3HaW4hfAaG6m3tKUA6Z24RbRtEaXevjM3ahP2sRHS+9duTwmNtD06JjovepZ7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870733; c=relaxed/simple;
	bh=LndQBA7jT7bXwFh+kGrJPC8OVpDRSotWI6gUBrMcWpo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OqY5oJYNs8SgdULvp/ZdMC+DjLmbe7b6jwr3g+JVxqqNwCjeNhHFQ1VLQ61XSMPm8XbSIh42l5UuXQwWKx+Xs3xHql7dLAtGmLAW/fHcnfTo6oeioSafK/fCwDIMwlta/yP5571QZiNFXKHasCKPltmdxBp8rin/avv957iJRlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMiZBQbR; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMiZBQbR"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c70f91776fcso139744a12.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870732; x=1774475532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLp9/a0//oG5wwRTDi3w79z5sRv2UHAhjXlGWvlO3g8=;
        b=KMiZBQbR/yJO8/WNa1Ytg6bbUfxvpFom44qezOjFHBKlu7PTJg3Jrwjg1cMPZYPEku
         JWRm0X/G39SHbFMwCworP1h1+7EtLUMNP5ZOiCw92zTCqkPl0mzCp+k+RZUQgo06TVrm
         LhDiD5IZbNeitwqaUPTtIxdDtkKrx1w38hksCaggKx2SUo19BNyF9uKBkGyDYfuIlR0m
         ld7qexNxNgI1xTkYqZXlBQXb1Lvu+DHoCEVc9fGs46dDLH6PQKn290YdqG6ziPlTKAwi
         p7oBgh5zqAZf22Ywar66KHH1L3c5SOyceyDd2MrgVUCV71hIpm0S0ASE83wc7ctuClKl
         ERgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870732; x=1774475532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLp9/a0//oG5wwRTDi3w79z5sRv2UHAhjXlGWvlO3g8=;
        b=nu8tizku4yUvCkVyJKAtt08nOe3AtMgZOR/ukruv1BsOMHnQsteqT3w8eLGrUkSpb8
         DqG8Sr6mcUk5I4ip6KKWDQvwHYaL/t9nWBQAjXNN81AksSvPTM8H0InElc/v8o56760w
         EAIyKW70hGrV6ii4InW4ykhDMkxdElPZCMUEsEF8alYFLeRZb4QIkCVHa3VW8pjrTMjy
         /YFwSanHT4jpYJCswPa+XKrYg5sBus5sl3DHTe2Y0aXb6DoJBXdUvPYoFdlZ0VLYZWTX
         Zqnjc7n+uKO6Hn48v3FWxbzt2RC/XJGBoVFzkl/KIqqxn89zOJqZXbX22KZDl2zkM4Sm
         78VA==
X-Forwarded-Encrypted: i=1; AJvYcCVRza1weajtqTLNkpfqZgPkjiSkvFM4GkPWkfi5qDwvxMEgkPo8HwRvuWDUF6qJEtHcT4z0deBeaia7/I+f@lists.linux.dev
X-Gm-Message-State: AOJu0YwLpdv+5N1pqYyrTAhS0hPrHF3xRp6xp1aoZ2XbESbczYmOZo9l
	7SsLw9X/ZOCxLttHeruIXjA3a4RIi1AlO+f0niMggCoOpE1yIlgh2Ga7
X-Gm-Gg: ATEYQzzIceeFD/ZOb6Rg9/pD4dA2RLPHk3ORPd8PQ2Mbp6rLYJSOzoVErIqdh6wNNr1
	Q/ncyPjQtJDnUTi+nXMIJb6CJQW8b8zE+vqo9P/y1QDNpRTl3SHn6uNzq3QOMLY8KU/N0WpJkdB
	ogAXX9tWaUXnH3VqpT1V+SgJFygLkMB1RjSkIOU3Nj3C7Y1JpZPgtb7VcbAjUqgygXcPt6kei/9
	P5MBMOgKezHlmLLikALG3uvIPnPAlP8nZ8YpePDySSBPUyzq6oCAD5wA0rQi5kQKyzuMzuQJLSd
	HoyYlEAc+TlcjPUwZo53V39a1I70Sl2qwemwfuPTGMJEPxZwGeTrG7Xa/uWIIwN3zMGpiSJ39jD
	iTnR/1slC3R7XkZW52/U+PdUOjJfpVwzVG1y0ms5hyqj0+vEOhdv63FCS3zCfFU5t7uehymHaV+
	rcIqqB6g3hkuNKZxYdCuiUllFZh8WZwVnVJGkarm0rBSqyr1bbkOIDA6rsXRNsODKCFXQ+dmLjc
	BIiNKxJfoFv3SVsHWhqU0dqf1rxJnunNvHwAd9lIFWAZptb
X-Received: by 2002:a17:902:da81:b0:2ae:7f84:79e3 with SMTP id d9443c01a7336-2b06e30eb99mr48866575ad.16.1773870731934;
        Wed, 18 Mar 2026 14:52:11 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef58asm36511925ad.47.2026.03.18.14.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:52:11 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: use guard clause for stainfo check
Date: Thu, 19 Mar 2026 05:51:24 +0800
Message-Id: <20260318215124.22612-3-starpt.official@gmail.com>
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

Continue the refactor of rtw_aes_decrypt() by introducing a guard
clause for the stainfo check. This allows the subsequent multicast
and unicast decryption logic to be moved one indentation level to
the left, further improving code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 100 +++++++++---------
 1 file changed, 48 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 971d913ec6b3..0e1a89702edd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1216,69 +1216,65 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt != _AES_)
 		goto exit;
 	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-	if (stainfo) {
-		if (is_multicast_ether_addr(prxattrib->ra)) {
-			static unsigned long start;
-			static u32 no_gkey_bc_cnt;
-			static u32 no_gkey_mc_cnt;
+	if (!stainfo) {
+		res = _FAIL;
+		goto exit;
+	}
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
 
-			if (!psecuritypriv->binstallGrpkey) {
-				res = _FAIL;
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
 
-				if (start == 0)
-					start = jiffies;
+			if (start == 0)
+				start = jiffies;
 
-				if (is_broadcast_mac_addr(prxattrib->ra))
-					no_gkey_bc_cnt++;
-				else
-					no_gkey_mc_cnt++;
-
-				if (jiffies_to_msecs(jiffies - start) > 1000) {
-					if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-						netdev_dbg(padapter->pnetdev,
-							   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-							   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
-							   no_gkey_mc_cnt);
-					}
-					start = jiffies;
-					no_gkey_bc_cnt = 0;
-					no_gkey_mc_cnt = 0;
-				}
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
 
-				goto exit;
+			if (jiffies_to_msecs(jiffies - start) > 1000) {
+				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+					netdev_dbg(padapter->pnetdev,
+						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
+						   no_gkey_mc_cnt);
+				}
+				start = jiffies;
+				no_gkey_bc_cnt = 0;
+				no_gkey_mc_cnt = 0;
 			}
 
-			if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-				netdev_dbg(padapter->pnetdev,
-					   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-					   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
-					   no_gkey_mc_cnt);
-			}
-			start = 0;
-			no_gkey_bc_cnt = 0;
-			no_gkey_mc_cnt = 0;
-
-			prwskey =
-				psecuritypriv
-					->dot118021XGrpKey[prxattrib->key_index]
-					.skey;
-			if (psecuritypriv->dot118021XGrpKeyid !=
-			    prxattrib->key_index) {
-				res = _FAIL;
-				goto exit;
-			}
-		} else {
-			prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+			goto exit;
 		}
 
-		length = ((union recv_frame *)precvframe)->u.hdr.len -
-			 prxattrib->hdrlen - prxattrib->iv_len;
-
-		res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+			netdev_dbg(padapter->pnetdev,
+				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_ARG(padapter), no_gkey_bc_cnt,
+				   no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index]
+				  .skey;
+		if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
+			res = _FAIL;
+			goto exit;
+		}
 	} else {
-		res = _FAIL;
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
+
+	length = ((union recv_frame *)precvframe)->u.hdr.len -
+		 prxattrib->hdrlen - prxattrib->iv_len;
+
+	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 exit:
 	return res;
 }
-- 
2.34.1

