Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F43218EFD1
	for <linux-staging@lists.linux.dev>; Fri, 29 Aug 2025 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756440573; cv=none; b=n617wfljdC0a/YVpXHn1h4b9f4arOkmtpRjrEYG4t36Q8p57zODAfQ1EGvgbN7WJ+oy5DYeTJuInlwQ4ht3fLx4j4swrpCcHLG4rz18r7nn899au1tRf46p/m0C9AQSRrjO5nStxq8ak3iRkxCEI/ZzUH5iY+JF22X7DvqAuPE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756440573; c=relaxed/simple;
	bh=VbLWMAa6acx5ejY6TBhR+uSr38oNnrdZTUIbkKIB8Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NMUCLzm0pGKtWUCx9bikAa6dyuCbzk/qfutFGin6db5G65YZUIXuYSlxaLpLJzw0UyVNeK+teOT0FyOEODbg894hEv1K/NZNmNkEvq6K1ZizS6jzO4MBwzkJWkWaQXAk0KgnSBkthUw2ZRH/4HX0PNE6RsHBgA/TE/6qMI6wUBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIm6XMLD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIm6XMLD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-323267872f3so1548840a91.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 21:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756440572; x=1757045372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juXpC95OIbgk5mWrCIY1LfWzcgsNmpuy8GKzhajuZfs=;
        b=RIm6XMLDXV6pFHKLP12GQX6cJt5tbYEZvG9ODIKQc51gjEMoeJnbqQJ/EG4Mgbbk/g
         Say5xBGRa2KJVMllYbgA3CrIGE9cie9kAEAsM6SHmNI2NQ4dvf6x4bMq8IABae5OWViZ
         gS+mMxO6aOgKo9VBu0CG1Iv8rsg5Q02i6t2vHcl2xoEz5Np1ntQQkK6B7IDxnV5sYsqm
         J3vMbNYvylr+fj+T0SbdR4PRe5rwfdCDL1e1hfsUCs+EKsdOKHMHsV9OU+IgCj7ucicU
         oEEGVrMUoxEuIQSENrZDeJLbcKqrbkTupNpi3C4+AuOAuTH76l1Li0kbD8y4SZtkIDcQ
         hadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756440572; x=1757045372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juXpC95OIbgk5mWrCIY1LfWzcgsNmpuy8GKzhajuZfs=;
        b=aeB/nA70bL1meUhaRsRvjGayUIPRj/Vd1hNeRiK62cC1wBdz99UCvab5Wc01ct67fZ
         Vqm1xgBDS9/cfHg0XVhUsl5B14EIV7kkeUQy4dIBxJscDZjp97rgw4/h4O3DDcBD0WsJ
         NKHpyp7wePy0ydfN5ynwS7Z9jZ6uYBEiIFd1MgGF3Nj8UrHEEqot49fvFSczXr+UIMXZ
         OOFJ51qxzFPf1AIVitA50Xb+YERND4L3IYWbhN7GwFGHNBCYbZWqeApcvKf3ilgrWQfR
         EgJZC9vdzwXYx8Xi+Dfefm883/hzoOvN6x9y9nLi21ThLcf9pDepU7LABio9Tm5YILCY
         CTAw==
X-Gm-Message-State: AOJu0YxcLwxyXupRwSM2tS00wt5aHkTLMuXD1C3JAjMo87HyxVF19nrY
	gM1Udysm9LmEne75SzjAaMhMi/rArC3NLgppQnHaa43W45VwqvOZy5uW
X-Gm-Gg: ASbGncu7lMNQCGYVxN/YQ8ck2Ic+gRfZbYySSm5nw8OiqyW4ISlxRk7qoxl/P2/v70X
	Li4M3T/GTsIn4nNwoRXB5y8j41TIGPLr6wQudZ9090+2uh9if9YUO/389KhHdTBZe7TTbV0xY3v
	haeqeIyxMTz06rqfwbXySobSPkGgLZQwE+fBCUrKECsD3pSUGC8J/3WjPa2rS8kMwR278RO1lIL
	yECoBcR/FIrinlZnb1k9YJGBS5X9DGKlJdVqgNX3oxVKOn5673I5jtP8sGZyVK/o4/FjIHBZ6do
	fGZi1u/fl0rtG8ZCB6t99QXj8V8PpitklfXTA1WJMX1YtE+njdbXKIneZWylvHNfv022VR50iO0
	9WuLmiuFcPLOCB14fRpgs/Lbm3XoUIp22vLm0hugx+/FascFmJXCEvh9ZbrBZhWZ6HzHyj8Dm48
	FXKU0jBKPYMQ==
X-Google-Smtp-Source: AGHT+IFzHL+8UdK9pyO62SKNANe8HY66WeLJkmilzlfwe3cWnaNsk52b08SVRY/6E17QYYmZpA/hsw==
X-Received: by 2002:a17:90a:d403:b0:327:add2:4f31 with SMTP id 98e67ed59e1d1-327add25000mr7600321a91.33.1756440571635;
        Thu, 28 Aug 2025 21:09:31 -0700 (PDT)
Received: from yingche.. (111-255-98-191.dynamic-ip.hinet.net. [111.255.98.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f5921b5sm6771888a91.7.2025.08.28.21.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 21:09:31 -0700 (PDT)
From: yingche <zxcv2569763104@gmail.com>
To: dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yingche <zxcv2569763104@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix fortify warnings by using struct_group
Date: Fri, 29 Aug 2025 12:09:06 +0800
Message-ID: <20250829040906.895221-1-zxcv2569763104@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828094537.884046-1-zxcv2569763104@gmail.com>
References: <20250828094537.884046-1-zxcv2569763104@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix fortify_memcpy_chk warnings in rtw_BIP_verify() and
rtw_mgmt_xmitframe_coalesce() functions by using struct_group
to access consecutive address fields.

Changed memcpy calls to use &hdr->addrs instead of hdr->addr1
when copying 18 bytes (addr1 + addr2 + addr3).

This resolves 'detected read beyond size of field' warnings
by using the proper struct_group mechanism as suggested by
the compiler.

Signed-off-by: yingche <zxcv2569763104@gmail.com>

---
v2: Use sizeof() instead of magic number 18 (Dan Carpenter)
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8367fd15c6b1..3d99d045f4b6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1363,7 +1363,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 8c6841f078b4..21690857fd62 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1209,7 +1209,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
 		/* copy management fram body */
 		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
-- 
2.43.0

