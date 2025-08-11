Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158C2D879F
	for <linux-staging@lists.linux.dev>; Mon, 11 Aug 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754893393; cv=none; b=KvRC4hZ1GUNjXUe455sz5VxeeNw+M7SYZBwXu8jVOVdNlAaOC8E7ZUcAj0uZc2yKjAXwyDuG7G5/Aso7lb6FA0z5ghRIQ0BwLTocIDZ4A6aFumIFZSQ3xfzscR9iuf8Sv/t/8l6EWvuJ7JGoZLrzvd8DyyjD0QZwckHbfMIonXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754893393; c=relaxed/simple;
	bh=BDHfmpGRoMLI2dfKAdoBmS9LLQ+5JJl77qRq4cIAqr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnYx87w/gjjwXHMIQ0fvBPlu7rZk+wM5O6VmftDvUBvA1wHMK/n6xzcedmSyAQ300Un+rrixSJ6pZJMRBHInclh6XKVlRoZwO0DmfvJBhyJqxO4XU/uLXYQIXfn0zruYqb5VTs2DvenXI7XyflyQMjjypNAPPrcbVjGSdXXtW0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsVar4aP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsVar4aP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76bddb92dc1so5032127b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Aug 2025 23:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754893391; x=1755498191; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4706zPWsZ8yK/O+0ngyqMtIMgZD2SQFMOmzvu1UjvI=;
        b=DsVar4aPaxu6wkTuaWDieLuheWh3AhiODr1ZP5+5pZnIYYTQbhtQgy9uTcFR/ShMzL
         4+Ye98PEcGrRHHlR+suKotJbtHo8EYyWL/YZMEMR48z/UFULFQ2l+MqR2BqgmGuOcLbF
         aMB6u71m33I/9J6fDA42UEfqTftOMlNqQxzTF0POGh7HgFYQRpfd7gmgRxofzGNbYFby
         GVrx7PfbDiw6gVTCw9u7cyHi44Whb0EctrLmnSavYYJ0HO6nDqwHjITha83x++7EcOk0
         vd+YDGEyXlJlcmHM+G1sxA/m+k9UXz58gHaUxxLx4bIT/oyPadkMJQ4wEeLJtTvcOM6H
         Qg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754893391; x=1755498191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4706zPWsZ8yK/O+0ngyqMtIMgZD2SQFMOmzvu1UjvI=;
        b=wP5jGTF50vGsorza0P7CsmPMAvLd+eQi33Hn3t3mGxMREDA3kHyGOG0dkhlZ94X+26
         aTZlaQyldanmUBuDdIeWPobBAXvFp4xMIMFFu2yFJ/tFOTGHpFlqFxPONiptg6t01230
         mzoF6YVMEvfx47uHhdMatMk/S9g3lkSGBw1+BYtOfWKL+J9OUGYm4BnCmISg6thjdqLw
         /domzfGES7+G1EwSkTQav+RdaUbW/crLCdSfMl+1EE7bmg99Jm/ESf6+ayekZE+2JGXE
         6UbNPmiB8H0f9335TONjBgTlRKHf/X5PDVch/k8y4iGBG++Mt5rjGrVLhcY18wnGX1fv
         y8oA==
X-Gm-Message-State: AOJu0YxBd81lftQ+h5cOLtCN7iTwel9ulY7XPuvHGoGarsBVNQdMRgiX
	1n6Jc7KVJrG2Q0uC4g396GYeyFnJNBhuGr0uZc52rs0E/FOeInmnR0C4
