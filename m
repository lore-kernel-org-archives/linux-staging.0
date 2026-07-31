Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5BD3CFF65
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494629; cv=none; b=LILonoC/QOgmsQ3ZGaNrU260exi51UP3ZayyDpiDSf22+bzMeghINaf1/JC6h15GG217Tnigtm29cwXKS7IhQ0VZ6T+shvgUOMKG/M4KKyD7Ow7Nshgtft5biolMYytUD/3UJz4Fw4U77Wu7M58toCOnepuNoA/ZR+03HVmHZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494629; c=relaxed/simple;
	bh=+iHyocbHvJ04pGuwpLc88raS6ANjg0uiE0VmWKmm1BE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHtAji91elh0RVciPWjTqDfIGHxyX6hkpMZh8THh1H7E9VVVXaiNbk8bxpeAegPgBGkbnxW5Y+fDchZk5y9NP1EFz+DkDHm9b8kjeiDxxCqtnoPjwb6J2Eo/t4nVI9h56bOcAQM91IikVcoy02bucNhYe6taYSxk4gaTXf/paUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWhpCQiy; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWhpCQiy"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4728c12ba97so488123f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494620; x=1786099420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xttgst+kRW0syMNUBMN7N+TvXtTCsyLFTka/W5fwwn8=;
        b=DWhpCQiyHrvQxXXIbT5gBExYTwXfPKUYM49GjXtzA4a0AP1vxY+FncGxhWC8Glfkwq
         QdakLA/SFFo18W2dlpwGCrNKDOJVikKe/+PlMe1VPuWMIVMI6dLRacp6g0Cmhci2nL+g
         Ptz1L54Cq8UOCo4pMv7EABNLdbcVrCOcrSkQjEb6baS3QO6GLJsHJLfwenYNaSh75nI5
         +huaqHI9ZegywmtzmBCkqLqRhh4dcTbRmq67PqQqAsPz6soqldvxqMUNQU8ueBIQp770
         2gu0qkDnxzjHUNQBaFsXXleURyC+humXsLZDtLjukKZRAcsgaXhtg/NLpqMA07Z8sHxa
         XRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494620; x=1786099420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xttgst+kRW0syMNUBMN7N+TvXtTCsyLFTka/W5fwwn8=;
        b=oYUeC5Z+7RH0iYzVOPvzOSd7GVArWNU2d7ZXwYGFWiN544lO9/UkWvpcCMkRRLWJGc
         wWsqGfwGu0X8Klx4MJLIqtWyWmwff0p6NvhYlWz/iY+vL48v0IWth+2f04zkQLqq/zRC
         ZgijBjL+pkpASjt6v8YGABIql5s6FYd8fw1NyKc2uu3ELnh7eGXy1DcgJdQvSMl4Wrih
         HapVMaGzSuQAn4hn4/gONO4eeqIk/nkL/jIJ+Epv4dF18ofgoxrQOlJtAcnhSIus5cnq
         0BdMCsQo5E5sXLmfhfB/ahp2k7bYLsscwrMkP88BK7rwg/FBwgmdeyIohdsqN/RuNh7H
         HmPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpr6NeWbzVozouQd+WqHam26Wcv0spvusyyBnzZqwmrA48ahTNuP5BfVCuxXiRB7o3l1by+aM/r7EZT1qNg@lists.linux.dev
X-Gm-Message-State: AOJu0YwcJixzDFRtP1LkXysnMPoU0avJ0j4v4fpPpdmARuhzNPhzjud+
	FGCQrRwoXf7piIx7AR/dEO3la7vIGZPTuGxSEJnqHR28TbHJuUbl6EVWILFWHNNU
X-Gm-Gg: AR+sD13lDxEb4J9aaxfqi70vxv3sc6PmhCrkGFKpIShJXUhrDmXbyfbf00yhXZtK1ya
	mYruon+KYgwiynaRX+f5akiD+4NYb4mLBfwEHmlsdX8/31qrHxgaTDB+b8yzx/LTXkgyQ1knqQ1
	+xl0QTFukfjkm6VNdnk5PxQXsIkRk25+7wdAoHMGONmv3ZQXHIsw75mTPJ3jgu0wLcLwVibYZf9
	F2/quMOx8N71Cj2yZgmZ9O62OtPaTpoOwEOADyLCkGlwlVwCZD/j9lDqSrG+AfIvUmj2N8iaeiG
	bxvcCxNXqLVOUZILlKg27YulEj9fXPVq5ec2zNGbiKFkCLtd5CmlgBQpD8f19UBGaACZXC2pJ86
	ppSSZgUxVnKufhVEM3bHQyNsc+n0W7b7mM9Vq3iYd4dT/4enefvHn9otiFt2qEtGTqC79bowVeT
	rUDWMkMmY3C9ZJe+Na6DkZ43Bv52pAf+xEnjOEdZ+opC8or+MKNKyB/7fVRyGxVFGiPS2FsXoiO
	R/cJkHqCNSvTmpdjJuTA+yYVP3zUW76NeaEa+mgqi3c4pSWcfl6
X-Received: by 2002:a05:6000:470e:b0:475:f0f0:9efe with SMTP id ffacd0b85a97d-47fd2b5d8c3mr3421875f8f.53.1785494619727;
        Fri, 31 Jul 2026 03:43:39 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:39 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 01/11] staging: rtl8723bs: renaming variable pbuf in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:24 +0000
