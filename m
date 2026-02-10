Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45308288513
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 03:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770692824; cv=none; b=ELT8+dlf/l9Z5RFC9hUnHbVRfN5pMXb6hR1tRWX/4VKXaQDaHbblEVq7l2fLruJZs4E0dO/Vsz/ltwXPZbqt+SmeCxVSnxdESnEkSANiHQ/ZcmifacVbfCW3L3CbYsJUAR4QKP+DX8GhO2hBv5xAXSITw69v+rw2SV2EyVtkjYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770692824; c=relaxed/simple;
	bh=4UoJ5MJgs4XdWfg9BUnVpWs1h+Iyf+s9MNsN6nWKoSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgC1/0sKu/HURd17nufXPxO8EIqoDuuObIYTUj1j751lS95RMcXzGhDGLAv1z1W8oogefWHTHmwTIBH7JAKaY8fTHxJz0VG/x6A45792xdU6+OkVE/unmtDWrejwUH9dOnnUyXAnZHcRcoFy87r/KINFycm5V+R0pTrq+5y5SRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lM0jBgHr; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lM0jBgHr"
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-c633984fbeeso2227674a12.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 19:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770692823; x=1771297623; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN1daQ5iLRlqAIyAsqHkxCQ94Pqe3JMdIMMwyavXDUY=;
        b=lM0jBgHrOvRuJDUsdi7BLyqrohumhdRIkfKhmaafpCP62o3zDf6q7yc8m0m2+XBhdh
         CStqEU1yn3qll453M2aiAuB37f42lBZg1X2AJ5JcufIxT1WU2OidPl5b2FYxe2TNI/Rb
         6hUOUymGqwUqcm2pM/FjEpmpfWGh+68MDDf/ocx2kcl/XFlxiQZIaSlLGD4ydp61PC+n
         86iFXd3hgqrtlP9IdU4YgtdHJlgX3wSPLPbGZuTxwCCqL9zb+2CmhXQst1JFxzskcVGM
         D21AhXXB+vTxPAIqc7WexpU13d+OaymIcCaW7X9FIHX5eKh4Ds3CnLLuvEFbJw6EQbn8
         KbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770692823; x=1771297623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kN1daQ5iLRlqAIyAsqHkxCQ94Pqe3JMdIMMwyavXDUY=;
        b=ZW0IPiQ68pPVyJ0GMZYCpvcT96BClmihxlgu0/kWcI+qmFHxohh43TXNX5o0dwORn7
         44N8rMBNuIpHBYM2oh+GOV6bJGKK0ox9coERmEuat+DxI9Gpn/9t89PUNSc22Ld/2hR8
         qNPC8FpQzReyxWd06Dsd/kR9arafwTHqidoIHBV+cgmmPqjVT7FKY2J8Uhkhv+qExsCV
         u0Z0+qXRSveLJWqHFWDtXhi1aTmV+BzC4odnGVYRatBRZEcljTM5QB+RXQraTDek9xo6
         KpUets2dGT2mPqdeB2oDspzWe7OG+OQkEK1hRNeY8S38Q5bPN01WnOi5B3ryCc2e8dr1
         N7DA==
X-Gm-Message-State: AOJu0YwZ+c1GWEbgsL91HaWArHvdBfyxeXYhidgWZXbapGOMaLlP4321
	8ewG/p71sP08kiHJyrRjvWVNoNfWRGsowDj2TS1fWp3fVw1TE8NMVwcKFAQK58IK
X-Gm-Gg: AZuq6aKeoL0sr9l0WMbnR8YSYP9lMSEx+rRwSJiXHiXqdL9+QarIbLtI8vqVOZ5t3LL
	lFKhZVVRzVEvvPzIeokH1wp53XFRRxA1wwQXiZYbc11I/bDlTZAldpHxUTgkEV0PmieEofWbHxl
	znEUc3pQia+QsH32KpqdRqqfG8EUlSwYI9HNahqEnqlQBcjftnERzUjg9OmX5tICB6fDoO8Qa91
	8ZS3PBa7kL+nBf2JkRK8Kn3moFKPKIeY+E7uMUN7ZGn4JeOepsBoCmoqsqd9Z5OfXObPw4fVq37
	+IoEGmTsTgX9S1ixMVLCbvzR8Fe4D4hSfUJfk3GQm1EURY4vWycIaJ/3l+mRLH+S3UUgoEk9BbZ
	sx6ACVSri8nADD0lgabfsFITY9oUEoFMq1if7I5+4ZsGVD0xOfgRRWOqUuv25twBGMDQh2aUFAM
	WGQj5BE/9dL0+awOVpDAOGkDRBrFkQIQ==
X-Received: by 2002:a17:903:2292:b0:2aa:d327:beff with SMTP id d9443c01a7336-2ab0fc53bb9mr10499535ad.6.1770692822605;
        Mon, 09 Feb 2026 19:07:02 -0800 (PST)
Received: from Horstaufmental ([1.47.25.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm116248265ad.30.2026.02.09.19.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 19:07:02 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH v2 1/7] staging: rtl8723bs: remove unnecessary void * casts in rtw_ap.c
Date: Tue, 10 Feb 2026 10:06:01 +0700
Message-ID: <20260210030607.1430567-2-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210030607.1430567-1-horstaufmental@gmail.com>
References: <20260210030607.1430567-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant (void *) casts when calling memcpy/memset and
other helpers. These casts are unnecessary since C implicitly
converts to void * and they only add noise.

No functional change.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 67197c7d4a4d..7f09f44c7004 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 
 		psta->ieee8021x_blocked = false;
 
-		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+		memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 		/* prepare for add_RATid */
 		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
@@ -546,7 +546,7 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
 
 	/* todo: init other variables */
 
-	memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
+	memset(&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
 	/* add ratid */
 	/* add_RATid(padapter, psta);//move to ap_sta_info_defer_update() */
-- 
2.52.0

