Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C4F3CB56A
	for <linux-staging@lists.linux.dev>; Mon,  7 Sep 2026 17:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788803032; cv=none; b=QZndDNj5rsCmTSMc6KFKUTzxB50t4xg7ul/Q1gM+l9dG6YAnXLTAiVgjIYenH8gJNBivvF+iPK639t6r0HCmdkVr1PcFDuBwZTUH4FIWkBIbDN0xj2nLJoXb3r2hCvCsXngyzwhs1RsZvruDZGOZCftEbOKW/ApcOp6LFMIs/k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788803032; c=relaxed/simple;
	bh=MbQ2TWL7JWIP8Dm2K4wWTjokfNLkmwvGkK+HT9miQ9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uqeUsAcNkxS8KFsI3tdkowQ1b/3AP+VcMRX7vjtbXiuKf7l1LUfgyo/lwhGu3TN8xYqOTTUsVmkBkiRWw8DO5d6eMWAFEI49w86wnQP1iaEvq62wQN1PeNZ4hzBs8nZX/v5/taPmeWwfm9Vip0M0eDQmXGTSNt7Hkfuc9gsy2+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnTQSpV8; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnTQSpV8"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso4015246a91.2
        for <linux-staging@lists.linux.dev>; Mon, 07 Sep 2026 10:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788803030; x=1789407830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Svz8xdSGqHAB6YuP1bCQpkMrzznTaROxcPYUZcdudFc=;
        b=bnTQSpV830n1wCfmwGHvyzn/DM2mcQKfoayjr69JKGxUWj0kww7gky+ho7knae0WNG
         bbNjBA8T+y7y2bshuzZwwt7GBsbGf3Yl/5Zud4fOeX13XZHLFOpPP4LbUWDbSf6t90kU
         UxDAYMd+zN2Y/gBRE+JewJ/qWW5GHcm8Fa6p+URw4mwl/i/83ok9aE9II+SS88UD+8Qf
         5w1i6+5JsYgE+lE9fuUGP10r9ZQoW5rXtWPisFD5BRlO0s5Giud8qXHZ1dqFnAadVIy7
         l24XDCFmvqH4QpBC85pXlKDIk0KFEF2rgDtjINLHv9LmqoQT+1kxM4E6Uwpi22AELVm5
         KsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788803030; x=1789407830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Svz8xdSGqHAB6YuP1bCQpkMrzznTaROxcPYUZcdudFc=;
        b=N6isGrHwpzUfuOimd7fvPTuiA2VWCL+uLOdfICbT68hVhAjBpFo0SlaohLX02tC9B0
         TARSwzFe/dSlA1UW/aftv5oXX9q+zBiUUeRuvFC1xvUf7c+1aEswXmat93EnFBVAatYC
         OX77JVJ4nhi25NU3jogX5y1ES+yLLCVI4rTVsqdwjZ4vIHNvh0NkJU+Ia7N/vNsMy2yd
         6sm/wC6PHBX1IxqqEBsFFFUqmFgGnzT5TNgLoxaGT58Q8ExKd0p2JUwzhwOxC5sH0LzR
         RxvocBhHL6JW0aUpUPQTsPm1Ns12EPd4zGibiKWcKCeDW03fK5Q1Dv7/YKHpPn5EVoF3
         iv6A==
X-Gm-Message-State: AFuF++mOR1RNUfKZkGwxlTLfxp/iKyu2zwJxUcCYJkdA5Qo4FzIXZ7K2
	BPUUfMarAvetlBU4GGk6fNkqH53hkYxKBVnJXvJfDbEw7F2DUI397GrSawpMSg==
X-Gm-Gg: AYBFou256KNrnrhbnH+7k/f8I3vV5dhUTCF6IDOg+l3S/vkz2uyadUmX29LZQHVoCXb
	89FFEv7AxClxV7t5Vgi3U62msx4QDdVs7zlaJuYMrBlHEK3HlCdcB0QSBSSzYEAEXbt2GYHUYbl
	48AthgEJDGdTjWsSMQQ7D2rj/yHknW+8bLsFW7c4aW316CWEuhrlzBgSitT0lbN2H6WOCFvLFnF
	LtTEDELXgvThW8kJtHTu/TAEYmsyaFapPkdOQs0IbQZdXlYAtspWWaSV359kzBCWTOkqKXY0WJx
	1r58209xTqXBwP5JRPrSYL0nJFt6hkPH7CUMU5NSL2rLytvbTNb41E58U6tpGHxgcVNVgx0wWYL
	BemULEoxCJah8zmstbhKo+rDeSyZGmBj67UifSJXzgHd+H+HXSOlMHf9P0qAAGeWQYWOHy6GEFe
	eWP0hSJA9EZjR5+2pVnwLxj7KBTwdR1cjcRCezJclXY64qUK0yaJW4h9lMlM4DlYglaYIrKMk=
