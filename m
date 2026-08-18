Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE633563F6
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066467; cv=none; b=XnA1K2+XwJZP/cLvbKu2yhpdQX4a3crg1xikIE/L4wFl+pzoI2KEOySWOv9d5ZQiUjOMzhFdJzdxcezrf2GvHGemBOVWNGkKh5iQMMiWxuSLEwrJI7lMi+pEEPQ+NOxZgvHSp9A109DALCMrcfDFGcFUMwosZ/+qDlneL5E6aYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066467; c=relaxed/simple;
	bh=6iWTKheDmg1MV1yYRyOscL873fveo2GgGfEg372xrrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEo+PVJ4fg6NY/iXJZu/OfBs9muF5zvhUKC+dQN2rQFb1knSjIoMVByk7SkD53wJheX2sHJPG1uB9EicQBrpx1rih0Y/XVkATae5g1hTGipZkfNro0RUL/gFWUWBihYhXvlIx0ggLfeP7W5l9ExYYtQhmAtJ94ORO3Y6t9zZJ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qkc1fgN7; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qkc1fgN7"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so37154a91.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787066464; x=1787671264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eksSze08I842M0ZmbhXTUvz966ItUgJwf1eiDR5TTGU=;
        b=Qkc1fgN7A0DtEjEsEdUa7hJzhmNLEvPaR1d2p+MKzTWgiUh0TaMLMtm0C5xuNdkaaq
         TQdSZS+dGed+62kKcyq5Ey11MlzBTEMbRocaaGkxDiPpy4pk08XDOSa3Ep/GgpMowayc
         FUFiFUKIgZD5bcuGKknJzo+trX6/dOppmurVPayAHmexz1HmPOrnJsGP94KU0Ne/D2s3
         jfZkAc5glsMlNYKZq3XHAYyUxlUGDUxt8Tmh+gyYcehQdNa2ZJRriCkOT3Lb+ZNKgz/Y
         PVAu5Nuk4EySNb5oaUfxajMrcbguu7sPlwaUIHNLU183GukfjmEmvw/jbusJiNiX+C6o
         L1RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787066464; x=1787671264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eksSze08I842M0ZmbhXTUvz966ItUgJwf1eiDR5TTGU=;
        b=UrGF0w23eumQHMhgPROgwiuCe9qtx27x/ynETzwwghzbUN/IA2n+Yc7Ep1mkw0BnS5
         PmIwv+NxvNsDXk2hP4o9M74V+yrsfiy2ZepaTpvKUk6+gTuJplvTLih5yDAWOfSFmbo3
         K1K5xHqesveDiM9YBc8yDUDpuQjGM/6TRvqrxoxVYFdIxrpRsLjca7ttFOcT9rauPdOw
         ZufZpsJ6YWThduMnIKcPN0f5DF9u04cJqLm/+H9ZJiqN0MgkDmGxBp5JKFRjzY5lBovu
         Yolk4I4uVRdpaW6ZospdgQkZ5Vxun7s+3RCWB6rT/jSdDkFSFr9I+sCX+WDmotY28IqN
         3kOw==
X-Gm-Message-State: AOJu0Yw1mdSuWZrXCqNeHdWAAqDVFivefXtGTy6A24JeowdPOlbyC0Oz
	hmAILF70XMErevYRQlikwm1lk7+kyT2cLHUyotlNyET0Q1178GGJzxP6/KA/0+z0
X-Gm-Gg: AR+sD113vuLypeEXYNHBZ6GfaQKt/mHlrQ66tbtOz277k55996p14X+Zn2KC8qBaIn8
	T+d/S6ooEPNR1gx/o7QPA0g/2Yz9i4UUeDO45Mt6zbW1PL7QbwVPbB6hryUttNaRUJfpUxSmBjl
	boVbcm+ulUU5CvCfzHsROSmzEv2ddmjY5r1N4ixjSmGxWSw6NXG/jYz+Ur02ujVcgwmpkpAn2UY
	zrinQHAzaBcmNmKEgr9Q99W6Bmh4mwuzWm+YOiHo3plaN+O0MOVjY7V8DTXCWLv1Exbu+z1+K2Y
	M+jyQChvSuc4CVn43REa5P0z2AFgHuR8btjg92DexIQ7FhQwoXlVagYh8acQsX5x5PegRRFU12h
	WWym9fim2ebtidIwhiB/vbosfBe5LbldzSiTWDeVvSwuooeEhSe2dZNAJaX35y9u0AhA7IjNXkB
	rCrwXCAxw3k2AOHdTmD1Hboo//a2AWdddeWWMsMJDPJTwlxRtvmXOflpK3bBHLEGZd8rbqmK40r
	LucKYKZI5bmJCQOwA==
