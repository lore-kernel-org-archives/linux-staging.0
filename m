Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600636C9E2
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773920329; cv=none; b=k1kuTf69T503g/9lg5vToEZ3xafV1FaBxKGzBSjNklyoFr0Y8P/0J+DRmUmg5An7CVzp+bAo/TQTZGJK6SHmqVIsfBx+E39x6FnuZoIgz5kOx1D8DCKUw6vfIMMiHPWYGN+Xa6N2C2UIpK6tgbiMhMt2KS28G9Q9HLOsyrs983w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773920329; c=relaxed/simple;
	bh=t5jw6g7YnoYXCemaevIyVUj0hWiJOSZ0OosTNRjkSZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5nt5eJISL2NZ+wwPaWW37r8mZFLONDxlq1dOL+G7SouoWjKdHTeBcKv19TlvpHklGJ/OV5dVN9uPKJHJQxklfaSghzJOJZrFHJfwTRvBJ8ULpOHjLAkWcgnV51+gk8IMam6vYq84r+reXcr9jqvN9XP5tYWfvBptDDEUtAzpsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=np1XMK2I; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="np1XMK2I"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so592831a91.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773920325; x=1774525125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4w2v6nZzIlyeI0PLLl+tEcOygbxhs5NbzP+idI4uiU=;
        b=np1XMK2ICYmbqVGUXECUVn3hpkH8hbGr1WFOrQ6RZtoS1xr3k2no08Z4eMVnqV88GB
         NuouiTlZMlA5S2/DNaZXGh6AHsmrr3sfMyB5+VpwgmIf6hs07o3C0k0Rf4Foi89uCGY8
         MyIlGp3KhumO7f395Inv4H1sOatb7GaY97kl1hUAbKcPW+5Dqjf7FBE6IpUXJWTMDh8S
         KjXdp5/lL36HHBF+jqZ96cQzJo5PlgB9+SQtsPl1VVy9VVm5G6szyPE5aORv2HQW1+A8
         ozf52tyeep+CZo0pxNYiPFCQdlHTXDPw/7H7dnwHwzQ6Kmcxkd0649Ve8t93mHTxarqb
         wDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773920325; x=1774525125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4w2v6nZzIlyeI0PLLl+tEcOygbxhs5NbzP+idI4uiU=;
        b=ViuWX2yKoFq+hhmKQRl+862TOLjE4rknDonGUfTHGmuNnVevVHoRPwNoldBzTqFJlP
         iYZKXKt0jPmrAkurFFHyxbjRnbPdfy1UvvpAh700nG+ZT5n/QvdrOJ2ojP1NIeTSdPHD
         ll0fiWXtX4kB1NydjDdxZsWL2sxGSariCOP7zYetM/S+/6Cfic55VLauKAJOOxVe0uDw
         U5Wu/mJIw3ZRx2aVzg4yx3UuSRo/5dvhbxPP7uNu8FznQGDgR8JOVOwZRC0Liglsg2bK
         tiaD+Z62fO2HRwFhX0wlLjiXPJSTlGwKrfi4oZpWLhXojlVsZFoDHIzWx5Cf3I7DbEQK
         UyKg==
X-Gm-Message-State: AOJu0YzE9HHxVwO4I2ZUpC/QtT8zmICr8ySkHEQo+oek0M7qsQWmH1lP
	KuLJ89KMD42DGNSSeVfBr2PBWXBbw+Pzv69DSlmijnQIZvL9/FRHufF7
X-Gm-Gg: ATEYQzzz3DOy9ho9s+M2xWO+ag//Ya6RYXPhogGUYThQ/h9tdnm5Cbtg4aB8sWK2zzW
	OMLheAVWMR1uuswj8QzcrHx121hZg6oasW3AOe5xQJ7phm8ogCfcT2D1KPaaq53rgVAQ21dE0Rl
	qxaRpmEWLgFcsG0ESuXxA6MUq0YP0g5tsXNkTF1YAXj4xIGbHPPyNLZHetGgCcsgi8RGJhYv2ej
	Q3Ol9dcJU41/O7FuE8BwBSmAkt3816BHl8I82FkipUktSzAG5P1y2jB9i0HKzRdslRbh25vRj85
	e4M5bXkTAoOIYvru7kWf+ZJxnSebdDO7IXnsHqVS5OBjtr1WwawXN/vSVo1soQssNSyuZPolCId
	2RVQ1p8QDETmVkLlVM3lhLsIjacqbczGwrTe83ju6/ykZQxB5LR7wqmyEx3/Ejckuw5WTvxjKj2
	saJT2S4wJDgdu1E8ZpzevttJsguHKIw7fN/uVs/fyKFMa4w/GnQoty
