Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCAC443A84
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 19:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809734; cv=none; b=seUGDuH5hZXllbVyEhjChHsV2W7iLG7w+XvgJkCYm9AMUMVgY6tQzfoYiqHRML/krOhewu9A20yMEOWpicGqd7tVsgK9Mlg6C6fHUpJlJnD5LY9gV8X+MpHsHhGUhqgelQAd4pz8cLOQyBiXMXAY9/uByW7z0e5WFEv32u79/UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809734; c=relaxed/simple;
	bh=3ZM9lIyrtaQGM0ODDjuRobADx7AVEM62g6Xzsy2h0NY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HHFA8PHoPvLxHwcOvL7dZUpbGtMEQe1oK5UyQKyiSiRdZ6ekh8X60DNw9I2RGPbsmiqI7sZK9CeNAH97knwvNQzdF0NZzzm0HIfoYPpJVOnGh8D8Cn01j/u6nnAassL5PWw0+wZRny4noOr5R/vU076pXnIoWoSJOwXBRRNQvhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvhEnmZF; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvhEnmZF"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4546908a12.3
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 12:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809731; x=1789414531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MP+vsKEex/aQk5jpDvOuLFWxHlKHoQiANV5ptrVO5k=;
        b=UvhEnmZFj9q9RHnNDEnj35BtQ8bjSRqNlPZcyaP1aEzOE5rIQNYCHMhZTYIwJPN4Hp
         a8P5sb8LWI8FpiaIVUGdeZ1Ix9cL9aMeMHZbz173+yAOFjC+HIc8s8dvwWm7V1kM21fz
         tEks3hvAoCrW8NDGEUpkjm11BTTp2k4IhYO50HtT39DDu92Wz39uFT3h6PLWAZWWL3Vl
         5AMboOSfbXxNsUOxJbWVomSWnKyIeCfv4kcgRcbmmQENpCxYNqtcn2gDH+MPSaidUMYu
         G38RpfjlchM58ckn1flgJ5M5byRXDe8m3qK7mfD0apWinLH9AakOgCiypRG14+2SP7fO
         4VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809731; x=1789414531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MP+vsKEex/aQk5jpDvOuLFWxHlKHoQiANV5ptrVO5k=;
        b=s6Nj36+ekckkgmeDtfF+rpvk8KqKozS7VvUBQWXtc65uaZo2i9doL0+UaT7TWR1DZ3
         D8Sy0ycD7SZi/ppbQrPSveBuI+KKkq+hZjb8Yldg4OPszjroFBwfGOXQPX8A2NNjsbGQ
         vOe/e2V9gH92+n60RxYp5gyEywDavqnbMNqONGPGrVX0K0ovGTJAgtr2W6tyeOEglvtl
         oebxuSbJVZ4BiL/mQgnbBLfA1BJhGpkwXqNRK4+dzXJoXn91YlFOvFLOY2U6Z70fxvCd
         38ngFKwRpqWXxPp+02VWRFFuQp7lAlVmAL3ZJ+MY8zTcCdi+bt1MYgEoSTO9ERWNyT3r
         Pc9A==
X-Gm-Message-State: AFuF++kTbq+LU1BFZPDgwk8cxUAYSKytYrPe31KcvBwUzThm3MyAXKRe
	yyRXyK2e8YIzVkjlTMgBt/4LtLwrP+UuxU5oO52o4OA3IvHpxwOWcGKFv1md3A==