X-Received: by 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3933b78b698mr37138792a91.6.1787066463531;
        Tue, 18 Aug 2026 08:21:03 -0700 (PDT)
Received: from COMLAP4774 ([2a09:bac0:1000:95d::2fd:42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798cb9f5sm21912248eec.13.2026.08.18.08.21.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 18 Aug 2026 08:21:02 -0700 (PDT)
From: Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove extern from function declarations in header files
Date: Tue, 18 Aug 2026 20:50:55 +0530
Message-ID: <20260818152055.486-1-dhanushmuralidharan@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818131601.96509-1-dhanushmuralidharan@gmail.com>
References: <20260818131601.96509-1-dhanushmuralidharan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function declarations in header files are implicitly extern. Remove the redundant extern keyword to clean up the code.

Signed-off-by: Dhanush Muralidharan <dhanushmuralidharan@gmail.com>
---
 drivers/staging/rtl8723bs/include/cmd_osdep.h |  6 +-
 .../staging/rtl8723bs/include/osdep_service.h |  4 +-
 .../rtl8723bs/include/osdep_service_linux.h   |  2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h   | 58 +++++++-------
 drivers/staging/rtl8723bs/include/rtw_io.h    | 14 ++--
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 78 +++++++++----------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 18 ++---
 .../staging/rtl8723bs/include/rtw_pwrctrl.h   | 22 +++---
 drivers/staging/rtl8723bs/include/rtw_recv.h  | 16 ++--
 drivers/staging/rtl8723bs/include/rtw_xmit.h  | 28 +++----
 drivers/staging/rtl8723bs/include/sdio_ops.h  | 20 ++---
 drivers/staging/rtl8723bs/include/sta_info.h  | 18 ++---
 .../staging/rtl8723bs/include/xmit_osdep.h    | 14 ++--
 13 files changed, 149 insertions(+), 149 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 91d933d71945..a7b526a658a9 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -9,8 +9,8 @@
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
-extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
+void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
+void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
+struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 2f5011a8210c..e2eebd46cb5c 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -15,7 +15,7 @@
 #include <osdep_service_linux.h>
 
 
-extern int RTW_STATUS_CODE(int error_code);
+int RTW_STATUS_CODE(int error_code);
 
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
@@ -29,7 +29,7 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-extern void rtw_free_netdev(struct net_device *netdev);
+void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
diff --git a/drivers/staging/rtl8723bs/include/osdep_service_linux.h b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
index c8274da940ff..cc5eaf6a2c61 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service_linux.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service_linux.h
@@ -113,6 +113,6 @@ static inline struct adapter *rtw_netdev_priv(struct net_device *netdev)
 }
 
 struct net_device *rtw_alloc_etherdev_with_old_priv(int sizeof_priv, void *old_priv);
-extern struct net_device *rtw_alloc_etherdev(int sizeof_priv);
+struct net_device *rtw_alloc_etherdev(int sizeof_priv);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 2e791da7e815..58a5ec39ce76 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -107,16 +107,16 @@ struct c2h_evt_hdr_88xx {
 #define c2h_evt_valid(c2h_evt) ((c2h_evt)->id || (c2h_evt)->plen)
 
 int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *obj);
-extern struct cmd_obj *rtw_dequeue_cmd(struct cmd_priv *pcmdpriv);
-extern void rtw_free_cmd_obj(struct cmd_obj *pcmd);
+struct cmd_obj *rtw_dequeue_cmd(struct cmd_priv *pcmdpriv);
+void rtw_free_cmd_obj(struct cmd_obj *pcmd);
 
 void rtw_stop_cmd_thread(struct adapter *adapter);
 int rtw_cmd_thread(void *context);
 
-extern void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
+void rtw_free_cmd_priv(struct cmd_priv *pcmdpriv);
 
-extern void rtw_free_evt_priv(struct evt_priv *pevtpriv);
-extern void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
+void rtw_free_evt_priv(struct evt_priv *pevtpriv);
+void rtw_evt_notify_isr(struct evt_priv *pevtpriv);
 
 enum {
 	NONE_WK_CID,
@@ -573,50 +573,50 @@ struct RunInThread_param {
 #define H2C_RESERVED			0x07
 
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid, int ssid_num, struct rtw_ieee80211_channel *ch, int ch_num);
-extern u8 rtw_createbss_cmd(struct adapter  *padapter);
+u8 rtw_createbss_cmd(struct adapter  *padapter);
 int rtw_startbss_cmd(struct adapter  *padapter, int flags);
 
 struct sta_info;
-extern u8 rtw_setstakey_cmd(struct adapter  *padapter, struct sta_info *sta, u8 unicast_key, bool enqueue);
-extern u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueue);
+u8 rtw_setstakey_cmd(struct adapter  *padapter, struct sta_info *sta, u8 unicast_key, bool enqueue);
+u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueue);
 
