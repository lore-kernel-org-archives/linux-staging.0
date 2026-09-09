Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1860342CB0
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788976703; cv=none; b=mayfJyYWJ+nkJ8Zkk6oh7YUrztuYEcHq35be/TZ5/ItQqGf6C/aWRhnMW/ESzdgrUrug/ebg0JhCaDtyfKUghpRL1l8oQDTDW8lQVBXoQVE5t6rltqDloos14W39+tVLzBsstJ4Zudwjoq8X9zjMVxQQY+T1DeogZkZ28VDQ7Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788976703; c=relaxed/simple;
	bh=bO9EDY9UhvzhX1fRElsHGgIc2anJ6kNjVHqh/0pm0nU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CilJhzeK9OcNFkRlYaLDQLVtJGPGMgvSp0q87nKiqIR71wodeqHKstTNRsmWRofKODtJpPFyhmthJ3vhfemiwwjCi8xR1BSdfch5n0TBmmO4YNkgFgGLpA8xBmCa9lsrr0hzFq4Ctfy5GPQdlFQ4U7lblVZToG/9PyBW2LVmd8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgvipe57; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgvipe57"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso5578865ad.0
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788976699; x=1789581499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIRRTKUkAicjnL9Faq7kwZ0I+W7+Y8XaIWKYHPKEMiw=;
        b=Lgvipe57RG2AYB4xEB6DIqOFjwjLRyYY+EtR5gqkRZmH9Voc9ie7FugFCPixopDJOD
         GkmEqxeNLYrmJdw/Q6LGTciV6E+RofAIHddqhK1hp8N0HqFv2Egkq6UCdUrU7Akucu+r
         ovSTgX3Bpl+UvSrygceKjNwt4bO9LVxXX0hy8JF9Y33CHMnXTEA7GuuKc6wXJmbt0OAs
         ECo7MdyqGe1hlkQsbvBjXEPA1h3smp+LFx+nJ+B9fvAFiqp/s7X/Ff6ncaGKimwMBlbR
         4bqNpV85dzKXdyxSrXvBAaEOj6ZZr6+ttxZ+bQAnBy70h74QlwLgtGkR6HKl4jZ5eMoC
         NeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976699; x=1789581499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIRRTKUkAicjnL9Faq7kwZ0I+W7+Y8XaIWKYHPKEMiw=;
        b=U485DTUziWKzQfXwqxrZqMjon+/NSMjat9vQgiZYi5FO9N3aIH/6JlSx3ZHGcZxPa8
         V0OSL+3O0FWm8fiv6WNdiUpILX0m7omBcv6bpO8Dv+q4IcNQGbFgj99M8mW0JSWK39Kb
         drwJHxhATB/0zxuDA/qkAyDnD/uHSfMFhlCc3178qTU9aneg6zt84T+ZFerYbiG+xTiO
         Upwm1sGffQl2KApP+4WMu1rF6P/XsSfTbYr42uMpWqhmaos9CHADvrbV3LrHBEim0F5C
         uYMjtozwzzr/SVrFKJyGtSZx/mVyLsBdMsdHS9/LCUXwacOIDyC/VFpufvxcfCsyWTr9
         1fPA==
X-Gm-Message-State: AFuF++lFKesCZmlW8GItK7jR70zlxyYqVYEzNWIjohQi5cvwCg8V2iMp
	m9CURejTD4HDYMOxD4E9JjnYHQuuduT/bCDVYoxQk+YdBLFSxzXMpV1wjFNvbQ==
