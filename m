Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5385C2CA8
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 03:45:07 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f8so14112220pgf.8
        for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 19:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=o5goEzVTL8jcl0JNIqgZWIhooaVKAMAMA+en32+iljw=;
        b=qP8cVR6TY+bklbJiYJNaATSc+XFaZvjghft5GhaE2ulpWRl+guuUEFPza8K10W0ANm
         wM56kGzB6BG94XYS+N20Z4/t6UTjIqx2bcXV02DpPSol4omEiHPExrYbsbg7sIDarHEe
         QeFAaKgYWXrGdo99Md4qnNcYMWWgQ7WW7KCKR7dxydbfjw1jEGR5/rDOtxE5XqYfnGCs
         mT74LzASZhuRKjVuk3EoyAKwaM5Iw6nCXt6e79IQ6A2jecGo8U2+b2WCQURpqvVirltI
         TuVU2j9DfRIRVrKZMyXGo91Y/wIPqcMJbHhoqFMpd8flbr2TrCo2OAJlzZOzLdFXzj+M
         69zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=o5goEzVTL8jcl0JNIqgZWIhooaVKAMAMA+en32+iljw=;
        b=kuZvccM13iNli7USPTlg44SZOmjlZsQnQkDBacwB8wN0JymRz56hHJz+aKTjrW/RTr
         wLzcgSaiq1xOi++Ln1eJsLpKIyAKvynGm74mOPMJHpUyOqUzF5ZRUu6tI3/ItiR+5W0L
         z94bXZ+XMjIXxE73Wb30El9g4tXeva/IUil3pEZHyTWV3bD42DskoK7XXap+KJNOQZOg
         s7t8/IKlgSsyG9l9StNJ5D7AyxBYOvgLO1ZtSFDwAjdcBkFwFt2+1taccgVJ8Ywn6DJr
         XBM6ECAW7emcV76EKzMxOGf3Joaorx46W33A8uKR7yPogsAWqe/iQj3Vzj2iE1s1+BRV
         5ulQ==
X-Gm-Message-State: AOAM5339YjNj0VvfYIltWnjEJIQfX4ViARu8y3sMb6DUqqutqiF9XSG3
	zeu9ZcJRoW+xj6GwJ6ExlFa+kdFvTOSjaA==
X-Google-Smtp-Source: ABdhPJxrtmYNC8f6EujWuQAHjiV04DUJZZgQCztAO28ohBunjINzlUDHQjO8glKft91l1wUzuZaQSg==
X-Received: by 2002:a62:7602:0:b0:4c6:864b:6400 with SMTP id r2-20020a627602000000b004c6864b6400mr12604078pfc.14.1642995906830;
        Sun, 23 Jan 2022 19:45:06 -0800 (PST)
Received: from localhost.localdomain ([27.7.142.194])
        by smtp.gmail.com with ESMTPSA id p38sm9853390pgb.36.2022.01.23.19.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 19:45:06 -0800 (PST)
