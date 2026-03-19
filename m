Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACAF30F7F3
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 07:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773906017; cv=none; b=cDahuIEhm7lziwAZiAp6a8dGK1/Su/6iSUKzr74uhzeB571v9p5uoAdfqRnHdzgtulylq87RMBkXpRXEs1Dxf5ukAnJbnejx9kTYGkmxst+b+dAkxbezUCUoBZf+cGyk58wB0RcbApkgcMFLXaSAlXFeb2Hr+69UsNU/x28DDQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773906017; c=relaxed/simple;
	bh=zSD+N/ZuhIcO2JANyHmfqxzjbB9a4cjixkzICIdGMVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUYncXPOgYHv7tQDd9/4IpkULMBpjIa2p3Yo0BmJJOgqYWy6swZldIdk1SXsaw9CLizw/QmeSaXYrjIXNFqHHYcWF5WRK+/4Wj+NQr47SiFHuEBjWBHCZsnqsLHXRshDFWnjd4YbYmo6xHLQz6sNsTrAcAbd2fPHfgcn6crlWeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKvLiMhx; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKvLiMhx"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b062069f80so4768405ad.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 00:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773906016; x=1774510816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfLEuPFVJ12jW0QvjGItlaz0ltApobOsww+78NpT0mE=;
        b=bKvLiMhxwW9yjfszXfmsD9QHgC+Kns1fXTOwUtLxvUhnzuW/ndDtUNkK7QDPaBv4av
         0987enBhmDBQiEfs8DjgjtGwYE66gI02phvfoiXb/7Qv/HlNA1S+N/Ch1XPPA37vIamT
         BmPvuGgaA2s2+qxhLSoVgFY7QljEJZBI+gbOMNLOiNxZlS/VUqQWVPOysMxNUHNDaCTv
         7PbVDmGIHYAPbCsnt0mG4Zm8SSU6JY0HvlPyb9jK0ZVohaJyb9KKT4hHNrMxBpTx2O9B
         647eE+gU2tW/q/5m9R4JU8AWA2Vu58IvfGg39Mi5dwAY4cqvlJ1HCkq+0TWcLEevovc2
         Rm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773906016; x=1774510816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfLEuPFVJ12jW0QvjGItlaz0ltApobOsww+78NpT0mE=;
        b=ZbdozcuedIfXv9CRdSAJMV0P7L+mATfzVqvzX408fWNWgWb8EDLji/rjJs5POuB3bj
         XKcjNhJkL5tTBetx0iqE6qeQMV4b9es944s063ao6cmsYMNxzNl6N18G9pgmIDG3em3p
         tB9lzmPwO/C3rHsDZvGCrIG10Cyg1V/KN04KcNmis780K9g8CIavzDfjOborAZsQGDcr
         oyaK5pkpFW6MWYIQaMsTr4+Orc0RqyvBWeLJxIOZ748k1yvMlgTIPdUHULNMWtbB1ZHC
         tBLTS3NEwJhqoeEGdCkyoCsB4SP8Zep+NH5BymHfRcEiO7lbYiPopcateDNTElor/947
         QkSA==
X-Gm-Message-State: AOJu0YzIx/pVK4R/719o671S7ric6Y07mavxRnZ1F3jFRx/q2QIPrDV/
	0CNBaB9WUq+rw5zo33UtNRECWLKOgKJq/TKq1TqJIF57lDixIrXs2b91
X-Gm-Gg: ATEYQzzDliSPpvENkKCRRTly5kCizWQ/tCDmpE0U3u1h/Hkb8hGX0SCvY35yZcvbVk0
	txCLuEQcTY0sAtTvQkAv5eBX2A/7bVzgRuYZkb0O5GmUEnkYWsgeGebgVX86kVk40VcjWYDD+R9
	SvUl8iZqUtaHf6FRgVGGJDu1/xRP3xPwheKA6DluUFAVJ78g1qdRsNIwoBwpAIrekhH87/9AueV
	aDVAjGG4dBZeRsGTZWRObzDSB5DXc6GmAx7fJNx4oD1FkqB9YiVFDt9rjN12+85TCD3LcuBsUUI
	k8mJeF7SKzRcvvVlzX60sOXUSuF+yiymWejndMVrABOocy+xpQNLT/3RyLM39lXVn10DZp4cw3j
	wAh5fxov9dR4Oy0QS+/4kBg4PdYXOX8vkcv/SCGJEm29G/PJVzrPrN1gzrcaXaBwzYu13bP1P8Z
	9yzowKhVki/d7uQzCuoDNcQP/AN27TV2I84QaJcT1DMd7EawcAOntg1U2e9nTh4c2LpP80wBTvf
	vgFdQkfOg6zLuL0tmbMRz/Ks3jxIa3gPj1sWkuJ
X-Received: by 2002:a17:902:da8e:b0:2b0:694d:f5db with SMTP id d9443c01a7336-2b06e45c620mr61271695ad.52.1773906015509;
        Thu, 19 Mar 2026 00:40:15 -0700 (PDT)
Received: from CN4GKQDX76.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e6314c5sm48273825ad.79.2026.03.19.00.40.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Mar 2026 00:40:14 -0700 (PDT)
From: Zile Xiong <xiongzile99@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karanja99erick@gmail.com,
	Zile Xiong <xiongzile99@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify condition in rtw_btcoex_MediaStatusNotify
Date: Thu, 19 Mar 2026 15:40:07 +0800
Message-ID: <20260319074007.63137-1-xiongzile99@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses and unnecessary comparison to true
in the conditional expression to improve readability.

No functional change.

Signed-off-by: Zile Xiong <xiongzile99@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..b19eab0afba3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,10 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if (media_status == RT_MEDIA_CONNECT && check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
-	}
 
 	hal_btcoex_MediaStatusNotify(padapter, media_status);
 }
-- 
2.39.5

