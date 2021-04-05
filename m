Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059CD5F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:30 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id g18-20020a7bc4d20000b0290116042cfdd8so2762059wmk.4
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5lLBdOAva93h7sba5wfimP9PBGLz9NegQLKVskRq+74=;
        b=KIl2NCpe68hPJ/Tg2SAuV1834Z/8EqBVs3S5strfFb8PuIE6j1dWKUmUbDwOegTM/L
         mdBvwaVm6oVXKI0t1rYgj3vozJNjV9eGds8YShhq1P/+ZykaCBcL1WCSZ2Uv2JJ3B7qh
         pPni2wmJvFw4+e/MYY945GlH8SnePV8hmeVbHaf8VO1AsOoy9UbJAK6e0CgypOB1j+UW
         /CWkC/aknl1EZk2fAneVCTLYLNWrfYO36PxEBf2nqENddLJA8MztgdnpZmu2x7cqsCeS
         TDcLsu4vPvRDTPWgUkOxZHRBnnYzlfq0N6GlkqpkgpWYD8mOkw5eg+TeMWhM0LTh4cSS
         x6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5lLBdOAva93h7sba5wfimP9PBGLz9NegQLKVskRq+74=;
        b=Zr4gbJQgp6TnuJ0pZbJcPur10ZkGVdGKf+NvZR5rd+k+Ef/M/GKdS4Rji2+kSWlrNT
         HHDrnQRcQn6u/cR3iskiOkrUqScuKGu+ruoPTIM+fIUwQyneyCGV52WgzqiKg9bYvSJe
         TgMDf881xdMWhZv/rAVin803/p80emujkMBJsM0/lk841l0RTjmNUjdOfpkwlma0cNLu
         Q2RfJW7T6b4j0eP6ZXiA+R+rXqc3LRrLiQjY2PST5Jo+ikm8rvcm3YibTHlD9MG8yFzV
         UHY59xKnWApiyGLnDN7WCufA/HquYs8kMwok10kjbQ21Lb6nzlQ7J3nuUf5O89L1MJNH
         xsPA==
X-Gm-Message-State: AOAM5305FU3/tCROkHHY6J/nDvSEotimh3ARX+J6HVdupnqY/WxS4V+j
	/TudRK/MPUIMyEgIa4AA5A0=
X-Google-Smtp-Source: ABdhPJyhgyP9bhPh6qlT91x5gAJ3IFDsG2lhJjwkNcKL6WO46TXixiyX6F3LwK0KFGzX5uBbkJB4DQ==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr52738wmc.138.1617641429648;
        Mon, 05 Apr 2021 09:50:29 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id c16sm34889822wrs.81.2021.04.05.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:29 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 09/10] staging: rtl8723bs: remove empty for cycles
Date: Mon,  5 Apr 2021 18:49:56 +0200
Message-Id: <09875f599705d8f50af3511fa6bfaa54b9446a86.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove for-cycles left empty after RT_TRACE deletion
and unused index variables

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4c94202ac209..eaa9f9e2e6a4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -3466,7 +3466,6 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 {
 	struct c2h_evt_hdr_88xx *pC2hEvent = (struct c2h_evt_hdr_88xx *)buf;
 	s32 ret = _SUCCESS;
-	u8 index = 0;
 
 	if (!pC2hEvent) {
 		DBG_8192C("%s(): pC2hEventis NULL\n", __func__);
@@ -3491,8 +3490,6 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 		break;
 
 	case C2H_HW_INFO_EXCH:
-		for (index = 0; index < pC2hEvent->plen; index++) {
-		}
 		break;
 
 	case C2H_8723B_BT_INFO:
@@ -3513,8 +3510,6 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 
 static void process_c2h_event(struct adapter *padapter, struct c2h_evt_hdr_t *pC2hEvent, u8 *c2hBuf)
 {
-	u8 index = 0;
-
 	if (!c2hBuf) {
 		DBG_8192C("%s c2hbuff is NULL\n", __func__);
 		return;
@@ -3537,8 +3532,6 @@ static void process_c2h_event(struct adapter *padapter, struct c2h_evt_hdr_t *pC
 		break;
 
 	case C2H_HW_INFO_EXCH:
-		for (index = 0; index < pC2hEvent->CmdLen; index++) {
-		}
 		break;
 
 	case C2H_8723B_BT_INFO:
-- 
2.20.1

