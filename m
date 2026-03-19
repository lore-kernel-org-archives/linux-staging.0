Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBB03CD8B4
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922075; cv=none; b=TErG7VyaTJBZ5OZ7JDoFlZaKP35etvKWLmXimhX2NX/35jFJQ4dcsWoG6hoUhZll5ak00+yV/jhzx0A6FC94OnxYpydkn6mbXPTzDxNRGeUqi1QpCvW0TVpY21uE4vgZzwv5SaTTfPdP7h9jC1rSx4qtIbW2+ZYcQDmtyPbGias=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922075; c=relaxed/simple;
	bh=2jiC7UjcKaAEoMULz1150dJ+3GOCh197ydbWBLekmTU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VGKusyxtrFwwH+SIlk2B+AubcWxOoEYJwL0PS5B1hYdcn9wZpGU6amcNVCojiQhxnN/zKhUhqtVw866F8uUoqEd9QjsVzDKm2w0Gw/O4mWuZ188eyVi8e4JVIZuycBsg+3ULypg+COlcvIA9cM64d4Ts2ZPGgxUTIsyEEHwKpQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTgUWjPC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTgUWjPC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8296dabef74so532808b3a.1
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922074; x=1774526874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JIiiOT4nulxSv/7mffOUFW8n/eEwVTsIYtRNyKYXEI=;
        b=gTgUWjPCXy6v+DClRwdAv0HZFaV0K91WRULa44zOXDXsJp1eXMhPK3lIbyrIzWZFhC
         LnsnBLgiD0NOVDDIEveUtcqirJBUToIYhCO6+/3Y9y2KO3HsQdNe/jRcmMQAOcSFu/9n
         8Sb15xfM/O+DtFXOIViP7t/1XlbaY7c6CpzzPUnHZH1iMVjw5Vcf2TncrjZXPYiaKxwn
         cWTE0eRntjjG0LlkDZztt9Qp6bBqZJNdWTX8iinaSaLM8k9VtXcGelptPJ1qZ1qwhM76
         vhPTYfxmJVbRJamqJUKe3nODrpodFYgt1L1372WdiX6DFhwQ03tnNGXscYy8ET+PM5yv
         EJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922074; x=1774526874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0JIiiOT4nulxSv/7mffOUFW8n/eEwVTsIYtRNyKYXEI=;
        b=UB3ylXPKPjfZbb9xJ4gO/4U0ZVG3EYiF2qSUFOxlZk8llzwDTl3VubTqBps5wXfyOM
         0ZAkdCmXQteGBelzibrlqOjU78PomxJib9FcgG+GAQPMeKcLpbgZspicd0Heq0lMsA9x
         0afG3TbkCQZqaxvb9ZeVp5p4o7vXSqNh9ocWYMnNvghNPIVhY1yYIgQaCGoWIAOec1J6
         atIlHCGrniTVoVz0vxsri56fpRXWa+qdbJIUAhSkZhWxGv4nChrrly1X6ahR6JJg9tor
         uKyTstif4H92pWW1Q/w/+kbW/L/tExi0Tg6SWRarWeKXH+1VBUAFQISSqsZVLo3LQaVB
         ngtw==
X-Forwarded-Encrypted: i=1; AJvYcCWutOOYrBg8Cfu7+FlHX9G/rxh7G01uJCLSwCqaBxL2xUpAlyNHAMCPRv4lyNE7GefY9oaziu4U0dcrBeKr@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Fi+sIFvMxqhwcsUitAZ+DgCo0WBCRGtyLbOT08kmw1o/wGlD
	lxG5OA3brCdhLYKZ5bEBawCBwv4B8+HQNcKr4D9IqAjEMgcyPbiCPXVTkDYBgA==
X-Gm-Gg: ATEYQzyxyk7aX9H1h/yqqqvOU5BESZH7XNlYWZz4pqDnsPgzE8G5oj7ikNY6fTagJsU
	6vr7/nKkqbjdKVQjrUvVzc4yGIRGOTHG+gfmWI7onrBRQt8IfSc4hNB3mv9xVt/NbbjtMBTvxL5
	BXyXG9wZ6js5svuNp8iVW0IJzMaVHw6hWidH3HIYDr5T9QbZWu5MRRmDFterKICiC07W3twqL00
	XlmNbrVOTBmwGl494B4WFrP8lhLXepNQRJI+lW41LnGsFxebejzhgVzo7PhM5RJxjdmekwLO+Yi
	8iWbKZu8cTiqJpSgM7UukqzHko+wA0jtzLdqU9dvdOCrhpJYwyXbPFPq9bZY+gTuQgkQpkaR3ps
	fiDj4jFoIHhynRsGQ5IyFtpf671SlQvR5Y6IA/REmWyKGVwNpYJehgnVVQU7ZWCGgFiMtxlNvkr
	wWcG3tv+ieh0vC38mI4r1WDhGquiJp514mvkwXROBEju3F/wU6VkUPNqAcz6GM7wFiFpMTe60UC
	vdhX9xHSKfxLOo/GC6EzJ7KbzHJoB+18V+kSA==
X-Received: by 2002:a05:6a00:2985:b0:829:6f82:5953 with SMTP id d2e1a72fcca58-82a6ac7ac37mr6517229b3a.5.1773922073896;
        Thu, 19 Mar 2026 05:07:53 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bee990dsm7108477b3a.52.2026.03.19.05.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:07:53 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: use guard clause for AES check
Date: Thu, 19 Mar 2026 20:07:36 +0800
Message-Id: <20260319120737.29692-2-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319120737.29692-1-starpt.official@gmail.com>
References: <abus4pKF0ykt6nhj@stanley.mountain>
 <20260319120737.29692-1-starpt.official@gmail.com>
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
v3: Use "return _SUCCESS" instead of "goto exit".
v2: This is a new patch split from the original v1.

 drivers/staging/rtl8723bs/core/rtw_security.c | 104 +++++++++---------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..3c89e911ac2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1213,68 +1213,68 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 
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
+	if (prxattrib->encrypt != _AES_)
+		return _SUCCESS;
+	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
+	if (stainfo) {
+		if (is_multicast_ether_addr(prxattrib->ra)) {
+			static unsigned long start;
+			static u32 no_gkey_bc_cnt;
+			static u32 no_gkey_mc_cnt;
+
+			if (!psecuritypriv->binstallGrpkey) {
+				res = _FAIL;
 
-					if (is_broadcast_mac_addr(prxattrib->ra))
-						no_gkey_bc_cnt++;
-					else
-						no_gkey_mc_cnt++;
+				if (start == 0)
+					start = jiffies;
 
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
+							   FUNC_ADPT_ARG(padapter),
+							   no_gkey_bc_cnt,
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
-
-				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-					res = _FAIL;
-					goto exit;
-				}
-			} else {
-				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+				goto exit;
 			}
 
-			length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
-
-			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+			if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+				netdev_dbg(padapter->pnetdev,
+					   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+					   FUNC_ADPT_ARG(padapter),
+					   no_gkey_bc_cnt,
+					   no_gkey_mc_cnt);
+			}
+			start = 0;
+			no_gkey_bc_cnt = 0;
+			no_gkey_mc_cnt = 0;
 
+			prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
+			if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
+				res = _FAIL;
+				goto exit;
+			}
 		} else {
-			res = _FAIL;
+			prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 		}
+
+		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+
+		res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+
+	} else {
+		res = _FAIL;
 	}
 exit:
 	return res;
-- 
2.34.1

