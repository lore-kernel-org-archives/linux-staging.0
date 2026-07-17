Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A737E5FB
	for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314466; cv=none; b=C9EByG4pTfgP58FqbcaTHKD2dTOq+R+LUTlcZL9/gGHPB9RBf1ZUbeDSUBiJh6IyT3yqcSlbjXHHc0BD2ysGe7xo0rW7bMXZolN2OyLjNrlJmtgw80VNzeq1mWYo5Lj+DBPob+oWL4cfmDK7X4vrQ28mINeKk2Wc0l/CBVb239c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314466; c=relaxed/simple;
	bh=AihO/u+2gHTUv0lT26H4iNsuCnzewcwtKV6SKBkOr9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tns3zrgFvojpFR1KyGeNbN6Re7Yh/9ER+ZYsJBPJtKnJA+hn0iOLykBLRPwuyfKcdoTu+if9YFQ2NOi0SAbeX4VWfFhuR8S4iYaDx+fIJ3slBtnd/43Yjbck6LLjBowliZ9cu5D31oq9ZUmgQqDzKVpZIx4s8iAZtFjqlhZWlkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgGdlcp+; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgGdlcp+"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c16794450aeso415673866b.2
        for <linux-staging@lists.linux.dev>; Fri, 17 Jul 2026 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314463; x=1784919263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBd0A16xIYhVRvp8WviqmtFa9SWI6LXYXdyTI54ramE=;
        b=MgGdlcp+zqQIqMcHehOrat9ECjyLzZAHAaSBg6logOpgzXqyfRXclBZQkkdvm1tnKJ
         9DBbteQj38EBMcxEWnzyUl8n1zEK0XJ8d8Ki9n++xerMwv8G07FuPeVAMIt2RLkKrdNO
         GFQIJKBXufwqSNXDqrY1dxOy7AVCn/eZnfGvVgGFI2t4e7tOM1irReiRc4lloXaIx+yK
         7f9BxmDR1bYNGT55V5o8mf3jp3eQm87jDIpEqrs1WEi5HpoWJkAcNQcas2scbHGgv0pb
         PXTkBx469Ej6Dvw/Hmsn5Vg2mB3nh9nyBDYVpu3lxgMjs1qmXqxq1JpORh7iD2+xcCxp
         OhWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314463; x=1784919263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBd0A16xIYhVRvp8WviqmtFa9SWI6LXYXdyTI54ramE=;
        b=LnY4x4bVzqA7/8CSWwCAnoHQBeELXIROJ6Fkwi95izXJb+ctCMyomUZ0zEgRPdp7uM
         gL8DYo8Oqa5zJVs2iHLOL8YdeMBZVobK2N37E1chRC9TlBeGTgrZZXEReZLJroXxmtMJ
         aiDOkTSiOM89Y3Wk9neCuwalYxblxbukBkmVT7JDXBFsfjaNSq+4hwCaIlIaPdPSCKz+
         QciYo/k1LDwNH0POsjuQRwzBJAmcoEy1KFiSQQBvrp+US6MXDf5guomToFpu9HWaunCt
         dJowF/4BEkSB3nGg4vxVmBBPY38ZqO+hvg7UnQCFvGNJ0e+H3T3+sp4/Z9580I+dNHw1
         dtaw==
X-Gm-Message-State: AOJu0Ywv9ZjmyYG67ccJGUZD7tyHhKhDy5qK/HVYlM/6CTAuNENPsUqF
	yyDdZolaBmjZ6gF+jT2mo6TaNnDMqM5fRd9sNDLxbIBqrrjUrsgeTZxCydKpDg==