X-Received: by 2002:a17:90b:3f47:b0:35b:90e7:c458 with SMTP id 98e67ed59e1d1-35bb9e3b965mr6170487a91.3.1773920324745;
        Thu, 19 Mar 2026 04:38:44 -0700 (PDT)
Received: from ZC-202510311500 ([123.139.41.12])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0da7a6sm5191149a12.13.2026.03.19.04.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:38:44 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"haoyu.lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix long lines in core files
Date: Thu, 19 Mar 2026 19:38:35 +0800
Message-ID: <20260319113836.1063-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "haoyu.lu" <hechushiguitu666@gmail.com>

Fix lines longer than 80 characters in rtl8723bs core files:
- drivers/staging/rtl8723bs/core/rtw_ap.c
- drivers/staging/rtl8723bs/core/rtw_cmd.c

Split long comment lines into multiple lines and extract
repeated expressions to temporary variables to reduce line length.

This addresses the TODO item "checkpatch.pl fixes - most of the
remaining ones are lines too long."

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c  | 18 +++++++++++-------
 drivers/staging/rtl8723bs/core/rtw_cmd.c |  9 ++++++---
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 864cd8b6d1f1..0d40c8f45899 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -270,7 +270,8 @@ void expire_timeout_chk(struct adapter *padapter)
 		u8 backup_oper_channel = 0;
 		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
-		/* switch to correct channel of current network  before issue keep-alive frames */
+		/* switch to correct channel of current network before issue */
+		/* keep-alive frames */
 		if (rtw_get_oper_ch(padapter) != pmlmeext->cur_channel) {
 			backup_oper_channel = rtw_get_oper_ch(padapter);
 			r8723bs_select_channel(padapter, pmlmeext->cur_channel);
@@ -610,9 +611,9 @@ static void update_hw_ht_param(struct adapter *padapter)
 	 *	AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
 	 *	AMPDU_para [4:2]:Min MPDU Start Spacing
 	 */
-	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
-
-	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
+	u8 ampdu_para = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para;
+	max_AMPDU_len = ampdu_para & 0x03;
+	min_MPDU_spacing = (ampdu_para & 0x1c) >> 2;
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_AMPDU_MIN_SPACE, (u8 *)(&min_MPDU_spacing));
 
@@ -839,7 +840,8 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	/* beacon interval */
 	/* ie + 8;	8: TimeStamp, 2: Beacon Interval 2:Capability */
 	p = rtw_get_beacon_interval_from_ie(ie);
-	/* pbss_network->configuration.beacon_period = le16_to_cpu(*(unsigned short*)p); */
+	/* pbss_network->configuration.beacon_period = le16_to_cpu */
+	/* (*(unsigned short*)p); */
 	pbss_network->configuration.beacon_period = get_unaligned_le16(p);
 
 	/* capability */
@@ -1497,7 +1499,8 @@ void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
 	switch (ie_id) {
 	case 0xFF:
 
-		update_bcn_fixed_ie(padapter);/* 8: TimeStamp, 2: Beacon Interval 2:Capability */
+		update_bcn_fixed_ie(padapter);
+		/* 8: TimeStamp, 2: Beacon Interval 2:Capability */
 
 		break;
 
@@ -2075,7 +2078,8 @@ void stop_ap_mode(struct adapter *padapter)
 	pmlmepriv->update_bcn = false;
 	pmlmeext->bstart_bss = false;
 
-	/* reset and init security priv , this can refine with rtw_reset_securitypriv */
+	/* reset and init security priv, this can refine */
+	/* with rtw_reset_securitypriv */
 	memset((unsigned char *)&padapter->securitypriv,
 	       0,
 	       sizeof(struct security_priv));
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..57e6aa433627 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -171,7 +171,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 
 	pcmdpriv->cmd_seq = 1;
 
-	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ, GFP_ATOMIC);
+	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
+				      GFP_ATOMIC);
 	if (!pcmdpriv->cmd_allocated_buf)
 		return -ENOMEM;
 
@@ -183,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+		    ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -298,7 +300,8 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	u8 bAllow = false;
+	/* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
 		bAllow = true;
-- 
2.53.0.windows.1