X-Gm-Gg: AYBFou32EZ4Zkum47LgA880l8ekyNBxZAvyk3iGY3dsL4jy6M0YdpUvJ4APdhoDaT04
	XvLZx0xwsKI7isP+e4h9LNou0XiQB7kEffOsfQ3Fw9QHrssQO7AiicyTcJ0AFJB9+CuECDX65o5
	xRhtfMxIDylqccVESE6Ts42jwl4rnKBiLM8lsQzLB6OaFEDW959gB6o1QWbySk64bc0FRUXn2h7
	4LB3UG1N8w/JyLBMIcdwI+RVXu6Jch2KZK4RDpMYEOqlkCIvD4U2H8n79SrgkkdnfePdUL1Zj0F
	fVd4m/b6iyslRPJWQH1BR6hGMrjyqu/I6wOFwIInC/azyJIQv8gkY7daVlnF8mDpnQ+N2s24HeU
	GiuWr2YHXFd/K0O6TnC85C2G1Q5yEv+fFZavtscTBVDi3xGnu5+r8/LXj5nrPkHT95hxfY7XSHA
	+/O8OKx6nW1pzCc9pyEoNXUF1u9Ku6zfNEgQsTbt4zKnVPwstqzs8pbdvn5e19f5DPqt/S0zU=
X-Received: by 2002:a17:90b:3943:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39b26273e31mr40169048a91.23.1788809730823;
        Mon, 07 Sep 2026 12:35:30 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-14344a86512sm5944409c88.10.2026.09.07.12.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 12:35:30 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove commented out code in core/ files.
Date: Mon,  7 Sep 2026 12:34:58 -0700
Message-Id: <20260907193458.70319-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out code in a bunch of files in core/
Remove adjacent comment where applicable.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 19 -----------
 drivers/staging/rtl8723bs/core/rtw_efuse.c    |  3 --
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  8 -----
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  3 --
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  1 -
 drivers/staging/rtl8723bs/core/rtw_security.c |  8 -----
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 32 -------------------
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 17 ----------
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  4 ---
 9 files changed, 95 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 59f13f6b85ad..267901cc5bf8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -252,12 +252,10 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	if (!obj)
 		return 0;
 
-	/* spin_lock_bh(&queue->lock); */
 	spin_lock_irqsave(&queue->lock, irqL);
 
 	list_add_tail(&obj->list, &queue->queue);
 
-	/* spin_unlock_bh(&queue->lock); */
 	spin_unlock_irqrestore(&queue->lock, irqL);
 
 	return 0;
@@ -268,7 +266,6 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 	unsigned long irqL;
 	struct cmd_obj *obj;
 
-	/* spin_lock_bh(&(queue->lock)); */
 	spin_lock_irqsave(&queue->lock, irqL);
 	if (list_empty(&queue->queue)) {
 		obj = NULL;
@@ -277,7 +274,6 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 		list_del_init(&obj->list);
 	}
 
-	/* spin_unlock_bh(&(queue->lock)); */
 	spin_unlock_irqrestore(&queue->lock, irqL);
 
 	return obj;
@@ -546,7 +542,6 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, survey_para, SITE_SURVEY_CMD);
 
-	/* psurveyPara->bsslimit = 48; */
 	survey_para->scan_mode = pmlmepriv->scan_mode;
 
 	/* prepare ssid list */
@@ -588,7 +583,6 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
-	/* rtw_free_cmd_obj(pcmd); */
 	kfree(pcmd->parmbuf);
 	kfree(pcmd);
 }
@@ -1000,7 +994,6 @@ u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, paddbareq_parm, ADD_BA_REQ_CMD);
 
-	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
 exit:
@@ -1034,7 +1027,6 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA_CMD);
 
-	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
 	return res;
@@ -1067,7 +1059,6 @@ u8 rtw_free_assoc_resources_cmd(struct adapter *padapter)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA_CMD);
 
-	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
 	return res;
@@ -1100,7 +1091,6 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->pbuf = NULL;
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, SET_DRV_EXTRA_CMD);
 
-	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
 	return res;
@@ -1249,18 +1239,13 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 
 	/* for debug purpose */
 	_linked_info_dump(padapter);
-	/* if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING|_FW_UNDER_SURVEY) ==false) */
 	{
 		linked_status_chk(padapter);
 		traffic_status_watchdog(padapter, false);
 	}
 	rtw_hal_dm_watchdog(padapter);
 
-	/* check_hw_pbc(padapter, pdrvextra_cmd->pbuf, pdrvextra_cmd->type); */
-
-	/*  */
 	/*  BT-Coexist */
