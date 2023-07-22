Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2AEBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:59:19 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-345f3e28082so15149175ab.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063158; x=1690667958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICetZO3eJiINHtdQ5D1OIXxRMuzgneIba8TDtaF3d6E=;
        b=igpp763ye/MqzfrVlap+d88m97CjjDSbCeJm4qM2yOg4Dwtmx5u8AdHOLXLkJCzkm8
         7DFM7SaC1F7H2GPAx7glIjuGmgq2JeKs7f69g/V6g0rvoEbaOEi1JCRFARaKnmXtkqSp
         /GEmm47vUybvNxMw7uWIabGvVXajEPZ4Oma8UGOpARHi8Ao3xQqlkan4d6Vl9KL0c961
         CQttcuwVX6BIQIOfZridUj9pUtxJNdoOi7osLW2fmsWIwCXNPofhHotnemBNKK1CdjoD
         yuyRm5bGtpnFUrDebwjZ4pVCHjdfJn5FWSFeBb47MSeKu7Sfr40eiyeNbny9j1kPMYtb
         MWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063158; x=1690667958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICetZO3eJiINHtdQ5D1OIXxRMuzgneIba8TDtaF3d6E=;
        b=OOPX3knnGjBQ/0iK+kYxkKxk+J87tGfm0jwCtCdIOunj6vlEV7NtLW6/YIuqTmY+gl
         Ak5SDHyLbHx1GWZDknAdcOwhtqk0LE8our1wctHRXxYA90e2jzHb1DNHZnhZikP7dege
         vDFAOHBpw4KfR9MmplUsKMJptjsqFp2Pw7TRu9OTG7n+Y+8CO7uoIH952EZkWZ5b1B2K
         MOnKc7YLWsmxIc1NNCNYSivrll3tRUmPtb884unbOMI/FNOws0QB4tZmz2KezjmMuzZO
         /OXfqMLCKSSqit3NreDwHc36OQUqpIKwC9AfquwaJO/iow6qt70nqwPVMjdXTXaMOiAy
         M+IA==
X-Gm-Message-State: ABy/qLYg8Q9OP9ORN5y7kMBenjM5w0bxd+BBa2bGGPSJD7mksXYmuBdJ
	EVbldjf4eMCWOQaLRe7504U=
X-Google-Smtp-Source: APBJJlHXV0jmg/1doLTbZ3FFNTvdBkhrS+Ce1zxiK5mVCmupiC8T+9vMTzdib9n7CCIgyNTl0x1CRw==
X-Received: by 2002:a05:6602:2993:b0:787:8fc:307d with SMTP id o19-20020a056602299300b0078708fc307dmr4086777ior.5.1690063158515;
        Sat, 22 Jul 2023 14:59:18 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id t18-20020a02ccb2000000b0042af069eeefsm1869614jap.50.2023.07.22.14.59.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:59:18 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 8/9] staging: rtl8723bs: ioctl_linux: Add preferred spaces
Date: Sat, 22 Jul 2023 23:59:16 +0200
Message-Id: <20230722215916.4413-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issues:
- CHECK: spaces preferred around that '+' (ctx:VxV)
- CHECK: spaces preferred around that '&' (ctx:VxV)
- CHECK: spaces preferred around that '|' (ctx:VxV)
- CHECK: spaces required around that ':' (ctx:VxV)

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    | 38 +++++++++----------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 88f560353df7..2896d64e13be 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -13,7 +13,7 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 
-#define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV+30)
+#define RTL_IOCTL_WPA_SUPPLICANT	(SIOCIWFIRSTPRIV + 30)
 
 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
 {
@@ -315,18 +315,18 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 			while (cnt < ielen) {
 				eid = buf[cnt];
 
-				if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&buf[cnt+2], wps_oui, 4))) {
-					padapter->securitypriv.wps_ie_len = ((buf[cnt+1]+2) < MAX_WPS_IE_LEN) ? (buf[cnt+1]+2):MAX_WPS_IE_LEN;
+				if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&buf[cnt + 2], wps_oui, 4))) {
+					padapter->securitypriv.wps_ie_len = ((buf[cnt + 1] + 2) < MAX_WPS_IE_LEN) ? (buf[cnt + 1] + 2) : MAX_WPS_IE_LEN;
 
 					memcpy(padapter->securitypriv.wps_ie, &buf[cnt], padapter->securitypriv.wps_ie_len);
 
 					set_fwstate(&padapter->mlmepriv, WIFI_UNDER_WPS);
 
-					cnt += buf[cnt+1]+2;
+					cnt += buf[cnt + 1] + 2;
 
 					break;
 				} else {
-					cnt += buf[cnt+1]+2; /* goto next */
+					cnt += buf[cnt + 1] + 2; /* goto next */
 				}
 			}
 		}