-extern u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
+u8 rtw_joinbss_cmd(struct adapter *padapter, struct wlan_network *pnetwork);
 u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueue);
-extern u8 rtw_setopmode_cmd(struct adapter  *padapter, enum nl80211_iftype networktype, bool enqueue);
-extern u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
+u8 rtw_setopmode_cmd(struct adapter  *padapter, enum nl80211_iftype networktype, bool enqueue);
+u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 
-extern u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
-extern u8 rtw_setfwdig_cmd(struct adapter *padapter, u8 type);
-extern u8 rtw_setfwra_cmd(struct adapter *padapter, u8 type);
+u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset, u8 *pval);
+u8 rtw_setfwdig_cmd(struct adapter *padapter, u8 type);
+u8 rtw_setfwra_cmd(struct adapter *padapter, u8 type);
 
-extern u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr);
-extern u8 rtw_reset_securitypriv_cmd(struct adapter *padapter);
-extern u8 rtw_free_assoc_resources_cmd(struct adapter *padapter);
-extern u8 rtw_dynamic_chk_wk_cmd(struct adapter *adapter);
+u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr);
+u8 rtw_reset_securitypriv_cmd(struct adapter *padapter);
+u8 rtw_free_assoc_resources_cmd(struct adapter *padapter);
+u8 rtw_dynamic_chk_wk_cmd(struct adapter *adapter);
 
 u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue);
 u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter);
 
 u8 rtw_dm_ra_mask_wk_cmd(struct adapter *padapter, u8 *psta);
 
-extern u8 rtw_ps_cmd(struct adapter *padapter);
+u8 rtw_ps_cmd(struct adapter *padapter);
 
 u8 rtw_chk_hi_queue_cmd(struct adapter *padapter);
 
-extern u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length);
-extern u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt);
+u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length);
+u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt);
 
 u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf);
 
-extern void rtw_survey_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_disassoc_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
-extern void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
+void rtw_survey_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
+void rtw_disassoc_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
+void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
+void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
+void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 
-extern void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
-extern void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
-extern void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
+void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
+void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
+void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 
 
 struct _cmd_callback {
diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 3c99a2bc19bd..55bedd912993 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -43,15 +43,15 @@ struct io_priv {
 
 };
 
-extern u8 rtw_read8(struct adapter *adapter, u32 addr);
-extern u16 rtw_read16(struct adapter *adapter, u32 addr);
-extern u32 rtw_read32(struct adapter *adapter, u32 addr);
+u8 rtw_read8(struct adapter *adapter, u32 addr);
+u16 rtw_read16(struct adapter *adapter, u32 addr);
+u32 rtw_read32(struct adapter *adapter, u32 addr);
 
-extern int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
-extern int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
-extern int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
+int rtw_write8(struct adapter *adapter, u32 addr, u8 val);
+int rtw_write16(struct adapter *adapter, u32 addr, u16 val);
+int rtw_write32(struct adapter *adapter, u32 addr, u32 val);
 
-extern u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
+u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem);
 
 int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops));
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 6faa13535b62..7709d5fd77a3 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -249,32 +249,32 @@ struct hostapd_priv {
 	struct adapter *padapter;
 };
 