From: Jagath Jog J <jagathjog1996@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	marcocesati@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jagathjog1996@gmail.com
Subject: [Patch  2/3] Staging: rtl8723bs: Removed extra spaces between datatype and variable
Date: Mon, 24 Jan 2022 09:14:55 +0530
Message-Id: <20220124034456.8665-3-jagathjog1996@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220124034456.8665-1-jagathjog1996@gmail.com>
References: <20220124034456.8665-1-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix following checkpatch.pl warning by placing single space between
datatype and variable
WARNING: please, no space before tabs

Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 54 ++++++++++++------------
 1 file changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b28351a97cd3..14d37b369273 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -531,9 +531,9 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	struct rtw_ieee80211_channel *ch, int ch_num)
 {
 	u8 res = _FAIL;
-	struct cmd_obj		*ph2c;
-	struct sitesurvey_parm	*psurveyPara;
-	struct cmd_priv 	*pcmdpriv = &padapter->cmdpriv;
+	struct cmd_obj *ph2c;
+	struct sitesurvey_parm *psurveyPara;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED))
@@ -632,8 +632,8 @@ void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *p
 u8 rtw_createbss_cmd(struct adapter  *padapter)
 {
 	struct cmd_obj *pcmd;
-	struct cmd_priv 			*pcmdpriv = &padapter->cmdpriv;
-	struct wlan_bssid_ex		*pdev_network = &padapter->registrypriv.dev_network;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
+	struct wlan_bssid_ex *pdev_network = &padapter->registrypriv.dev_network;
 	u8 res = _SUCCESS;
 
 	pcmd = rtw_zmalloc(sizeof(struct cmd_obj));
@@ -707,14 +707,14 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 {
 	u8 res = _SUCCESS;
 	uint	t_len = 0;
-	struct wlan_bssid_ex		*psecnetwork;
-	struct cmd_obj		*pcmd;
-	struct cmd_priv 	*pcmdpriv = &padapter->cmdpriv;
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
-	struct qos_priv 	*pqospriv = &pmlmepriv->qospriv;
+	struct wlan_bssid_ex *psecnetwork;
+	struct cmd_obj *pcmd;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct qos_priv *pqospriv = &pmlmepriv->qospriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
-	struct ht_priv 		*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv *phtpriv = &pmlmepriv->htpriv;
 	enum ndis_802_11_network_infrastructure ndis_network_mode = pnetwork->network.infrastructure_mode;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -789,9 +789,9 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	phtpriv->ht_option = false;
 	ptmp = rtw_get_ie(&pnetwork->network.ies[12], WLAN_EID_HT_CAPABILITY, &tmp_len, pnetwork->network.ie_length-12);
 	if (pregistrypriv->ht_enable && ptmp && tmp_len > 0) {
-		/* 	Added by Albert 2010/06/23 */
-		/* 	For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
-		/* 	Especially for Realtek 8192u SoftAP. */
+		/* Added by Albert 2010/06/23 */
+		/* For the WEP mode, we will use the bg mode to do the connection to avoid some IOT issue. */
+		/* Especially for Realtek 8192u SoftAP. */
 		if ((padapter->securitypriv.dot11PrivacyAlgrthm != _WEP40_) &&
 			(padapter->securitypriv.dot11PrivacyAlgrthm != _WEP104_) &&
 			(padapter->securitypriv.dot11PrivacyAlgrthm != _TKIP_)) {
@@ -897,12 +897,11 @@ u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infrast
 u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_key, bool enqueue)
 {
 	struct cmd_obj *ph2c;
-	struct set_stakey_parm	*psetstakey_para;
-	struct cmd_priv 			*pcmdpriv = &padapter->cmdpriv;
-	struct set_stakey_rsp		*psetstakey_rsp = NULL;
-
-	struct mlme_priv 		*pmlmepriv = &padapter->mlmepriv;
-	struct security_priv 	*psecuritypriv = &padapter->securitypriv;
+	struct set_stakey_parm *psetstakey_para;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
+	struct set_stakey_rsp *psetstakey_rsp = NULL;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	u8 res = _SUCCESS;
 
 	psetstakey_para = rtw_zmalloc(sizeof(struct set_stakey_parm));
@@ -957,9 +956,9 @@ u8 rtw_setstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 unicast_
 u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueue)
 {
 	struct cmd_obj *ph2c;
-	struct set_stakey_parm	*psetstakey_para;
-	struct cmd_priv 			*pcmdpriv = &padapter->cmdpriv;
-	struct set_stakey_rsp		*psetstakey_rsp = NULL;
+	struct set_stakey_parm *psetstakey_para;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
+	struct set_stakey_rsp *psetstakey_rsp = NULL;
 	s16 cam_id = 0;
 	u8 res = _SUCCESS;
 
@@ -1009,9 +1008,9 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, struct sta_info *sta, u8 enqueu
 
 u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 {
-	struct cmd_priv 	*pcmdpriv = &padapter->cmdpriv;
+	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct cmd_obj *ph2c;
-	struct addBaReq_parm	*paddbareq_parm;
+	struct addBaReq_parm *paddbareq_parm;
 
 	u8 res = _SUCCESS;
 
@@ -1228,8 +1227,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 	u16 BusyThreshold = BusyThresholdHigh;
 	u8 bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
 	u8 bHigherBusyTraffic = false, bHigherBusyRxTraffic = false, bHigherBusyTxTraffic = false;
-
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
+	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	collect_traffic_statistics(padapter);
 
@@ -1409,7 +1407,7 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 {
 	struct cmd_obj	*ph2c;
-	struct drvextra_cmd_parm	*pdrvextra_cmd_parm;
+	struct drvextra_cmd_parm *pdrvextra_cmd_parm;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	/* struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter); */
 	u8 res = _SUCCESS;
-- 
2.17.1