X-Received: by 2002:a17:90b:538b:b0:392:e5b1:d833 with SMTP id 98e67ed59e1d1-39b261d5148mr35438623a91.13.1788803029820;
        Mon, 07 Sep 2026 10:43:49 -0700 (PDT)
Received: from TestUbuntu22.. ([67.169.161.65])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1433171a97esm27431320c88.12.2026.09.07.10.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:43:49 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guojy.bj@gmail.com
Subject: [PATCH 2/2] staging: rtl8723bs: remove commented-out code in include/ files
Date: Mon,  7 Sep 2026 10:43:10 -0700
Message-Id: <20260907174310.5924-3-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260907174310.5924-1-guojy.bj@gmail.com>
References: <20260907174310.5924-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all commented-out code in the include/ header files.

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h  |  6 -----
 drivers/staging/rtl8723bs/include/ieee80211.h | 10 -------
 .../staging/rtl8723bs/include/rtl8723b_cmd.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_ap.h    |  1 -
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  1 -
 drivers/staging/rtl8723bs/include/rtw_ht.h    |  2 --
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 11 --------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  6 -----
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   |  1 -
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 14 ----------
 .../staging/rtl8723bs/include/rtw_security.h  |  1 -
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 26 -------------------
 drivers/staging/rtl8723bs/include/sdio_ops.h  |  2 --
 drivers/staging/rtl8723bs/include/sta_info.h  |  1 -
 15 files changed, 84 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 20265770ed77..bd8a03b04e4c 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -277,7 +277,6 @@ struct adapter {
 	struct	mlme_ext_priv mlmeextpriv;
 	struct	cmd_priv cmdpriv;
 	struct	evt_priv evtpriv;
-	/* struct	io_queue	*pio_queue; */
 	struct	io_priv iopriv;
 	struct	xmit_priv xmitpriv;
 	struct	recv_priv recvpriv;
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 57a18da67fc9..14893c6d7861 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -58,7 +58,6 @@ struct dm_priv {
 
 	u8 DMFlag;
 	u8 InitDMFlag;
-	/* u8   RSVD_1; */
 
 	u32 InitODMFlag;
 	/*  Upper and Lower Signal threshold for Rate Adaptive */
@@ -90,7 +89,6 @@ struct dm_priv {
 	u8 ThermalValue_IQK;
 	u8 ThermalValue_DPK;
 	u8 bRfPiEnable;
-	/* u8   RSVD_2; */
 
 	/* for APK */
 	u32 APKoutput[2][2];	/* path A/B; output1_1a/output1_2a */
@@ -99,9 +97,6 @@ struct dm_priv {
 	u8 bDPdone;
 	u8 bDPPathAOK;
 	u8 bDPPathBOK;
-	/* u8   RSVD_3; */
-	/* u8   RSVD_4; */
-	/* u8   RSVD_5; */
 
 	/* for IQK */
 	u32 ADDA_backup[IQK_ADDA_REG_NUM];
@@ -120,7 +115,6 @@ struct dm_priv {
 	u8 OFDM_index_HP[2];
 	u8 ThermalValue_HP[HP_THERMAL_NUM];
 	u8 ThermalValue_HP_index;
-	/* u8   RSVD_6; */
 
 	/* for TxPwrTracking2 */
 	s32	RegE94;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9f421e4875b7..9767013887af 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -22,7 +22,6 @@ enum {
 	RTL871X_HOSTAPD_ADD_STA = 2,
 	RTL871X_HOSTAPD_REMOVE_STA = 3,
 	RTL871X_HOSTAPD_GET_INFO_STA = 4,
-	/* REMOVED: PRISM2_HOSTAPD_RESET_TXEXC_STA = 5, */
 	RTL871X_HOSTAPD_GET_WPAIE_STA = 5,
 	RTL871X_SET_ENCRYPTION = 6,
 	RTL871X_GET_ENCRYPTION = 7,
@@ -610,17 +609,8 @@ enum rtw_ieee80211_channel_flags {
 
 /* Represent channel details, subset of ieee80211_channel */
 struct rtw_ieee80211_channel {
-	/* enum nl80211_band band; */
-	/* u16 center_freq; */
 	u16 hw_value;
 	u32 flags;
-	/* int max_antenna_gain; */
-	/* int max_power; */
-	/* int max_reg_power; */
-	/* bool beacon_found; */
-	/* u32 orig_flags; */
-	/* int orig_mag; */
-	/* int orig_mpwr; */
 };
 
 /* Parsed Information Elements */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
index 6b2d79e19088..d59c538748f2 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_cmd.h
@@ -168,7 +168,6 @@ void rtl8723b_set_FwJoinBssRpt_cmd(struct adapter *padapter, u8 mstatus);
 void rtl8723b_set_rssi_cmd(struct adapter *padapter, u8 *param);
 void rtl8723b_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level);
 void rtl8723b_fw_try_ap_cmd(struct adapter *padapter, u32 need_ack);
-/* s32 rtl8723b_set_lowpwr_lps_cmd(struct adapter *padapter, u8 enable); */
 void rtl8723b_set_FwPsTuneParam_cmd(struct adapter *padapter);
 void rtl8723b_set_FwMacIdConfig_cmd(struct adapter *padapter, u8 mac_id, u8 raid, u8 bw, u8 sgi, u32 mask);
 void rtl8723b_set_FwMediaStatusRpt_cmd(struct adapter *padapter, u8 mstatus, u8 macid);
diff --git a/drivers/staging/rtl8723bs/include/rtw_ap.h b/drivers/staging/rtl8723bs/include/rtw_ap.h
index 866aa8386931..07f092fd54d9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ap.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ap.h
@@ -9,7 +9,6 @@
 
 void init_mlme_ap_info(struct adapter *padapter);
 void free_mlme_ap_info(struct adapter *padapter);
-/* void update_BCNTIM(struct adapter *padapter); */
 void update_beacon(struct adapter *padapter, u8 ie_id, u8 tx);
 void add_ratid(struct adapter *padapter, struct sta_info *psta, u8 rssi_level);
 void expire_timeout_chk(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 58a5ec39ce76..3b4cb95225f8 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -49,7 +49,6 @@
 		u32 cmd_done_cnt;
 		u32 rsp_cnt;
 		atomic_t cmdthd_running;
-		/* u8 cmdthd_running; */
 		u8 stop_req;
 		struct adapter *padapter;
 		struct mutex sctx_mutex;
diff --git a/drivers/staging/rtl8723bs/include/rtw_ht.h b/drivers/staging/rtl8723bs/include/rtw_ht.h
index da3efba7112a..e1c35fb450d0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ht.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ht.h
@@ -14,7 +14,6 @@ struct ht_priv {
 	u8 tx_amsdu_enable;/* for enable Tx A-MSDU */
 	u8 bss_coexist;/* for 20/40 Bss coexist */
 
-	/* u8 baddbareq_issued[16]; */
 	u32 tx_amsdu_maxlen; /*  1: 8k, 0:4k ; default:8k, for tx */
 	u32 rx_ampdu_maxlen; /* for rx reordering ctrl win_sz, updated when join_callback. */
 
@@ -26,7 +25,6 @@ struct ht_priv {
 
 	/* for processing Tx A-MPDU */
 	u8 agg_enable_bitmap;
-	/* u8 ADDBA_retry_count; */
 	u8 candidate_tid_bitmap;
 
 	u8 ldpc_cap;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 7709d5fd77a3..4962eedc7410 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -164,10 +164,6 @@ struct mlme_priv {
 	/* Number of non-HT AP/stations */
 	int num_sta_no_ht;
 
-	/* Number of HT AP/stations 20 MHz */
-	/* int num_sta_ht_20mhz; */
-
-
 	int num_FortyMHzIntolerant;
 
 	struct ht_priv htpriv;
@@ -198,9 +194,6 @@ struct mlme_priv {
 	/* Number of HT associated stations that do not support greenfield */
 	int num_sta_ht_no_gf;
 
-	/* Number of associated non-HT stations */
-	/* int num_sta_no_ht; */
-
 	/* Number of HT associated stations 20 MHz */
 	int num_sta_ht_20mhz;
 
@@ -215,12 +208,10 @@ struct mlme_priv {
 	u32 assoc_rsp_len;
 
 	u8 *wps_beacon_ie;
-	/* u8 *wps_probe_req_ie; */
 	u8 *wps_probe_resp_ie;
 	u8 *wps_assoc_resp_ie; /* this IE could include p2p ie / wfd ie */
 
 	u32 wps_beacon_ie_len;
-	/* u32 wps_probe_req_ie_len; */
 	u32 wps_probe_resp_ie_len;
 	u32 wps_assoc_resp_ie_len; /* this IE len could include p2p ie / wfd ie */
 
@@ -350,8 +341,6 @@ void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
 void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
 
-/* extern struct wlan_network* _rtw_dequeue_network(struct __queue *queue); */
-
 struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 70fb161afd09..98c55f6ad516 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -369,7 +369,6 @@ struct mlme_ext_priv {
 	u16 sa_query_seq;
 	u64 mgnt_80211w_IPN;
 	u64 mgnt_80211w_IPN_rx;
-	/* struct fw_priv fwpriv; */
 
 	unsigned char cur_channel;
 	unsigned char cur_bwmode;
@@ -389,7 +388,6 @@ struct mlme_ext_priv {
 	struct timer_list		survey_timer;
 	struct timer_list		link_timer;
 	struct timer_list		sa_query_timer;
-	/* struct timer_list		ADDBA_timer; */
 	u16 		chan_scan_time;
 	unsigned long last_scan_time;
 	u8 scan_abort;
@@ -424,8 +422,6 @@ void init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
 struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
-/* void fill_fwpriv(struct adapter *padapter, struct fw_priv *pfwpriv); */
-
 u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta);
 
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrate_len);
@@ -589,8 +585,6 @@ void survey_timer_hdl(struct timer_list *t);
 void link_timer_hdl(struct timer_list *t);
 void addba_timer_hdl(struct timer_list *t);
 void sa_query_timer_hdl(struct timer_list *t);
-/* void reauth_timer_hdl(struct adapter *padapter); */
-/* void reassoc_timer_hdl(struct adapter *padapter); */
 
 #define set_survey_timer(mlmeext, ms) \
 	do { \
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..c308fcedd632 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -192,7 +192,6 @@ struct pwrctrl_priv {
 	int		ps_flag; /* used by autosuspend */
 
 	enum rt_rf_power_state	rf_pwrstate;/* cur power state, only for IPS */
-	/* rt_rf_power_state	current_rfpwrstate; */
 	enum rt_rf_power_state	change_rfpwrstate;
 
 	u8 bHWPowerdown; /* power down mode selection. 0:radio off, 1:power down */
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 5c197bd6915f..34a19673e913 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -206,15 +206,10 @@ struct recv_priv {
 	u8 signal_strength;
 	u8 signal_qual;
 	s8 rssi;	/* translate_percentage_to_dbm(ptarget_wlan->network.PhyInfo.SignalStrength); */
-	/* s8 rxpwdb; */
 	s16 noise;
-	/* int RxSNRdB[2]; */
-	/* s8 RxRssi[2]; */
-	/* int FalseAlmCnt_all; */
 
 	struct timer_list signal_stat_timer;
 	u32 signal_stat_sampling_interval;
-	/* u32 signal_stat_converging_constant; */
 	struct signal_stat signal_qual_data;
 	struct signal_stat signal_strength_data;
 };
@@ -226,15 +221,9 @@ struct sta_recv_priv {
 	spinlock_t lock;
 	signed int option;
 
-	/* struct __queue	blk_strms[MAX_RX_NUMBLKS]; */
 	struct __queue defrag_q;	 /* keeping the fragment frame until defrag */
 
 	struct stainfo_rxcache rxcache;
-
-	/* uint	sta_rx_bytes; */
-	/* uint	sta_rx_pkts; */
-	/* uint	sta_rx_fail; */
-
 };
 
 struct recv_buf {
@@ -310,9 +299,6 @@ union recv_frame {
 		struct recv_frame_hdr hdr;
 		uint mem[RECVFRAME_HDR_ALIGN>>2];
 	} u;
-
-	/* uint mem[MAX_RXSZ>>2]; */
-
 };
 
 enum {
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index a3bbc605e2ba..791528aa9b3e 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -129,7 +129,6 @@ struct security_priv {
 	u8 binstallGrpkey;
 	u8 binstallBIPkey;
 	u8 busetkipkey;
-	/* _timer tkip_timer; */
 	u8 bcheck_grpkey;
 	u8 bgrpkey_handshake;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 873807fcd0dd..866e9d5f4aa6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -106,11 +106,7 @@ union txdesc {
 };
 
 struct	hw_xmit	{
-	/* spinlock_t xmit_lock; */
-	/* struct list_head	pending; */
 	struct __queue *sta_queue;
-	/* struct hw_txqueue *phwtxqueue; */
-	/* signed int	txcmdcnt; */
 	int	accnt;
 };
 
@@ -166,7 +162,6 @@ struct pkt_attrib {
 	u8 rtsen;
 	u8 cts2self;
 	union Keytype	dot11tkiptxmickey;
-	/* union Keytype	dot11tkiprxmickey; */
 	union Keytype	dot118021x_UncstKey;
 
 	u8 icmp_pkt;
@@ -281,7 +276,6 @@ struct sta_xmit_priv {
 	signed int	apsd_setting;	/* When bit mask is on, the associated edca queue supports APSD. */
 
 
-	/* struct tx_servq blk_q[MAX_NUMBLKS]; */
 	struct tx_servq	be_q;			/* priority == 0, 3 */
 	struct tx_servq	bk_q;			/* priority == 1, 2 */
 	struct tx_servq	vi_q;			/* priority == 4, 5 */
@@ -290,12 +284,6 @@ struct sta_xmit_priv {
 	struct list_head  apsd;
 
 	u16 txseq_tid[16];
-
-	/* uint	sta_tx_bytes; */
-	/* u64	sta_tx_pkts; */
-	/* uint	sta_tx_fail; */
-
-
 };
 
 
@@ -323,35 +311,22 @@ struct	xmit_priv {
 	struct completion xmit_comp;
 	struct completion terminate_xmitthread_comp;
 
-	/* struct __queue	blk_strms[MAX_NUMBLKS]; */
 	struct __queue	be_pending;
 	struct __queue	bk_pending;
 	struct __queue	vi_pending;
 	struct __queue	vo_pending;
 	struct __queue	bm_pending;
 
-	/* struct __queue	legacy_dz_queue; */
-	/* struct __queue	apsd_queue; */
-
 	u8 *pallocated_frame_buf;
 	u8 *pxmit_frame_buf;
 	uint free_xmitframe_cnt;
 	struct __queue	free_xmit_queue;
 
-	/* uint mapping_addr; */
-	/* uint pkt_sz; */
-
 	u8 *xframe_ext_alloc_addr;
 	u8 *xframe_ext;
 	uint free_xframe_ext_cnt;
 	struct __queue free_xframe_ext_queue;
 
-	/* struct	hw_txqueue	be_txqueue; */
-	/* struct	hw_txqueue	bk_txqueue; */
-	/* struct	hw_txqueue	vi_txqueue; */
-	/* struct	hw_txqueue	vo_txqueue; */
-	/* struct	hw_txqueue	bmc_txqueue; */
-
 	uint	frag_len;
 
 	struct adapter	*adapter;
@@ -359,7 +334,6 @@ struct	xmit_priv {
 	u8   vcs_setting;
 	u8 vcs;
 	u8 vcs_type;
-	/* u16  rts_thresh; */
 
 	u64	tx_bytes;
 	u64	tx_pkts;
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index f939263495df..d9510aa598fc 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -11,8 +11,6 @@
 
 void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
 
-/* extern void sdio_func1cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *rmem); */
-/* extern void sdio_func1cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem); */
 u8 SdioLocalCmd52Read1Byte(struct adapter *padapter, u32 addr);
 void SdioLocalCmd52Write1Byte(struct adapter *padapter, u32 addr, u8 v);
 s32 sdio_local_read(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index bc78c32192c0..30fa070cd4d3 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -121,7 +121,6 @@ struct sta_info {
 	struct recv_reorder_ctrl recvreorder_ctrl[16];
 
 	/* for A-MPDU Tx */
-	/* unsigned char 	ampdu_txen_bitmap; */
 	u16 BA_starting_seqctrl[16];
 
 	struct ht_priv htpriv;
-- 
2.34.1