-extern int hostapd_mode_init(struct adapter *padapter);
-extern void hostapd_mode_unload(struct adapter *padapter);
+int hostapd_mode_init(struct adapter *padapter);
+void hostapd_mode_unload(struct adapter *padapter);
 
-extern void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf);
-extern void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_cpwm_event_callback(struct adapter *adapter, u8 *pbuf);
-extern void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf);
+void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf);
+void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_cpwm_event_callback(struct adapter *adapter, u8 *pbuf);
+void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf);
 
-extern void rtw_join_timeout_handler(struct timer_list *t);
-extern void _rtw_scan_timeout_handler(struct timer_list *t);
+void rtw_join_timeout_handler(struct timer_list *t);
+void _rtw_scan_timeout_handler(struct timer_list *t);
 
 int event_thread(void *context);
 
-extern void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall);
-extern int rtw_init_mlme_priv(struct adapter *adapter);/*  (struct mlme_priv *pmlmepriv); */
+void rtw_free_network_queue(struct adapter *adapter, u8 isfreeall);
+int rtw_init_mlme_priv(struct adapter *adapter);/*  (struct mlme_priv *pmlmepriv); */
 
-extern void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
+void rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
 
 
-extern signed int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv);
-extern signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue);
-extern signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv);
+signed int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv);
+signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, signed int keyid, u8 set_tx, bool enqueue);
+signed int rtw_set_auth(struct adapter *adapter, struct security_priv *psecuritypriv);
 
 static inline u8 *get_bssid(struct mlme_priv *pmlmepriv)
 {	/* if sta_mode:pmlmepriv->cur_network.network.mac_address => bssid */
@@ -318,48 +318,48 @@ static inline void _clr_fwstate_(struct mlme_priv *pmlmepriv, signed int state)
 		pmlmepriv->bScanInProcess = false;
 }
 
-extern u16 rtw_get_capability(struct wlan_bssid_ex *bss);
-extern void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target);
-extern void rtw_disconnect_hdl_under_linked(struct adapter *adapter, struct sta_info *psta, u8 free_assoc);
-extern void rtw_generate_random_ibss(u8 *pibss);
-extern struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr);
-extern struct wlan_network *rtw_get_oldest_wlan_network(struct __queue *scanned_queue);
+u16 rtw_get_capability(struct wlan_bssid_ex *bss);
+void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *target);
+void rtw_disconnect_hdl_under_linked(struct adapter *adapter, struct sta_info *psta, u8 free_assoc);
+void rtw_generate_random_ibss(u8 *pibss);
+struct wlan_network *rtw_find_network(struct __queue *scanned_queue, u8 *addr);
+struct wlan_network *rtw_get_oldest_wlan_network(struct __queue *scanned_queue);
 struct wlan_network *_rtw_find_same_network(struct __queue *scanned_queue, struct wlan_network *network);
 
-extern void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue);
-extern void rtw_indicate_disconnect(struct adapter *adapter);
-extern void rtw_indicate_connect(struct adapter *adapter);
+void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue);
+void rtw_indicate_disconnect(struct adapter *adapter);
+void rtw_indicate_connect(struct adapter *adapter);
 void rtw_indicate_scan_done(struct adapter *padapter, bool aborted);
 void rtw_scan_abort(struct adapter *adapter);
 
-extern int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len);
-extern int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len);
-extern void rtw_init_registrypriv_dev_network(struct adapter *adapter);
+int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len);
+int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_len, uint initial_out_len);
+void rtw_init_registrypriv_dev_network(struct adapter *adapter);
 
-extern void rtw_update_registrypriv_dev_network(struct adapter *adapter);
+void rtw_update_registrypriv_dev_network(struct adapter *adapter);
 
-extern void _rtw_join_timeout_handler(struct timer_list *t);
-extern void rtw_scan_timeout_handler(struct timer_list *t);
+void _rtw_join_timeout_handler(struct timer_list *t);
+void rtw_scan_timeout_handler(struct timer_list *t);
 