-	/*  */
 	hal_btcoex_Handler(padapter);
 
 	/* always call rtw_ps_processor() at last one. */
@@ -1325,7 +1310,6 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	struct cmd_obj	*ph2c;
 	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
 	u8 res = _SUCCESS;
 
 	if (enqueue) {
@@ -1877,9 +1861,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 		pnetwork->length = get_wlan_bssid_ex_sz(pnetwork);
 		memcpy(&pwlan->network, pnetwork, pnetwork->length);
-		/* pwlan->fixed = true; */
-
-		/* list_add_tail(&(pwlan->list), &pmlmepriv->scanned_queue.queue); */
 
 		/*  copy pdev_network information to	pmlmepriv->cur_network */
 		memcpy(&tgt_network->network, pnetwork, (get_wlan_bssid_ex_sz(pnetwork)));
diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index b2d22307b115..d5bf8f17b9ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -87,7 +87,6 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
 	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
-	/* PHY_SetMacReg(padapter, 0x34, BIT11, 0); */
 	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) & (~BIT(11)));
 
 	/*  -----------------e-fuse reg ctrl --------------------------------- */
@@ -173,6 +172,4 @@ void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuse_type)
 	else
 		efuse_read_all_map(padapter, efuse_type, eeprom->efuse_eeprom_data);
 
-	/* PlatformMoveMemory((void *)&pHalData->EfuseMap[EFUSE_MODIFY_MAP][0], */
-	/* void *)&pHalData->EfuseMap[EFUSE_INIT_MAP][0], map_len); */
 } /*  rtw_efuse_shadow_map_update */
diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 4d211711f2ba..f7348d135f81 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -330,7 +330,6 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	if (rate_len > 8) {
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_rates, &sz);
-		/* ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz); */
 	} else {
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates, &sz);
 	}
@@ -351,10 +350,6 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 		/* todo: */
 	}
 
-	/* pdev_network->ie_length =  sz; update ie_length */
-
-	/* return _SUCCESS; */
-
 	return sz;
 }
 
@@ -481,7 +476,6 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 
 	/* pairwise_cipher */
 	if (left >= 2) {
-		/* count = le16_to_cpu(*(u16*)pos); */
 		count = get_unaligned_le16(pos);
 		pos += 2;
 		left -= 2;
@@ -543,7 +537,6 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 
 	/* pairwise_cipher */
 	if (left >= 2) {
-	  /* count = le16_to_cpu(*(u16*)pos); */
 		count = get_unaligned_le16(pos);
 		pos += 2;
 		left -= 2;
@@ -1074,7 +1067,6 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 {
 	unsigned short cap = 0;
 	u8 bencrypt = 0;
-	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
 	struct HT_info_element *pht_info = NULL;
 	struct ieee80211_ht_cap *pht_cap = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 2739d0e99098..b82c1e3572c0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -322,7 +322,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 		case NL80211_IFTYPE_AP:
 			set_fwstate(pmlmepriv, WIFI_AP_STATE);
 			start_ap_mode(padapter);
-			/* rtw_indicate_connect(padapter); */
 
 			break;
 
@@ -330,8 +329,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 			break;
 		}
 
-		/* SecClearAllKeys(adapter); */
-
 		spin_unlock_bh(&pmlmepriv->lock);
 	}
 	return true;
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..9aeaad223f2f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -210,7 +210,6 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 	}
 
 	if (bLeaveLPS)