Message-ID: <20260731104134.12754-2-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of pbuf to buf since the prefix p is an old
naming convention to indicate a pointer variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 42 +++++++++++------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index fc46b33b836a..7f43f8f27186 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -42,7 +42,7 @@ static void rtw_init_mlme_timer(struct adapter *padapter)
 int rtw_init_mlme_priv(struct adapter *padapter)
 {
 	int i;
-	u8 *pbuf;
+	u8 *buf;
 	struct wlan_network *pnetwork;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	int res = _SUCCESS;
@@ -62,15 +62,15 @@ int rtw_init_mlme_priv(struct adapter *padapter)
 
 	memset(&pmlmepriv->assoc_ssid, 0, sizeof(struct ndis_802_11_ssid));
 
-	pbuf = vzalloc(array_size(MAX_BSS_CNT, sizeof(struct wlan_network)));
+	buf = vzalloc(array_size(MAX_BSS_CNT, sizeof(struct wlan_network)));
 
-	if (!pbuf) {
+	if (!buf) {
 		res = _FAIL;
 		goto exit;
 	}
-	pmlmepriv->free_bss_buf = pbuf;
+	pmlmepriv->free_bss_buf = buf;
 
-	pnetwork = (struct wlan_network *)pbuf;
+	pnetwork = (struct wlan_network *)buf;
 
 	for (i = 0; i < MAX_BSS_CNT; i++) {
 		INIT_LIST_HEAD(&pnetwork->list);
@@ -632,13 +632,13 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
 	return bselected;
 }
 
-void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_survey_event_callback(struct adapter *adapter, u8 *buf)
 {
 	u32 len;
 	struct wlan_bssid_ex *pnetwork;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
-	pnetwork = (struct wlan_bssid_ex *)pbuf;
+	pnetwork = (struct wlan_bssid_ex *)buf;
 
 	len = get_wlan_bssid_ex_sz(pnetwork);
 	if (len > (sizeof(struct wlan_bssid_ex)))
@@ -675,7 +675,7 @@ void rtw_survey_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_surveydone_event_callback(struct adapter *adapter, u8 *buf)
 {
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
 
@@ -777,11 +777,11 @@ void rtw_surveydone_event_callback(struct adapter *adapter, u8 *pbuf)
 	rtw_indicate_scan_done(adapter, false);
 }
 
-void rtw_dummy_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_dummy_event_callback(struct adapter *adapter, u8 *buf)
 {
 }
 
-void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_fwdbg_event_callback(struct adapter *adapter, u8 *buf)
 {
 }
 
@@ -1143,12 +1143,12 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
 /* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
 /*  */
-void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
+void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *buf)
 {
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct sta_priv *pstapriv = &adapter->stapriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct wlan_network *pnetwork = (struct wlan_network *)pbuf;
+	struct wlan_network *pnetwork = (struct wlan_network *)buf;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 	struct wlan_network *pcur_wlan = NULL, *ptarget_wlan = NULL;
 	unsigned int the_same_macaddr = false;
@@ -1251,9 +1251,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 	timer_delete_sync(&pmlmepriv->assoc_timer);
 }
 
-void rtw_joinbss_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_joinbss_event_callback(struct adapter *adapter, u8 *buf)
 {
-	struct wlan_network *pnetwork = (struct wlan_network *)pbuf;
+	struct wlan_network *pnetwork = (struct wlan_network *)buf;
 
 	mlmeext_joinbss_event_callback(adapter, pnetwork->join_res);
 
@@ -1272,11 +1272,11 @@ void rtw_sta_media_status_rpt(struct adapter *adapter, struct sta_info *psta, u3
 	rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status_rpt);
 }
 
-void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_stassoc_event_callback(struct adapter *adapter, u8 *buf)
 {
 	struct sta_info *psta;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct stassoc_event *pstassoc = (struct stassoc_event *)pbuf;
+	struct stassoc_event *pstassoc = (struct stassoc_event *)buf;
 	struct wlan_network *cur_network = &pmlmepriv->cur_network;
 	struct wlan_network *ptarget_wlan = NULL;
 
@@ -1363,7 +1363,7 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 	mlmeext_sta_add_event_callback(adapter, psta);
 }
 
-void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
+void rtw_stadel_event_callback(struct adapter *adapter, u8 *buf)
 {
 	int mac_id = (-1);
 	struct sta_info *psta;
@@ -1371,7 +1371,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	struct wlan_bssid_ex    *pdev_network = NULL;
 	u8 *pibss = NULL;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
-	struct stadel_event *pstadel = (struct stadel_event *)pbuf;
+	struct stadel_event *pstadel = (struct stadel_event *)buf;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1480,16 +1480,16 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 	spin_unlock_bh(&pmlmepriv->lock);
 }
 
-void rtw_cpwm_event_callback(struct adapter *padapter, u8 *pbuf)
+void rtw_cpwm_event_callback(struct adapter *padapter, u8 *buf)
 {
 	struct reportpwrstate_parm *preportpwrstate;
 
-	preportpwrstate = (struct reportpwrstate_parm *)pbuf;
+	preportpwrstate = (struct reportpwrstate_parm *)buf;
 	preportpwrstate->state |= (u8)(adapter_to_pwrctl(padapter)->cpwm_tog + 0x80);
 	cpwm_int_hdl(padapter, preportpwrstate);
 }
 
-void rtw_wmm_event_callback(struct adapter *padapter, u8 *pbuf)
+void rtw_wmm_event_callback(struct adapter *padapter, u8 *buf)
 {
 	WMMOnAssocRsp(padapter);
 }
-- 
2.55.0