X-Gm-Gg: AYBFou0aU/ccMRphG1ZD8ctCmF6KGeSKnOYzAdJsNCvdIwK4arjSuxHN7kyNGAMiAru
	iqHBQFK9a/8KdqNmLS2BKXZIppJXJ9jnIWlYrC08wWfYA0b7IQfBO+n/o9dBcGuPdjOkcTFOBtG
	3ht1nBS3Gxzy8685OM3nFh2Wfae1Wkd2/Wt774TBF32pyYZbjavfb9BuvwTEfl+/Iqvr7OZDmN3
	vy4NxLtcSh7tGE2boNpA8AprooRmRiO9PC9ZiBTsOfaKSwGndPniMX+An1DBIsLvaR/elO5qvxX
	sEtiA64ZcdFWzxgulhLjfLIA3j8QELXSF4BDwck2/hCGA16JH9M+6SZ5/aanXZ4Cl1JKcfmPYMH
	uhP8T5Hc3CyF2i+MIS5Nr+BM6x8RTu8FwqAkv9m3Ehsu5aObQK5iupjtxS8qnr7Q6WcNa4UewB7
	aDYQcbp+8hFemBhEahMvy/oFrkniVhhlex0DXCMUEDurJMJSmLSGmIkUGdZ7vHsawF43/pp49Jd
	Zn76rHM80h36M0v
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr3479410a91.13.1788976699225;
        Wed, 09 Sep 2026 10:58:19 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm42360855c88.11.2026.09.09.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:58:18 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: delete empty comment lines in core/ files
Date: Wed,  9 Sep 2026 10:58:14 -0700
Message-Id: <20260909175814.73718-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete all empty comment lines /*  */ in core/ source files, as they are
not serving any purpose.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        |  2 --
 drivers/staging/rtl8723bs/core/rtw_cmd.c       |  4 ----
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c |  2 --
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 12 +-----------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  |  3 ---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c   |  2 --
 drivers/staging/rtl8723bs/core/rtw_recv.c      |  5 -----
 7 files changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 9face4c8ded2..c0ad656361d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -598,9 +598,7 @@ static void update_hw_ht_param(struct adapter *padapter)
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_AMPDU_FACTOR, (u8 *)(&max_AMPDU_len));
 
-	/*  */
 	/*  Config SM Power Save setting */
-	/*  */
 	pmlmeinfo->SM_PS =
 		(le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
 		 0x0C) >> 2;
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 59f13f6b85ad..df37ecaa531d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1147,9 +1147,7 @@ bool traffic_status_watchdog(struct adapter *padapter, bool from_timer)
 
 	collect_traffic_statistics(padapter);
 
-	/*  */
 	/*  Determine if our traffic is busy now */
-	/*  */
 	if ((check_fwstate(pmlmepriv, _FW_LINKED))
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise busy_traffic in last watchdog, using lower threshold. */
@@ -1258,9 +1256,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 
 	/* check_hw_pbc(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type); */
 
-	/*  */
 	/*  BT-Coexist */
-	/*  */
 	hal_btcoex_Handler(padapter);
 
 	/* always call rtw_ps_processor() at last one. */
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4d211711f2ba..46e6f4250cb1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -31,9 +31,7 @@ u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
 u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
 u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
 u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
-/*  */
 /*  for adhoc-master to generate ie and provide supported-rate to fw */
-/*  */
 
 static u8 WIFI_CCKRATES[] = {
 		(IEEE80211_CCK_RATE_1MB | IEEE80211_BASIC_RATE_MASK),
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e22e33c364bb..d644e5c5628c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1094,7 +1094,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/* 802.1x */
 		/*  Added by Albert 2009/02/18 */
 		/*  We have to backup the PMK information for WiFi PMK Caching test item. */
-		/*  */
 		/*  Backup the btkip_countermeasure information. */
 		/*  When the countermeasure is trigger, the driver have to disconnect with AP for 60 seconds. */
 
@@ -1121,7 +1120,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 	} else {
 		/* reset values in securitypriv */
 		/* if (adapter->mlmepriv.fw_state & WIFI_STATION_STATE) */
-		/*  */
 		struct security_priv *psec_priv = &adapter->securitypriv;
 
 		psec_priv->dot11_auth_algrthm = dot11_auth_algrthm_open;  /* open system */
@@ -1133,7 +1131,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 
 		psec_priv->ndisauthtype = Ndis802_11AuthModeOpen;
 		psec_priv->ndisencryptstatus = Ndis802_11WEPDisabled;
-		/*  */
 	}
 	spin_unlock_bh(&adapter->security_key_mutex);
 }
@@ -1144,7 +1141,6 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* if join_res > 0, for (fw_state ==WIFI_STATION_STATE), we check if  "ptarget_sta" & "ptarget_wlan" exist. */
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
 /* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
-/*  */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 {
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
@@ -1530,7 +1526,7 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 
 	} else {
 		rtw_indicate_disconnect(adapter);
-		free_scanqueue(mlme_priv);/*  */
+		free_scanqueue(mlme_priv);
 
 		/* indicate disconnect for the case that join_timeout and check_fwstate != FW_LINKED */
 		rtw_cfg80211_indicate_disconnect(adapter);
@@ -2008,13 +2004,11 @@ static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 	return -1;
 }
 