-extern void rtw_dynamic_check_timer_handler(struct adapter *adapter);
+void rtw_dynamic_check_timer_handler(struct adapter *adapter);
 bool rtw_is_scan_deny(struct adapter *adapter);
 void rtw_clear_scan_deny(struct adapter *adapter);
 void rtw_set_scan_deny(struct adapter *adapter, u32 ms);
 
 void rtw_free_mlme_priv_ie_data(struct mlme_priv *pmlmepriv);
 
-extern void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
+void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv);
 
 /* extern struct wlan_network* _rtw_dequeue_network(struct __queue *queue); */
 
-extern struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
+struct wlan_network *rtw_alloc_network(struct mlme_priv *pmlmepriv);
 
 
-extern void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall);
-extern void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork);
+void _rtw_free_network(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork, u8 isfreeall);
+void _rtw_free_network_nolock(struct mlme_priv *pmlmepriv, struct wlan_network *pnetwork);
 
 
-extern struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
+struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr);
 
 bool rtw_if_up(struct adapter *padapter);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 179fae4d8fcc..0ad4be079690 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -422,7 +422,7 @@ void init_mlme_default_rate_set(struct adapter *padapter);
 void init_mlme_ext_priv(struct adapter *padapter);
 void init_hw_mlme_ext(struct adapter *padapter);
 void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext);
-extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
+struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 
 /* void fill_fwpriv(struct adapter *padapter, struct fw_priv *pfwpriv); */
 
@@ -516,8 +516,8 @@ s16 rtw_camid_search(struct adapter *adapter, u8 *addr, s16 kid);
 s16 rtw_camid_alloc(struct adapter *adapter, struct sta_info *sta, u8 kid);
 void rtw_camid_free(struct adapter *adapter, u8 cam_id);
 
-extern void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta);
-extern void rtw_release_macid(struct adapter *padapter, struct sta_info *psta);
+void rtw_alloc_macid(struct adapter *padapter, struct sta_info *psta);
+void rtw_release_macid(struct adapter *padapter, struct sta_info *psta);
 
 void report_join_res(struct adapter *padapter, int res);
 void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame);
@@ -527,7 +527,7 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 void report_wmm_edca_update(struct adapter *padapter);
 
 u8 chk_bmc_sleepq_cmd(struct adapter *padapter);
-extern u8 set_tx_beacon_cmd(struct adapter *padapter);
+u8 set_tx_beacon_cmd(struct adapter *padapter);
 unsigned int setup_beacon_frame(struct adapter *padapter, unsigned char *beacon_frame);
 void update_mgnt_tx_rate(struct adapter *padapter, u8 rate);
 void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib);
@@ -606,12 +606,12 @@ void sa_query_timer_hdl(struct timer_list *t);
 		_set_timer(&(mlmeext)->sa_query_timer, (ms)); \
 	} while (0)
 
-extern void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
+void process_addba_req(struct adapter *padapter, u8 *paddba_req, u8 *addr);
 
-extern void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
-extern void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
-extern bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
+void update_TSF(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+void correct_TSF(struct adapter *padapter, struct mlme_ext_priv *pmlmeext);
+void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len);
+bool traffic_status_watchdog(struct adapter *padapter, bool from_timer);
 
 int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 182b8c88ccc8..49f19b6ee329 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -212,20 +212,20 @@ struct pwrctrl_priv {
 		_set_timer(&(pwrctl)->pwr_state_check_timer, (ms)); \
 	} while (0)
 
