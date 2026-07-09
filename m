Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE534DC542
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621653; cv=none; b=H2aC9AqClrqNN4glj3sMHyvhaGjLSw564acn3uxjBQTD7vSfGKpobofcY17sKf3qm8tDHoWaztG5Sq9Dx3waoOagfSEdXWTmpYdNRuuHJQS9VDozUn3THzMAOwRuo3SIKo85vv2N/iHuCS1g/OUsWOTgTAnGu/zAKk7GN82K9ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621653; c=relaxed/simple;
	bh=UwSvTntoEypwWAOQKyY8mGPcmMaa8lH6ZDS1XqyjTmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ws0Gjb/BXU451rF3hqvAUeKbQoTRs0+9cQj3ideCzakzVD2lREwpp1s5cKkIQQ1lQToPzN8jU53QPcdq2I1CEoooEEK84eI5PGKd5z4sLWhZbEKMCxKaJ5BPy1O9EOC9gnsC+CDgmVvgzk9C7IG9rEdhzdYflHeRjd8045ahc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf4F3viq; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf4F3viq"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so21817566b.3
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621650; x=1784226450; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAh214xhoFNHWRrQjLGgn1xZICI25udidJ/siIE8/R4=;
        b=pf4F3viqMx+Lx1QnFuyab0kVEm2uU+TazddFKZxgFqDxqmxQGCYOQDwM7XGBbs7NeH
         wQxFXsfI4YtqhXt8oPgu/tDRWDCpOcCBSgmQhQuxBRXIZtPOxfatzPpUHaBjBFXsUb9B
         n4MjPD6xBJR+zcClxZFsX2dJG1pzbL/MTBmTkCcj0BzabeChqIiW6KUilfnrVPZu3fd3
         e/xNXsQJqAATrE23GLJZdwtowkWdhXip5MV3k29XeKsz3tDf1Iiwa2rvC4JPFee3fFe4
         7+ZXpLf1EutglCHKEHWzyeUJJADbxUNOAFHZ/zfjvgQztBHz8y9kxGxHUfiET9KztQpW
         lCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621650; x=1784226450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAh214xhoFNHWRrQjLGgn1xZICI25udidJ/siIE8/R4=;
        b=TVzhI+pefc4S+ypYgz2TsXacYoj8mi2Vv6whpHLMp71+EsXmn3gjW1nAJn4GHbK4Mp
         oqjgPZEn3ZMpf89CYpqkKCDTD1lAg4KAtdq2VfaM24uRi592A+6LoOTnUmCtz/LRm0s2
         6K7ALSOXjfn6DXOUEp7+n/XfR3JfZXQK7QB058xIFbtmfUpUnBGZaD7r54y6iKpFirMF
         VpJFqpv5FhCyYnC0sdIbMOaLEr2ftkdXnFkbKfk34EkH4oaNTiCFTT1t2uOKTJYzevdH
         efJYP17n0TO0nJVw7Wc1MMItz4H3xCBR8CEpLpDZ6H5OUhKzfLJHrGE/TyAJfVWXYd4x
         22Ug==
X-Gm-Message-State: AOJu0YylSDTTqec01tAGZMERy6e3CsKaXx20a42w6hSgip8vOAGa2P69
	FccbRQPjlPOw0ZuCWRn445bwYAxXcPlFp0xJmNymqAl+gXy968ZJwA28
X-Gm-Gg: AfdE7clRtFrX03V+4t/7N7Pa8bx7AE+S/GfKzpHDtcKlgP++htOf2GnYeGZixi3ojZo
	8KPNm94B5LCqFTxSBVjYv7MyMtscq2IFcQossctN4LV7m63Iho82Ap9Z/8s5EkKuybghIt/B7Ix
	qA16c5LJnFYU9RrW+H0BGVBx9J4PblZdSzzT9QVdZxb3qvwqlnF/G8nlO14n/t5DFcZaXBHamGM
	yxvrJLJqv+RkclhFnbPbEg9TyHkqpo7MT0wjKdMVqvA6aLuk/KIha+srq8lfIbU/GaWXAfxkXL4
	pW1mZ3P+puH0QBnaGB/fib0B5XG7iaBfbnKkdZiaNewVDzK9VQ0Rl/OZMmSEfWn6VY1HbC08RYJ
	EBDKhT1a00zzRPTZFaXKWV+yuVY1bvdtCIjVk8JFzhVRWCfigN2dZvCIGKEK3U5SmNIEc6/3EXg
	SEbIgoe1WUBQ==
X-Received: by 2002:a17:906:7303:b0:c15:dd38:7f26 with SMTP id a640c23a62f3a-c15dd387f5emr268770366b.31.1783621650366;
        Thu, 09 Jul 2026 11:27:30 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:29 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 6/9] staging: rtl8723bs: remove unused ForcedDataRate from hal_com_data
Date: Thu,  9 Jul 2026 21:15:13 +0300
Message-ID: <20260709182627.16327-7-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set once and never used, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c  | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 4fdda25969f9..eea7ff8948ad 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -94,7 +94,6 @@ static void Update_ODM_ComInfo_8723b(struct adapter *Adapter)
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_NET_CLOSED, &(Adapter->net_closed));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_MP_MODE, &zero);
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_FORCED_IGI_LB, &(pHalData->u1ForcedIgiLb));
-	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_FORCED_RATE, &(pHalData->ForcedDataRate));
 
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_SCAN, &(pmlmepriv->bScanInProcess));
 	ODM_CmnInfoHook(pDM_Odm, ODM_CMNINFO_POWER_SAVING, &(pwrctrlpriv->bpower_saving));
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 273080ae62d1..578cff14adc5 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -154,7 +154,6 @@ struct hal_com_data {
 
 	u16 CustomerID;
 	u16 BasicRateSet;
-	u16 ForcedDataRate;/*  Force Data Rate. 0: Auto, 0x02: 1M ~ 0x6C: 54M. */
 	u32 ReceiveConfig;
 
 	/* rf_ctrl */
-- 
2.54.0