X-Gm-Gg: ASbGncsDHDyo10NBDUERPTQvBdgHYVTfVYsA0ztbplc9O6eX8HMXGXcXAd97J/SE09n
	5aUtw13P8j6WuUxk95VZ2WunleWd4XSfqBV0/pnPo0+nkWNdUYpO3kLLemM0yQnnJBu7Xs+g1df
	puhoLuDxkg9aJCFvnBJ4uZ7CFnEEtosC7poSvz6X4WuGbsGhuzwYecnJHETaaJ1bWsiafWAW/KD
	aLEFkr+z6j1CMahKSVf+LeCl2iGZSR05xHJlrtIuaRd8I/L80SsM/iZRXtio8904zIpEXbcTy+3
	xHrO0toiFD/MCofIJDSwb17W5gH5b10PEDgm/xyUaqZqw7sS7oYMFkDQlGogmWm8PPV/hIMYVFr
	7u4pey7+2HmFxXDBj5CwSvZYoiT8HgIhmlDOTxLoKDubxCOTIwEe9jgHmvzyq2BzaytdZ02xfgZ
	gZ8dhOOs3aPcR9HzmdFgGGKrc13EctkIUyN3gGtZFC
X-Google-Smtp-Source: AGHT+IFbGEPaPuUEkhChA58oNSDpiejZ/DR/wKPGJ/Y5MGLXpbFfvBgUHgEdzDjXrtXDnuo8xalmow==
X-Received: by 2002:a05:6a00:2daa:b0:749:b41:2976 with SMTP id d2e1a72fcca58-76c46095e41mr18598350b3a.3.1754893390935;
        Sun, 10 Aug 2025 23:23:10 -0700 (PDT)
Received: from wen-HP-ProBook-445-14-inch-G9-Notebook-PC.. (36-239-105-221.dynamic-ip.hinet.net. [36.239.105.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f800sm25861623b3a.42.2025.08.10.23.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 23:23:10 -0700 (PDT)
From: Yao-Wen Chang <changyaowen19980629@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yao-Wen Chang <changyaowen19980629@gmail.com>
Subject: [PATCH 09/11] staging: rtl8723bs: Rename camelCaseVar to snake_case_var
Date: Mon, 11 Aug 2025 14:21:32 +0800
Message-ID: <20250811062132.102525-9-changyaowen19980629@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811062132.102525-1-changyaowen19980629@gmail.com>
References: <20250811062132.102525-1-changyaowen19980629@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelCaseVar with snake_case_var to conform to
Linux kernel coding style, which prefers snake_case for variable names.

Signed-off-by: Yao-Wen Chang <changyaowen19980629@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 1f9a3af84c7c..d8a474602c61 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -396,11 +396,10 @@ void update_bmc_sta(struct adapter *padapter)
 		 */
 
 		/* prepare for add_RATid */
-		supportRateNum = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
+		support_rate_num = rtw_get_rateset_len((u8 *)&pcur_network->supported_rates);
 		network_type = rtw_check_network_type((u8 *)&pcur_network->supported_rates,
-						      supportRateNum,
-						      pcur_network->configuration.ds_config
-		);
+						      support_rate_num,
+						      pcur_network->configuration.ds_config);
 		if (is_supported_tx_cck(network_type)) {
 			network_type = WIRELESS_11B;
 		} else if (network_type == WIRELESS_INVALID) { /*  error handling */
@@ -869,15 +868,15 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 	pbss_network->configuration.ds_config = channel;
 
-	memset(supportRate, 0, NDIS_802_11_LENGTH_RATES_EX);
+	memset(support_rate, 0, NDIS_802_11_LENGTH_RATES_EX);
 	/*  get supported rates */
 	p = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
 		WLAN_EID_SUPP_RATES,
 		&ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p) {
-		memcpy(supportRate, p + 2, ie_len);
-		supportRateNum = ie_len;
+		memcpy(support_rate, p + 2, ie_len);
+		support_rate_num = ie_len;
 	}
 
 	/* get ext_supported rates */
@@ -886,11 +885,11 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		&ie_len,
 		       pbss_network->ie_length - _BEACON_IE_OFFSET_);
 	if (p) {
-		memcpy(supportRate + supportRateNum, p + 2, ie_len);
-		supportRateNum += ie_len;
+		memcpy(support_rate + support_rate_num, p + 2, ie_len);
+		support_rate_num += ie_len;
 	}
 
-	network_type = rtw_check_network_type(supportRate, supportRateNum, channel);
+	network_type = rtw_check_network_type(support_rate, support_rate_num, channel);
 
 	rtw_set_supported_rate(pbss_network->supported_rates, network_type);
 
-- 
2.43.0