-extern void rtw_init_pwrctrl_priv(struct adapter *adapter);
-extern void rtw_free_pwrctrl_priv(struct adapter *adapter);
+void rtw_init_pwrctrl_priv(struct adapter *adapter);
+void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-extern s32 rtw_register_tx_alive(struct adapter *padapter);
-extern void rtw_unregister_tx_alive(struct adapter *padapter);
-extern s32 rtw_register_cmd_alive(struct adapter *padapter);
-extern void rtw_unregister_cmd_alive(struct adapter *padapter);
-extern void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate);
-extern void LPS_Leave_check(struct adapter *padapter);
-
-extern void LeaveAllPowerSaveMode(struct adapter *Adapter);
-extern void LeaveAllPowerSaveModeDirect(struct adapter *Adapter);
+s32 rtw_register_tx_alive(struct adapter *padapter);
+void rtw_unregister_tx_alive(struct adapter *padapter);
+s32 rtw_register_cmd_alive(struct adapter *padapter);
+void rtw_unregister_cmd_alive(struct adapter *padapter);
+void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate);
+void LPS_Leave_check(struct adapter *padapter);
+
+void LeaveAllPowerSaveMode(struct adapter *Adapter);
+void LeaveAllPowerSaveModeDirect(struct adapter *Adapter);
 void _ips_enter(struct adapter *padapter);
 void ips_enter(struct adapter *padapter);
 int _ips_leave(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 9c32d480a20a..d01e3b41e558 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -326,14 +326,14 @@ enum {
 	C2H_PACKET
 };
 
-extern union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
-extern int	 rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
+union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+union recv_frame *rtw_alloc_recvframe(struct __queue *pfree_recv_queue);  /* get a free recv_frame from pfree_recv_queue */
+int	 rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_queue);
 
-extern int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
-extern int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
+int rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue);
 
-extern void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
+void rtw_free_recvframe_queue(struct __queue *pframequeue,  struct __queue *pfree_recv_queue);
 u32 rtw_free_uc_swdec_pending_queue(struct adapter *adapter);
 
 signed int rtw_enqueue_recvbuf_to_head(struct recv_buf *precvbuf, struct __queue *queue);
@@ -450,8 +450,8 @@ static inline s32 translate_percentage_to_dbm(u32 SignalStrengthIndex)
 
 struct sta_info;
 
-extern void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
+void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv);
 
-extern void  mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
+void  mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame);
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 917e846e9ce2..4d0bb8c15f70 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -397,34 +397,34 @@ struct	xmit_priv {
 	spinlock_t lock_sctx;
 };
 
-extern struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
+struct xmit_frame *__rtw_alloc_cmdxmitframe(struct xmit_priv *pxmitpriv,
 		enum cmdbuf_type buf_type);
 #define rtw_alloc_cmdxmitframe(p) __rtw_alloc_cmdxmitframe(p, CMDBUF_RSVD)
 #define rtw_alloc_bcnxmitframe(p) __rtw_alloc_cmdxmitframe(p, CMDBUF_BEACON)
 
-extern struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
+struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
+s32 rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
-extern struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
+struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
+s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
-extern void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
-extern int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
-extern s32 rtw_put_snap(u8 *data, u16 h_proto);
+void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
+s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib);
+s32 rtw_put_snap(u8 *data, u16 h_proto);
 
-extern struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
+struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_ext(struct xmit_priv *pxmitpriv);
 struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
-extern void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
+s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitframe);
+void rtw_free_xmitframe_queue(struct xmit_priv *pxmitpriv, struct __queue *pframequeue);
 struct tx_servq *rtw_get_sta_pending(struct adapter *padapter, struct sta_info *psta, signed int up, u8 *ac);
 int rtw_xmitframe_enqueue(struct adapter *padapter, struct xmit_frame *pxmitframe);
 
-extern u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
+u32 rtw_calculate_wlan_pkt_size_by_attribue(struct pkt_attrib *pattrib);
 #define rtw_wlan_pkt_size(f) rtw_calculate_wlan_pkt_size_by_attribue(&f->attrib)
-extern int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
-extern s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
+s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct xmit_frame *pxmitframe);
 s32 _rtw_init_hw_txqueue(struct hw_txqueue *phw_txqueue, u8 ac_tag);
 void _rtw_init_sta_xmit_priv(struct sta_xmit_priv *psta_xmitpriv);
 
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 252b0e1646e5..6fc765b03045 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -10,24 +10,24 @@
 
 #include <sdio_ops_linux.h>
 
-extern void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
+void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
 
 /* extern void sdio_func1cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *rmem); */
 /* extern void sdio_func1cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem); */