X-Gm-Gg: AfdE7cniIqDNuP5oao0WfJ9JlpXliX9UFiPrRZkD2KXeocUnVAVUavxBlUwifjOwImG
	Z4kFAeOVLIpeUri4sHheKJwQxtTFZ1qCUxkO7EyMEUgpJh2sgxYmftIFLVlJH1lx/yx+ktID3n3
	Igv1V06/npXVXr9dztUrEo0tF1Mw0vS8nZBFABpPoWZ/ZBMKjAtQilTWvILQjVrsl2jwFjqR6GT
	88i93REpsio/+X42Hm7lDmHhZuwN/3CxTgrkJPj/OgeciZfvJtaXj9VPle1McTnAK9mTelBKUPV
	cMs6bFPN28CA/gkXQjFmD8WO4NVuix+QH2aC8sITYQCBLYPggyopAOZAAp9Pzy9aCF7vMuYnAFT
	wHE+9HEgPuON59fQbcR9jYBdkt1MgW6TTrAB0O+EXxnm1mmKhVt0ubtDwsGkwoFFqsdnpzWXzJ/
	DifR3Ob78h8Cc=
X-Received: by 2002:a17:906:c151:b0:c12:4ddd:ade1 with SMTP id a640c23a62f3a-c16b4581152mr201872866b.4.1784314463493;
        Fri, 17 Jul 2026 11:54:23 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f8c5sm118622666b.34.2026.07.17.11.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 11:54:23 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 4/9] staging: rtl8723bs: remove unused 'bNeedIQK' from struct hal_com_data
Date: Fri, 17 Jul 2026 21:52:03 +0300
Message-ID: <20260717185407.56513-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717185407.56513-1-nikolayof23@gmail.com>
References: <20260717185407.56513-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value 'true' is written to this field, but it is never used.
Remove it and the case branch, as the latter becomes meaningless. This
also requires removing calls to rtw_hal_set_hwreg() with the
'HW_VAR_DO_IQK' argument to prevent execution of the default branch
containing the netdev_dbg() call in SetHwReg().

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 2 --
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 3 ---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 4 ----
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 5 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 5731a245c0d9..8fb2d41c8984 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -680,8 +680,6 @@ void start_bss_network(struct adapter *padapter)
 	/* Beacon Control related register */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BEACON_INTERVAL, (u8 *)(&bcn_interval));
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
-
 	if (!pmlmepriv->cur_network.join_res) { /* setting only at  first time */
 		/* turn on all dynamic functions */
 		switch_dm_func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f5ab94a2d0a0..d50c36036f4a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4009,8 +4009,6 @@ void start_create_ibss(struct adapter *padapter)
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
-		rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
-
 		/* switch channel */
 		/* SelectChannel(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE); */
 		set_channel_bwmode(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
@@ -5305,7 +5303,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, pmlmeinfo->network.mac_address);
 	join_type = 0;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
-	rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
 
 	set_channel_bwmode(padapter, ch, offset, bw);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ac4bc18b6f93..81ae53c60623 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2636,10 +2636,6 @@ void SetHwReg8723B(struct adapter *padapter, u8 variable, u8 *val)
 		}
 		break;
 
-	case HW_VAR_DO_IQK:
-		pHalData->bNeedIQK = true;
-		break;
-
 	case HW_VAR_DL_RSVD_PAGE:
 		if (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))
 			rtl8723b_download_BTCoex_AP_mode_rsvd_page(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 532b1635831d..4f37beb0c2db 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -210,7 +210,6 @@ struct hal_com_data {
 
 	bool		bSwChnl;
 	bool		bSetChnlBW;
-	bool		bNeedIQK;
 
 	u8 TxPowerTrackControl; /* for mp mode, turn off txpwrtracking as default */
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 8a85e8419e47..26b871e420c0 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -97,7 +97,6 @@ enum {
 	HW_VAR_WIRELESS_MODE,
 	HW_VAR_USB_MODE,
 	HW_VAR_PORT_SWITCH,
-	HW_VAR_DO_IQK,
 	HW_VAR_DM_IN_LPS,
 	HW_VAR_SET_REQ_FW_PS,
 	HW_VAR_FW_PS_STATE,
-- 
2.55.0

