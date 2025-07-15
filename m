Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4562BEFEE
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752604118; cv=none; b=Q2KSPN1YlgY2Eb6fqdWq7RiC1hapmbY/QwIhvgUUpEbRimxu+8/2HU51DUe07f8LYNMt5ovVFluYewFQ1zy/YYc6Wa0/3K3B68wrzjIHeU90sfqWtqLox90T49ziHLijxWxotpgNo4bZlSg1xclUKQJdbzasXVSEKXN50fprFqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752604118; c=relaxed/simple;
	bh=HsVsjqp96CSAE1nxdnYGYSAYKEodowUNLTtLTEqWEts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAh08JJqeXP6rU1xP9FJA5BGG+EvRcgrIUO6rJlYAZhRD/DRPVm0Svrz//ggiEzQtWTuhyxu0tnyHzPBybNaNy4JDMDz7YxJQ9sAWlVY18+11QPDwNBIPlnpSZWMD8vHvaeGro1hsx+5xgXjZ8aVhlHX39mh79djfzHAXUG5+do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSAZN1zs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSAZN1zs"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so1121536466b.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 11:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752604115; x=1753208915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+N6rloDa/so6c0e23OdQ2WgufzjgMtOG65qPmjeMIo=;
        b=NSAZN1zs6cOFORGm8gMlhKZKkcfRRO5DGunM/e/Nzecvq16n1crR0Hrhqnpn+yAbFe
         TFlaRB0NYadYrPWYTUzdeFWkpykFoZD4q5MA/VJ7Pm2Xg9MGNFvtP2vwCbTqJn6gyh25
         KH1sq+6F7ztR/Hk0xNfsJiCxUXVPzCUR8eGBMcFv49Zii6WeReI2KERHYlzCz3dav88a
         nZOR7EKtxZSv34bOe4HHhRU6QGjOkKFmIClpfxZze17JbRqb0XJNKHtTe8SJ5eGGDYRI
         5HiNX512m92sWHNDxQppreSR7lErLm53k3gonZzwzqDXBXfkrk8aAV0rErQwf3iSF07r
         +wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752604115; x=1753208915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+N6rloDa/so6c0e23OdQ2WgufzjgMtOG65qPmjeMIo=;
        b=uI5NaWkbSsP6OcmF2wSsMqM6hD8LMSnjFxwhtf0tmu1t7MFbELqXzRUEF0Gic7m92l
         hrXvrCLJ/1HgWtcCQ1AlXwPt1sUWsDb7j28NgKQKDWFoSMUZv4Y5crm3VheiLlgMWwQ2
         j4ZCTONiSxwIPbmmB/sG/w4J2j7lbPqzUv4ZLPJ1NjUCoEXDt7MjKGI7cDY5Aq6lBbc3
         zuMYe/P3xtnZeXQRcV7/mSWtLtyJzHcf9e5nUwHO3QCTTTJbR5wWNGV2ntirpXVsXCo7
         n7oHDdz+YtvXiytz07QQlMoLVSpVMwKGbUvsc0PjDr0+tMcSRV/7wrBhEB2ZLODrVKmn
         lyBA==
X-Forwarded-Encrypted: i=1; AJvYcCWndJVDCf1HdcMS8hSmUrX282+/vjZ0GvIHbyy1lAZIuSp+8fVKVwQgqZQbz1x8Oeyc4G72xaaZiCgAvRCz@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq42XgHed61/6z7/bYazE/RR/9FdCsdqjv4gWGxGNs8EeVP5DC
	IDwvWFMUujlxWQ5S91JvDroV9fTRehWh25PNCG6fg6XNw1MCOmJ5Hy5b
X-Gm-Gg: ASbGnctrJpNPz5Szo7UFyCrTzrGyrHhAN6USKZDEuOkrXC72aCuoU6VoMCtUWRIzztz
	hW+KFkx3pMFgoRDcZqWHd26rTM7C1G9skJNUnb4JOwXsN4yWSe23MTyYsjyZQ0VhFGxC8UYmLc7
	olVUvzoLhFzMLJW8PJ8rnMrHa0K1JOShVOuxk90IX4s12MvLL1wBGpppaYyePGyRonmLa3byss8
	wLJMoazgdIOG6s8P4kC6S78qZGlUZWm9AdFhLuVHLJzkFTu4beqhWXBUQ6OxOXREL99Hc5csWRm
	G95CdTL7+nc7NG5MxSa2EtUzF41oAA3K1EviVcNgF+B7Md7yqOozUoqEermWg2alucTx+Ns5rcR
	lwMFEFwMIhdgsIOjwCE+fiAp2l3atYPdUIQ==
X-Google-Smtp-Source: AGHT+IF8E1sthRTUzxGSYoXHUh8aLAnMGYJZQWgj4FEF9Mhm8qlktL0bfOYTpUvIq2JQTzfnPCMYEA==
X-Received: by 2002:a17:907:3c89:b0:adb:2bee:53c9 with SMTP id a640c23a62f3a-ae9c9987eebmr59823466b.3.1752604115154;
        Tue, 15 Jul 2025 11:28:35 -0700 (PDT)
Received: from tumbleweed ([95.90.185.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df2fbsm1039562766b.158.2025.07.15.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 11:28:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/11] staging: rtl8723bs: remove function pointer hal_reset_security_engine
Date: Tue, 15 Jul 2025 20:28:12 +0200
Message-ID: <20250715182814.212708-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715182814.212708-1-straube.linux@gmail.com>
References: <20250715182814.212708-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function pointer hal_reset_security_engine is never set. As a
consequence, the function rtw_hal_reset_security_engine does nothing.
Remove both to reduce dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 --------
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 2 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 29e0610f72f1..dea38bb8424d 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -73,8 +73,6 @@ uint rtw_hal_init(struct adapter *padapter)
 		if (padapter->registrypriv.notch_filter == 1)
 			rtw_hal_notch_filter(padapter, 1);
 
-		rtw_hal_reset_security_engine(padapter);
-
 		rtw_sec_restore_wep_key(dvobj->padapters);
 
 		init_hw_mlme_ext(padapter);
@@ -293,12 +291,6 @@ void rtw_hal_notch_filter(struct adapter *adapter, bool enable)
 	hal_notch_filter_8723b(adapter, enable);
 }
 
-void rtw_hal_reset_security_engine(struct adapter *adapter)
-{
-	if (adapter->HalFunc.hal_reset_security_engine)
-		adapter->HalFunc.hal_reset_security_engine(adapter);
-}
-
 bool rtw_hal_c2h_valid(struct adapter *adapter, u8 *buf)
 {
 	return c2h_evt_valid((struct c2h_evt_hdr_88xx *)buf);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ce3c6de8a325..d6fd692aedc8 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -161,7 +161,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*hal_reset_security_engine)(struct adapter *adapter);
 	c2h_id_filter c2h_id_filter_ccx;
 };
 
@@ -253,7 +252,6 @@ void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter);
 s32 rtw_hal_xmit_thread_handler(struct adapter *padapter);
 
 void rtw_hal_notch_filter(struct adapter *adapter, bool enable);
-void rtw_hal_reset_security_engine(struct adapter *adapter);
 
 bool rtw_hal_c2h_valid(struct adapter *adapter, u8 *buf);
 s32 rtw_hal_c2h_handler(struct adapter *adapter, u8 *c2h_evt);
-- 
2.50.1

