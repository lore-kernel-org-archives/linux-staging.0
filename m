Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F8346AC6
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 19:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863414; cv=none; b=dEOk+qG5F4aSJSZaFAVoO36qJ/rcN5SXJjS84PlxZanyIrwLuMUD9Ng2A16WdfYeQePzUJdkOMPET0zhYC6Hr94iBDmSjhqDrq7cS7zZgXDrTzuiopHRXavx0kG+v2+RVs4wMMWst1cYNTMdO6iwKvUpYrV4DcpBxdFeUc0ysZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863414; c=relaxed/simple;
	bh=//bcGiJKOcS3S7fv+h0cbs+hbw1ym/cPTQGJ4TytRy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vp72GK00drq4xTRMZ261a+om8O2n6WAJIdgNEyfyLU6Iu/eRcLvKdk3ucnp/A8QB8DCHQ9BG6PiS09HSTTzAeJhSrNlvqFRfWb58GP9aShDmZJvE68HyriuJhbS7u0Wb7I6T6ylWbTT2HDsURb0LsClzfVxbL92YgYRwf9MJ0AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=loeCqRvi; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="loeCqRvi"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48539d21b76so1788115e9.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773863411; x=1774468211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5JIR99UNR/WbbAtNAUT8+HmstMyC1vAIxyPdST6wJ1w=;
        b=loeCqRviFMj6FJyXdNxBs/feZWiL7qSm80HaJYZlyhlAOH9WY3splfakg7om/b0XXw
         rDyf8NDqK6vL/ZyWIHdasdfdC+wnNQMopeaxQuLzwiG3Eb4P9ML4/3AWYGB1ktRJdpio
         dLoh7kN/tKLKWVVAHwG6RQFEI+qaEtUpf/Qd76/Va7NAegghle/V6zZWiFOyqVlM5sDx
         2J820utLXT1UHzcGI+XmAdju7J17/bP494ppebypyxtHulOOLOZL7xKypgMtfrfNZhGx
         QJY8g9HVTPaN1B7qln2Od2AXqhmZtaCDDovXhTvw/K0AdvU5V5lpS7rjtDeXBbpEhPdg
         z+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773863411; x=1774468211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JIR99UNR/WbbAtNAUT8+HmstMyC1vAIxyPdST6wJ1w=;
        b=ec5bsiotSe8KOL4NHS1v5uxtdFLqCkBeGEGW4WJiuR5Us16DBkxGBYxA4xbaz6XOK8
         Ct9x+eqn1qFyj30XqRCaSmex7xkFV9flC4kq0T8jafeaPLMaulni1eiKNjUb0682ixEJ
         KY6QAyEyBEZ4ccBSwpV/Ut8NsS0DIGTrrkbfTYmTV8Zotyghe2Sp57H0qGhf9upo8XEl
         r64ym8yEmrv2WxVHUDS+1RUIZ78Jpcqh2pQt7EFUVZZZHIQJd1+BO6PRCSV9i1SyMzAd
         yfgYb5VbUNwr3RudGZsrIsJd9RenRnwaYngkBnbhZe12ifWctHc4fl5+SJ3tl6EWuFiB
         Lazg==
X-Gm-Message-State: AOJu0YxXbbgf7DaG4QSrl3omB5Gjk1+/DA8Kajns47Rv7/Xe7bpsya6B
	gTM4Yar80DHWb0EXjAjcQjo1MtxzYOi4cx42GgNGB/HCl8uWG6A+kUR8
X-Gm-Gg: ATEYQzxbqOJ8btsfpkM2a9gpeovqrxra0GwbXzb20j6dzsDJXGjmyBvzYhpOUbjCT+8
	1HzO7hfU/sq1g6xvrc68TRuZS+Hm4t4dUtpEapdTdjX78FLBJcyaaAeY+tohkfftaxTRr6jkYyY
	LJPK150VE0WsmUZAMR6c81sfHUh+HwlHKgol2bjJLtouVl3H5UNnZcZm7T2Qlv2403hmPyPVGer
	b6rfrY369+Xy3vf7QeK/wU02mULVM3b8BHl+v+A+8lTLXo1hxQZdHCB7qUQD4fF1i1GWh/xBv/Z
	v+b2PQLKJhWpaSp1HDn/DbxAHv0p42P0RU8YwnlPmth1wuSYu9B7vpF5Hg5z2qWQNIpMBixq50J
	O/AFlnp5rv2+naVMYkaYRO4RRg7ccx/wTVU09MQ+4UisegJEZL6GpH+dmWso425gmf/iSVuBnci
	MCG8Cp6CSQaWrtRIt17UDLaBE=
X-Received: by 2002:a05:600c:c163:b0:485:9a50:338d with SMTP id 5b1f17b1804b1-486f441b7a5mr86684025e9.3.1773863410782;
        Wed, 18 Mar 2026 12:50:10 -0700 (PDT)
Received: from bera-arch ([46.221.93.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f45f7e96sm53235095e9.0.2026.03.18.12.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:50:10 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Remove dead code
Date: Wed, 18 Mar 2026 22:50:05 +0300
Message-ID: <20260318195005.23962-1-b9788213@gmail.com>
X-Mailer: git-send-email 2.53.0
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
Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
V2: Deleted other remaining comments.
V2: Restored /* common */ comment.
V1 link: https://lore.kernel.org/linux-staging/2026031851-elephant-unnamed-7e95@gregkh/T/#u
 drivers/staging/rtl8723bs/hal/odm.h | 34 -----------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 38830552d5bc..d186cf2f3add 100644
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
@@ -766,7 +751,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	u8 *pAntennaTest;
 	bool *pbNet_closed;
 	u8 *mp_mode;
-	/* u8 	*pAidMap; */
 	u8 *pu1ForcedIgiLb;
 /*  For 8723B IQK----------- */
 	bool *pIs1Antenna;
@@ -865,18 +849,9 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 
 	/*  Latest packet phy info (ODM write) */
 	struct odm_phy_dbg_info PhyDbgInfo;
-	/* PHY_INFO_88E		PhyInfo; */
 
 	/*  Latest packet phy info (ODM write) */
 	struct odm_mac_status_info *pMacInfo;
-	/* MAC_INFO_88E		MacInfo; */
-
-	/*  Different Team independent structure?? */
-
-	/*  */
-	/* TX_RTP_CMN		TX_retrpo; */
-	/* TX_RTP_88E		TX_retrpo; */
-	/* TX_RTP_8195		TX_retrpo; */
 
 	/*  */
 	/* ODM Structure */
@@ -902,15 +877,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	/*  */
 
 	/* common */
-	/* u8 DM_Type; */
-	/* u8    PSD_Report_RXHP[80];    Add By Gary */
-	/* u8    PSD_func_flag;                Add By Gary */
-	/* for DIG */
-	/* u8 bDMInitialGainEnable; */
-	/* u8 binitialized;  for dm_initial_gain_Multi_STA use. */
-	/* for Antenna diversity */
-	/* u8 AntDivCfg; 0:OFF , 1:ON, 2:by efuse */
-	/* PSTA_INFO_T RSSI_target; */
 
 	bool *pbDriverStopped;
 	bool *pbDriverIsGoingToPnpSetPowerSleep;
-- 
2.53.0