-/*  */
 /*  Check the RSN IE length */
 /*  If the RSN IE length <= 20, the RSN IE didn't include the PMKID information */
 /*  0-11th element in the array are the fixed IE */
 /*  12th element in the array is the IE */
 /*  13th element in the array is the IE length */
-/*  */
 
 static int rtw_append_pmkid(struct adapter *Adapter, int pmkid_idx, u8 *ie, uint ie_len)
 {
@@ -2447,16 +2441,12 @@ void rtw_update_ht_cap(struct adapter *adapter, u8 *pie, uint ie_len, u8 channel
 		}
 	}
 
-	/*  */
 	/*  Config SM Power Save setting */
-	/*  */
 	pmlmeinfo->SM_PS =
 		(le16_to_cpu(pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info) &
 		 0x0C) >> 2;
 
-	/*  */
 	/*  Config current HT Protection mode. */
-	/*  */
 	pmlmeinfo->HT_protection = pmlmeinfo->HT_info.infos[1] & 0x3;
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c39fb142302e..63320777b1e3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2803,7 +2803,6 @@ void issue_assocreq(struct adapter *padapter)
 		sta_bssrate_len = 4;
 
 	/* for (i = 0; i < sta_bssrate_len; i++) { */
-	/*  */
 
 	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
 		if (pmlmeinfo->network.supported_rates[i] == 0)
@@ -3529,7 +3528,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	pframe = rtw_set_fixed_ie(pframe, 1, &(category), &(pattrib->pktlen));
 	pframe = rtw_set_fixed_ie(pframe, 1, &(action), &(pattrib->pktlen));
 
-	/*  */
 	if (pmlmepriv->num_FortyMHzIntolerant > 0) {
 		u8 iedata = 0;
 
@@ -3538,7 +3536,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040,  1, &iedata, &(pattrib->pktlen));
 	}
 
-	/*  */
 	memset(ICS, 0, sizeof(ICS));
 	if (pmlmepriv->num_sta_no_ht > 0) {
 		int i;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..d0404bed230b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -501,10 +501,8 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 	}
 }
 
-/*  */
 /*  Description: Leave all power save mode: LPS, FwLPS, IPS if needed. */
 /*  Move code to function by tynli. 2010.03.26. */
-/*  */
 void LeaveAllPowerSaveMode(struct adapter *Adapter)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(Adapter);
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fdc6c..b699c87e68d5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -831,7 +831,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
 		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
 
-		/*  */
 		memcpy(pattrib->bssid,  mybssid, ETH_ALEN);
 
 		*psta = rtw_get_stainfo(pstapriv, pattrib->bssid); /*  get sta_info */
@@ -1746,11 +1745,9 @@ static int check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_n
 	if (SN_LESS(seq_num, preorder_ctrl->indicate_seq))
 		return false;
 
-	/*  */
 	/*  Sliding window manipulation. Conditions includes: */
 	/*  1. Incoming SeqNum is equal to WinStart =>Window shift 1 */
 	/*  2. Incoming SeqNum is larger than the WinEnd => Window shift N */
-	/*  */
 	if (SN_EQUAL(seq_num, preorder_ctrl->indicate_seq)) {
 		preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
 
@@ -1980,11 +1977,9 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 	/*  Indication process. */
 	/*  After Packet dropping and Sliding Window shifting as above, we can now just indicate the packets */
 	/*  with the SeqNum smaller than latest WinStart and buffer other packets. */
-	/*  */
 	/*  For Rx Reorder condition: */
 	/*  1. All packets with SeqNum smaller than WinStart => Indicate */
 	/*  2. All packets with SeqNum larger than or equal to WinStart => Buffer it. */
-	/*  */
 
 	/* recv_indicatepkts_in_order(padapter, preorder_ctrl, true); */
 	if (recv_indicatepkts_in_order(padapter, preorder_ctrl, false)) {
-- 
2.34.1