@@ -359,7 +359,7 @@ static int wpa_set_param(struct net_device *dev, u8 name, u32 value)
 
 		/* ret = ieee80211_wpa_enable(ieee, value); */
 
-		switch ((value)&0xff) {
+		switch ((value) & 0xff) {
 		case 1: /* WPA */
 			padapter->securitypriv.ndisauthtype = Ndis802_11AuthModeWPAPSK; /* WPA_PSK */
 			padapter->securitypriv.ndisencryptstatus = Ndis802_11Encryption2Enabled;
@@ -758,7 +758,7 @@ static int rtw_set_beacon(struct net_device *dev, struct ieee_param *param, int
 	if ((pstapriv->max_num_sta > NUM_STA) || (pstapriv->max_num_sta <= 0))
 		pstapriv->max_num_sta = NUM_STA;
 
-	if (rtw_check_beacon_data(padapter, pbuf,  (len-12-2)) == _SUCCESS)/*  12 = param header, 2:no packed */
+	if (rtw_check_beacon_data(padapter, pbuf,  (len - 12 - 2)) == _SUCCESS)/*  12 = param header, 2:no packed */
 		ret = 0;
 	else
 		ret = -EINVAL;
@@ -787,7 +787,7 @@ static int rtw_add_sta(struct net_device *dev, struct ieee_param *param)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)
+	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
 		return -EINVAL;
 
 	if (param->sta_addr[0] == 0xff && param->sta_addr[1] == 0xff &&
@@ -815,7 +815,7 @@ static int rtw_add_sta(struct net_device *dev, struct ieee_param *param)
 		memcpy(psta->bssrateset, param->u.add_sta.tx_supp_rates, 16);
 
 		/* check wmm cap. */
-		if (WLAN_STA_WME&flags)
+		if (WLAN_STA_WME & flags)
 			psta->qos_option = 1;
 		else
 			psta->qos_option = 0;
@@ -824,7 +824,7 @@ static int rtw_add_sta(struct net_device *dev, struct ieee_param *param)
 			psta->qos_option = 0;
 
 		/* chec 802.11n ht cap. */
-		if (WLAN_STA_HT&flags) {
+		if (WLAN_STA_HT & flags) {
 			psta->htpriv.ht_option = true;
 			psta->qos_option = 1;
 			memcpy((void *)&psta->htpriv.ht_cap, (void *)&param->u.add_sta.ht_cap, sizeof(struct ieee80211_ht_cap));
@@ -852,7 +852,7 @@ static int rtw_del_sta(struct net_device *dev, struct ieee_param *param)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)
+	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
 		return -EINVAL;
 
 	if (param->sta_addr[0] == 0xff && param->sta_addr[1] == 0xff &&
@@ -891,7 +891,7 @@ static int rtw_ioctl_get_sta_data(struct net_device *dev, struct ieee_param *par
 	struct ieee_param_ex *param_ex = (struct ieee_param_ex *)param;
 	struct sta_data *psta_data = (struct sta_data *)param_ex->data;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)
+	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
 		return -EINVAL;
 
 	if (param_ex->sta_addr[0] == 0xff && param_ex->sta_addr[1] == 0xff &&
@@ -948,7 +948,7 @@ static int rtw_get_sta_wpaie(struct net_device *dev, struct ieee_param *param)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
-	if (check_fwstate(pmlmepriv, (_FW_LINKED|WIFI_AP_STATE)) != true)
+	if (check_fwstate(pmlmepriv, (_FW_LINKED | WIFI_AP_STATE)) != true)
 		return -EINVAL;
 
 	if (param->sta_addr[0] == 0xff && param->sta_addr[1] == 0xff &&
@@ -965,7 +965,7 @@ static int rtw_get_sta_wpaie(struct net_device *dev, struct ieee_param *param)
 
 			wpa_ie_len = psta->wpa_ie[1];
 
-			copy_len = ((wpa_ie_len+2) > sizeof(psta->wpa_ie)) ? (sizeof(psta->wpa_ie)):(wpa_ie_len+2);
+			copy_len = ((wpa_ie_len + 2) > sizeof(psta->wpa_ie)) ? (sizeof(psta->wpa_ie)) : (wpa_ie_len + 2);
 
 			param->u.wpa_ie.len = copy_len;
 
@@ -990,7 +990,7 @@ static int rtw_set_wps_beacon(struct net_device *dev, struct ieee_param *param,
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) != true)
 		return -EINVAL;
 
-	ie_len = len-12-2;/*  12 = param header, 2:no packed */
+	ie_len = len - 12 - 2;/*  12 = param header, 2:no packed */
 
 	kfree(pmlmepriv->wps_beacon_ie);
 	pmlmepriv->wps_beacon_ie = NULL;
@@ -1021,7 +1021,7 @@ static int rtw_set_wps_probe_resp(struct net_device *dev, struct ieee_param *par
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) != true)
 		return -EINVAL;
 
-	ie_len = len-12-2;/*  12 = param header, 2:no packed */
+	ie_len = len - 12 - 2;/*  12 = param header, 2:no packed */
 
 	kfree(pmlmepriv->wps_probe_resp_ie);
 	pmlmepriv->wps_probe_resp_ie = NULL;
@@ -1048,7 +1048,7 @@ static int rtw_set_wps_assoc_resp(struct net_device *dev, struct ieee_param *par
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) != true)
 		return -EINVAL;
 
-	ie_len = len-12-2;/*  12 = param header, 2:no packed */
+	ie_len = len - 12 - 2;/*  12 = param header, 2:no packed */
 
 	kfree(pmlmepriv->wps_assoc_resp_ie);
 	pmlmepriv->wps_assoc_resp_ie = NULL;
@@ -1086,14 +1086,14 @@ static int rtw_set_hidden_ssid(struct net_device *dev, struct ieee_param *param,
 
 	mlmeinfo->hidden_ssid_mode = ignore_broadcast_ssid = param->u.bcn_ie.reserved[1];
 
-	ie_len = len-12-2;/*  12 = param header, 2:no packed */
+	ie_len = len - 12 - 2;/*  12 = param header, 2:no packed */
 	ssid_ie = rtw_get_ie(param->u.bcn_ie.buf,  WLAN_EID_SSID, &ssid_len, ie_len);
 
 	if (ssid_ie && ssid_len > 0 && ssid_len <= NDIS_802_11_LENGTH_SSID) {
 		struct wlan_bssid_ex *pbss_network = &mlmepriv->cur_network.network;
 		struct wlan_bssid_ex *pbss_network_ext = &mlmeinfo->network;
 
-		memcpy(ssid, ssid_ie+2, ssid_len);
+		memcpy(ssid, ssid_ie + 2, ssid_len);
 		ssid[ssid_len] = 0x0;
 
 		memcpy(pbss_network->ssid.ssid, (void *)ssid, ssid_len);
-- 
2.39.2 (Apple Git-143)