-		/* rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1); */
 		rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, tx ? 0 : 1);
 }
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3de102a27517..310555657302 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -108,11 +108,9 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 	/* start to decrypt recvframe */
 	if ((prxattrib->encrypt == _WEP40_) || (prxattrib->encrypt == _WEP104_)) {
 		iv = pframe + prxattrib->hdrlen;
-		/* keyindex =(iv[3]&0x3); */
 		keyindex = prxattrib->key_index;
 		keylength = psecuritypriv->dot11DefKeylen[keyindex];
 		memcpy(&wepkey[0], iv, 3);
-		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
@@ -922,9 +920,6 @@ static signed int aes_cipher(u8 *key, uint hdrlen,
 u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 {	/*  exclude ICV */
 
-	/*static*/
-	/* unsigned char message[MAX_MSG_SIZE]; */
-
 	/* Intermediate Buffers */
 	signed int curfragnum, length;
 	u8 *pframe, *prwskey;	/*  *payload,*iv */
@@ -1167,9 +1162,6 @@ static signed int aes_decipher(u8 *key, uint	hdrlen,
 u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 {	/*  exclude ICV */
 
-	/*static*/
-	/* unsigned char message[MAX_MSG_SIZE]; */
-
 	/* Intermediate Buffers */
 
 	signed int length;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 6d014bf8fa96..11351aa4f4d0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -14,9 +14,6 @@ void _rtw_init_stainfo(struct sta_info *psta)
 	spin_lock_init(&psta->lock);
 	INIT_LIST_HEAD(&psta->list);
 	INIT_LIST_HEAD(&psta->hash_list);
-	/* INIT_LIST_HEAD(&psta->asoc_list); */
-	/* INIT_LIST_HEAD(&psta->sleep_list); */
-	/* INIT_LIST_HEAD(&psta->wakeup_list); */
 
 	INIT_LIST_HEAD(&psta->sleep_q.queue);
 	spin_lock_init(&psta->sleep_q.lock);
@@ -171,7 +168,6 @@ u32 _rtw_free_sta_priv(struct	sta_priv *pstapriv)
 	return _SUCCESS;
 }
 
-/* struct	sta_info *rtw_alloc_stainfo(_queue *pfree_sta_queue, unsigned char *hwaddr) */
 struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 {
 	s32	index;
@@ -184,10 +180,8 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 	pfree_sta_queue = &pstapriv->free_sta_queue;
 
-	/* spin_lock_bh(&(pfree_sta_queue->lock)); */
 	spin_lock_bh(&pstapriv->sta_hash_lock);
 	if (list_empty(&pfree_sta_queue->queue)) {
-		/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
 		spin_unlock_bh(&pstapriv->sta_hash_lock);
 		return NULL;
 	}
@@ -195,8 +189,6 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 	list_del_init(&psta->list);
 
-	/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
-
 	_rtw_init_stainfo(psta);
 
 	psta->padapter = pstapriv->padapter;
@@ -212,14 +204,10 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 	}
 	phash_list = &pstapriv->sta_hash[index];
 
-	/* spin_lock_bh(&(pstapriv->sta_hash_lock)); */
-
 	list_add_tail(&psta->hash_list, phash_list);
 
 	pstapriv->asoc_sta_count++;
 
-	/* spin_unlock_bh(&(pstapriv->sta_hash_lock)); */
-
 	/*  Commented by Albert 2009/08/13 */
 	/*  For the SMC router, the sequence number of first packet of WPS handshake will be 0. */
 	/*  In this case, this packet will be dropped by recv_decache function if we use the 0x00 as the default value for tid_rxseq variable. */
@@ -240,7 +228,6 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 		preorder_ctrl->indicate_seq = 0xffff;
 		preorder_ctrl->wend_b = 0xffff;
-		/* preorder_ctrl->wsize_b = (NR_RECVBUFF-2); */
 		preorder_ctrl->wsize_b = 64;/* 64; */
 
 		INIT_LIST_HEAD(&preorder_ctrl->pending_recvframe_queue.queue);
@@ -287,50 +274,38 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 	pstaxmitpriv = &psta->sta_xmitpriv;
 
-	/* list_del_init(&psta->sleep_list); */
-
-	/* list_del_init(&psta->wakeup_list); */
-
 	spin_lock_bh(&pxmitpriv->lock);
 
 	rtw_free_xmitframe_queue(pxmitpriv, &psta->sleep_q);
 	psta->sleepq_len = 0;
 
 	/* vo */
-	/* spin_lock_bh(&(pxmitpriv->vo_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vo_q.sta_pending);
 	list_del_init(&pstaxmitpriv->vo_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits;
 	phwxmit->accnt -= pstaxmitpriv->vo_q.qcnt;
 	pstaxmitpriv->vo_q.qcnt = 0;
-	/* spin_unlock_bh(&(pxmitpriv->vo_pending.lock)); */
 
 	/* vi */
-	/* spin_lock_bh(&(pxmitpriv->vi_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->vi_q.sta_pending);
 	list_del_init(&pstaxmitpriv->vi_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 1;
 	phwxmit->accnt -= pstaxmitpriv->vi_q.qcnt;
 	pstaxmitpriv->vi_q.qcnt = 0;
-	/* spin_unlock_bh(&(pxmitpriv->vi_pending.lock)); */
 
 	/* be */
-	/* spin_lock_bh(&(pxmitpriv->be_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->be_q.sta_pending);
 	list_del_init(&pstaxmitpriv->be_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 2;
 	phwxmit->accnt -= pstaxmitpriv->be_q.qcnt;
 	pstaxmitpriv->be_q.qcnt = 0;
-	/* spin_unlock_bh(&(pxmitpriv->be_pending.lock)); */
 
 	/* bk */
-	/* spin_lock_bh(&(pxmitpriv->bk_pending.lock)); */
 	rtw_free_xmitframe_queue(pxmitpriv, &pstaxmitpriv->bk_q.sta_pending);
 	list_del_init(&pstaxmitpriv->bk_q.tx_pending);
 	phwxmit = pxmitpriv->hwxmits + 3;
 	phwxmit->accnt -= pstaxmitpriv->bk_q.qcnt;
 	pstaxmitpriv->bk_q.qcnt = 0;
-	/* spin_unlock_bh(&(pxmitpriv->bk_pending.lock)); */
 
 	spin_unlock_bh(&pxmitpriv->lock);
 
@@ -339,10 +314,6 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 	pstapriv->asoc_sta_count--;
 	spin_unlock_bh(&pstapriv->sta_hash_lock);
 
-	/*  re-init sta_info; 20061114 will be init in alloc_stainfo */
-	/* _rtw_init_sta_xmit_priv(&psta->sta_xmitpriv); */
-	/* _rtw_init_sta_recv_priv(&psta->sta_recvpriv); */
-
 	timer_delete_sync(&psta->addba_retry_timer);
 
 	/* for A-MPDU Rx reordering buffer control, cancel reordering_ctrl_timer */
@@ -410,9 +381,7 @@ u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta)
 
 	psta->under_exist_checking = 0;
 
-	/* spin_lock_bh(&(pfree_sta_queue->lock)); */
 	list_add_tail(&psta->list, get_list_head(pfree_sta_queue));
-	/* spin_unlock_bh(&(pfree_sta_queue->lock)); */
 
 exit:
 	return _SUCCESS;
@@ -493,7 +462,6 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
-	/* struct __queue	*pstapending = &padapter->xmitpriv.bm_pending; */
 
 	psta = rtw_alloc_stainfo(pstapriv, bcast_addr);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6d49dff616c2..9feab9ab7545 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -655,7 +655,6 @@ void flush_all_cam_entry(struct adapter *padapter)
 
 int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 {
-	/* struct registry_priv *pregpriv = &padapter->registrypriv; */
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -774,7 +773,6 @@ void WMMOnAssocRsp(struct adapter *padapter)
 
 			case 0x1:
 				rtw_hal_set_hwreg(padapter, HW_VAR_AC_PARAM_BK, (u8 *)(&acParm));
-				/* acm_mask |= (ACM? BIT(0):0); */
 				edca[XMIT_BK_QUEUE] = acParm;
 				break;
 
@@ -872,8 +870,6 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 		struct wlan_bssid_ex	*cur_network = &pmlmeinfo->network;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
-
 		/* update ap's stainfo */
 		psta = rtw_get_stainfo(pstapriv, cur_network->mac_address);
 		if (psta) {
@@ -984,7 +980,6 @@ void HTOnAssocRsp(struct adapter *padapter)
 {
 	unsigned char max_AMPDU_len;
 	unsigned char min_MPDU_spacing;
-	/* struct registry_priv  *pregpriv = &padapter->registrypriv; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
@@ -992,7 +987,6 @@ void HTOnAssocRsp(struct adapter *padapter)
 		pmlmeinfo->HT_enable = 1;
 	} else {
 		pmlmeinfo->HT_enable = 0;
-		/* set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode); */
 		return;
 	}
 
@@ -1082,7 +1076,6 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	unsigned char *p;
 	unsigned short	val16, subtype;
 	struct wlan_network *cur_network = &Adapter->mlmepriv.cur_network;
-	/* u8 wpa_ie[255], rsn_ie[255]; */
 	u16 wpa_len = 0, rsn_len = 0;
 	u8 encryp_protocol = 0;
 	struct wlan_bssid_ex *bssid;
@@ -1154,7 +1147,6 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 			cur_network->bcn_info.ht_info_infos_0 = ht_info_infos_0;
 			/* to do : need to check that whether modify related register of BB or not */
 		}
-		/* goto _mismatch; */
 	}
 
 	/* Checking for channel */
@@ -1281,7 +1273,6 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 			break;
 
 		case WLAN_EID_HT_OPERATION:	/* HT info */
-			/* HT_info_handler(padapter, pIE); */
 			bwmode_update_check(padapter, pIE);
 			break;
 
@@ -1392,10 +1383,7 @@ static u32 get_realtek_assoc_AP_vender(struct ndis_80211_var_ie *pIE)
 
 	if (pIE->length >= 5) {
 		if (pIE->data[4] == 1)
-			/* if (pIE->data[5] & RT_HT_CAP_USE_LONG_PREAMBLE) */
-			/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_LONG_PREAMBLE; */
 			if (pIE->data[5] & RT_HT_CAP_USE_92SE)
-				/* bssDesc->BssHT.RT2RT_HT_Mode |= RT_HT_CAP_USE_92SE; */
 				Vender = HT_IOT_PEER_REALTEK_92SE;
 
 		if (pIE->data[5] & RT_HT_CAP_USE_SOFTAP)
@@ -1468,8 +1456,6 @@ void update_IOT_info(struct adapter *padapter)
 		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
 	case HT_IOT_PEER_REALTEK:
-		/* rtw_write16(padapter, 0x4cc, 0xffff); */
-		/* rtw_write16(padapter, 0x546, 0x01c0); */
 		/* disable high power */
 		switch_dm_func(padapter, ((u32)(~DYNAMIC_BB_DYNAMIC_TXPWR)), false);
 		break;
@@ -1666,16 +1652,13 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 	tsf |= le32_to_cpu(*pbuf);
 
 	/* delay = (timestamp mod 1024*100)/1000 (unit: ms) */
-	/* delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval*1024))/1000; */
 	delay_ms = do_div(tsf, (pmlmeinfo->bcn_interval * 1024));
 	delay_ms = delay_ms / 1000;
 
 	if (delay_ms >= 8)
 		pmlmeext->bcn_delay_cnt[8]++;
-		/* pmlmeext->bcn_delay_ratio[8] = (pmlmeext->bcn_delay_cnt[8] * 100) /pmlmeext->bcn_cnt; */
 	else
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
-		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && pmlmeext->adaptive_tsf_done) {
 		u8 ratio_20_delay, ratio_80_delay;
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94f..c0cb9973662f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -392,7 +392,6 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 {
 	u32 sz;
 	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
-	/* struct sta_info *psta = pattrib->psta; */
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
@@ -921,8 +920,6 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	if (pattrib->subtype & WIFI_DATA_TYPE) {
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-			/* to_ds = 1, fr_ds = 0; */
-
 			{
 				/*  1.Data transfer to AP */
 				/*  2.Arp pkt will relayed by AP */
@@ -935,7 +932,6 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (pqospriv->qos_option)
 				qos_option = true;
 		} else if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
-			/* to_ds = 0, fr_ds = 1; */
 			SetFrDs(fctrl);
 			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
 			memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
-- 
2.34.1