-extern u8 SdioLocalCmd52Read1Byte(struct adapter *padapter, u32 addr);
-extern void SdioLocalCmd52Write1Byte(struct adapter *padapter, u32 addr, u8 v);
-extern s32 sdio_local_read(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
-extern s32 sdio_local_write(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
+u8 SdioLocalCmd52Read1Byte(struct adapter *padapter, u32 addr);
+void SdioLocalCmd52Write1Byte(struct adapter *padapter, u32 addr, u8 v);
+s32 sdio_local_read(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
+s32 sdio_local_write(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
 
 u32 _sdio_read32(struct adapter *padapter, u32 addr);
 s32 _sdio_write32(struct adapter *padapter, u32 addr, u32 val);
 
-extern void sd_int_hdl(struct adapter *padapter);
-extern u8 CheckIPSStatus(struct adapter *padapter);
+void sd_int_hdl(struct adapter *padapter);
+u8 CheckIPSStatus(struct adapter *padapter);
 
-extern void InitInterrupt8723BSdio(struct adapter *padapter);
+void InitInterrupt8723BSdio(struct adapter *padapter);
 void rtw_sdio_enable_interrupt(struct adapter *padapter);
 void rtw_sdio_disable_interrupt(struct adapter *padapter);
-extern u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
-extern void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *padapter);
+u8 HalQueryTxBufferStatus8723BSdio(struct adapter *padapter);
+void HalQueryTxOQTBufferStatus8723BSdio(struct adapter *padapter);
 #endif /*  !__SDIO_OPS_H__ */
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 0f53e77c110c..984b3a60fbab 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -312,19 +312,19 @@ static inline u32 wifi_mac_hash(u8 *mac)
 }
 
 
-extern u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
-extern u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_init_sta_priv(struct sta_priv *pstapriv);
+u32 _rtw_free_sta_priv(struct sta_priv *pstapriv);
 
 #define stainfo_offset_valid(offset) (offset < NUM_STA && offset >= 0)
 int rtw_stainfo_offset(struct sta_priv *stapriv, struct sta_info *sta);
 struct sta_info *rtw_get_stainfo_by_offset(struct sta_priv *stapriv, int offset);
 
-extern struct sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
-extern void rtw_free_all_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
-extern u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
-extern struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
-extern u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
+struct sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_free_stainfo(struct adapter *padapter, struct sta_info *psta);
+void rtw_free_all_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr);
+u32 rtw_init_bcmc_stainfo(struct adapter *padapter);
+struct sta_info *rtw_get_bcmc_stainfo(struct adapter *padapter);
+u8 rtw_access_ctrl(struct adapter *padapter, u8 *mac_addr);
 
 #endif /* _STA_INFO_H_ */
diff --git a/drivers/staging/rtl8723bs/include/xmit_osdep.h b/drivers/staging/rtl8723bs/include/xmit_osdep.h
index ee6616880d41..884eb9d9850e 100644
--- a/drivers/staging/rtl8723bs/include/xmit_osdep.h
+++ b/drivers/staging/rtl8723bs/include/xmit_osdep.h
@@ -25,19 +25,19 @@ struct sta_xmit_priv;
 struct xmit_frame;
 struct xmit_buf;
 
-extern void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
-extern netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+void _rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
+netdev_tx_t rtw_xmit_entry(struct sk_buff *pkt, struct net_device *pnetdev);
 
 void rtw_os_xmit_schedule(struct adapter *padapter);
 
 void rtw_os_xmit_resource_free(struct adapter *padapter, struct xmit_buf *pxmitbuf, u32 free_sz, u8 flag);
 
-extern unsigned int rtw_remainder_len(struct pkt_file *pfile);
-extern void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
+uint rtw_remainder_len(struct pkt_file *pfile);
+void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen);
-extern signed int rtw_endofpktfile(struct pkt_file *pfile);
+signed int rtw_endofpktfile(struct pkt_file *pfile);
 
-extern void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
-extern void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
+void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt);
+void rtw_os_xmit_complete(struct adapter *padapter, struct xmit_frame *pxframe);
 
 #endif /* __XMIT_OSDEP_H_ */
-- 
2.50.1 (Apple Git-155)

