Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FC03B3888
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320060; cv=none; b=FVXSnvgJnbXJBWr75L8vd3oYZ7Ii6D4G+IJuYZScJ1Aj5jlH30ajdN7bpE8uvjiV+qnBl/kvx/WEvR9sP5h2aa+PBb7U+q5rcXo0JGFvQ9jFxdaTV973x2BnsmEtDenzRX4MJTV1yL3FS2TEHqaQlwiN63sCvQkrEVusCYUpFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320060; c=relaxed/simple;
	bh=YfLSiGNVDZQSuosBvi6wAa5Dq/mxdp+KPpVslTKEjuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k15sbbc08SkS/oldTKfQZPum+qC8QVQj5CRUq7Frim47/EmSXkyKl0zXKXzAo4+j+MwJSID24oTByyWIZeZK14KwnaaVp9EwwN0pXWw1z35j+coomk+ERweWXxZXrn/3bMXvMVf7yFOQKJyatsGFviBwY3jD7J71PDbLi/Q2cHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atZt9Tbs; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atZt9Tbs"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439ac15f35fso927566f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773320057; x=1773924857; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CU0ombwoSminwA7CrqWR5bVxe1ZRAsD3YnHqrHkpKBY=;
        b=atZt9Tbs0VcUMhH+dQSymiKvOQrC1FPN0u4mYmm+gCOUxXpYtx/jxyjR3eMfw7/RwY
         rAUX9740mc4H9741Uk+on+aEuCjsu7bv4d2u+uIEEwmkV8I9Z107wySdKyTUuP2cvpHf
         OFKcHMp2PPvrHCeTjXibg/8her2BAKRQANudAslW4URrqkEM3ClN/3LTOVq6UfyitYea
         YAXrthewksiC/LcqvgqCfIxfA7jCSErWK9vGLgnS9pjcqsL9qYo9Kn8MRBiy4n3YKm0b
         r3uweY5LTiEsRf8/nx/WgnsXfdnbfyPxS8SPdyMu9+RO6fJNoe1uZlYMQWuUORfgf+40
         dDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320057; x=1773924857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CU0ombwoSminwA7CrqWR5bVxe1ZRAsD3YnHqrHkpKBY=;
        b=lm2PIs+prh/+gSMSjN+smWlEwpats7VXmjsWO1me2uQmHfN1ouBT13jq/yesmIk9aH
         d6CpZiAQB0GUpTc8Qsm+F/PDZGb0VLY08P2zQ3UjDmpppdM5TFLXtxYxFUGZiKFbmrb9
         d8XbVcC7aMT7oCH8ihemo75iO/Whl3B/0Owj3yTiKBiAFQNmXFdgylmaj2PXfubgfRk8
         dqWxEYNGUkHKXRGC/ax5+TBWLKRvk5L2uhkHqMXZ24PW0VXqTI82YH2/+OpiGs6tVzne
         qv4+PPV57WSusULTZYV744uamkBvnAidfak/JhQb0SqaCnh6wirj9KJI63kDYEkd7MIU
         8E8w==
X-Gm-Message-State: AOJu0YyuUvrCad0d4z50dOxNGrxBnd3CJ5GWWOX4XGmhYOatNRccJDI1
	4uWQsK2lGj2+j830l02V/SliSaDpDPlncThUAJFHIyoFDFao4mNBzZDr
X-Gm-Gg: ATEYQzytYfHbQlAu9Jo/s8vtWEMDimDGlEy1L1j4SFm0DaW3OJ2cIpXCp+gRXraHF4O
	MgI5HqwkeS+MrYtjDT0HzkJYYNf9yBvF1z3LyjAoTxKVT7zI0mf9abcNNBCn5qtVwBYHe3g5ta7
	rFLlYlS9a+DD/K32/1G8qilDe4TxzvUCmu+FLfBWpI0U0G6wYVwpGUlstwMymmdNrSMdWF2kHgg
	9JZE9t5CRfjG2geWu+0UCHUVZM+4MBBu8PsOWbFylf9oMmp3OZQrBHF9ScGST0fr7UGfc3gGG/U
	dhSUiTqo6g/xXaLa728Ue/IAV5X1WmYGmsguYFU53u1OtKUSIVEfECAGYasez5LPZMosbVWxDwx
	IAz8RWRYB7zypim8JGe3xloIEqtQnPifqG+8PelVR6Dn+K5GfVSFcNVHFW+Y0G8JguTawq3A0p+
	fkWkr5B4+di/dePBu8xHDzGywv2QWpPQEHVDbZhuqDoaBw+3bHfHI=
X-Received: by 2002:a05:600c:64cc:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-4854b0b97fdmr98952865e9.8.1773320056834;
        Thu, 12 Mar 2026 05:54:16 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a2eeae0sm48124845e9.4.2026.03.12.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:54:16 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove dead code
Date: Thu, 12 Mar 2026 15:53:38 +0300
Message-ID: <20260312125337.1050-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clean up the dm_odm_t structure by removing commented-out members and
related legacy comments.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 33 -----------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 38830552d..d77763d28 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -650,10 +650,6 @@ struct ant_detected_info {
 /*  2011/09/22 MH Copy from SD4 defined structure. We use to support PHY DM integration. */
 /*  */
 struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
-	/* struct timer_list	FastAntTrainingTimer; */
-	/*  */
-	/* 	Add for different team use temporarily */
-	/*  */
 	struct adapter *Adapter;		/*  For CE/NIC team */
 	/*  WHen you use Adapter or priv pointer, you must make sure the pointer is ready. */
 	bool odm_ready;
@@ -673,17 +669,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 ControlChannel;
 /*  ODM HANDLE, DRIVER NEEDS NOT TO HOOK------ */
 
-/* REMOVED COMMON INFO---------- */
-	/* u8 		PseudoMacPhyMode; */
-	/* bool			*BTCoexist; */
-	/* bool			PseudoBtCoexist; */
-	/* u8 		OPMode; */
-	/* bool			bAPMode; */
-	/* bool			bClientMode; */
-	/* bool			bAdHocMode; */
-	/* bool			bSlaveOfDMSP; */
-/* REMOVED COMMON INFO---------- */
-
 /* 1  COMMON INFORMATION */
 
 	/*  */
@@ -871,13 +856,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	struct odm_mac_status_info *pMacInfo;
 	/* MAC_INFO_88E		MacInfo; */
 
-	/*  Different Team independent structure?? */
-
-	/*  */
-	/* TX_RTP_CMN		TX_retrpo; */
-	/* TX_RTP_88E		TX_retrpo; */
-	/* TX_RTP_8195		TX_retrpo; */
-
 	/*  */
 	/* ODM Structure */
 	/*  */
@@ -901,17 +879,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/*  ================================================== */
 	/*  */
 
-	/* common */
-	/* u8 DM_Type; */
-	/* u8    PSD_Report_RXHP[80];    Add By Gary */
-	/* u8    PSD_func_flag;                Add By Gary */
-	/* for DIG */
-	/* u8 bDMInitialGainEnable; */
-	/* u8 binitialized;  for dm_initial_gain_Multi_STA use. */
-	/* for Antenna diversity */
-	/* u8 AntDivCfg; 0:OFF , 1:ON, 2:by efuse */
-	/* PSTA_INFO_T RSSI_target; */
-
 	bool *pbDriverStopped;
 	bool *pbDriverIsGoingToPnpSetPowerSleep;
 	bool *pinit_adpt_in_progress;
-- 
2.43.0

