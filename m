Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6592C82
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:44:22 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o1-20020a1c4d01000000b0034d95625e1fso346834wmh.4
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5qz+qgLODZnruM+F08P67iRjAkVj73AodAc3wDZ1Lpw=;
        b=7bdo58l6BlLbff0I7C1Kh0RY/3K2w/XKXcPmwwPssxOh/tuQ9UOwZ5FfcQSc6nfva4
         3WynxdUwSh5Skh00ccvNh0ORKFSPxOoKbgTo7fp7bRpy8oT5p2Deelcm7Aq0mynX+mNY
         2GTgTJod/ECCCaUFUIKuqLcDHncoJNA8/szQpH5U8cedd+6A50BOT664AcJ+ZMvymWbW
         YL1IM4t10Yl4Bx0fdzzGOE5B9EG5ZLFAWyExXRhBP/Lu9UBlxX8yZw+QD9NO4ZjkDiBo
         z45SpFXVdJjdnSAGQPDPw4YgBB5Evd5Y3+XVF9prOZ3KFz+nhKSB31ZD1cp13+Z5ZYj/
         clnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5qz+qgLODZnruM+F08P67iRjAkVj73AodAc3wDZ1Lpw=;
        b=qOTPIGNF0TS1Dj0KuVvJEMwfUlRFkwZiZCVfjUsKcupj49PrFL8dnPupXYgRQ1w6JN
         rCyQfkVcYk/EbEPjko0vVSF2GGYv//VFpHxIWFOnUFeH3S1P7rzCiN6DWzZicW6pgDzM
         v8PrPSa7u5ECoq9W5NBIbspcTOXKlW1m9snce4SXBYEnnp8RjTp9iYow0OKd34HhBna7
         5wEa9zRsuf9pMfWiLaSJ6bJLmFvOM3XjvMcm8znc13qhx75WFJnVrmFkoYjRaAaP3nZN
         OHlex3ldezOHoQ6sPkfKGDLOa9G2o4SX+ApnDzWsHM44tT2QZhUSRtqWhxqAg2MHK6xU
         kjLQ==
X-Gm-Message-State: AOAM530omT8+lPeTgiYBppP8CTKwuBLxNhPfui/J2A2kudKZ13tW1IDd
	+jZiWoPHfRWcBQb82glwqC1rpQ==
X-Google-Smtp-Source: ABdhPJzya/Mo+UHTsAQ/LKtlmYhFB+Xd3R05VVkbVBgyKcLxp0X7BVzHNAIqGhYFiKUB5gZWgvNrJg==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr392533wmj.2.1643064261042;
        Mon, 24 Jan 2022 14:44:21 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id i3sm15010613wru.33.2022.01.24.14.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:44:20 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH 01/10] staging: r8188eu: remove previously added dev_dbg and netdev_dbg calls
Date: Mon, 24 Jan 2022 22:44:06 +0000
Message-Id: <20220124224415.831-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124224415.831-1-phil@philpotter.co.uk>
References: <20220124224415.831-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove previously added dev_dbg and netdev_dbg calls that were added
during conversion of DBG_88E_LEVEL (and some of DBG_88E) macros. After
much thought and discussion with others, I think it makes sense to
just remove all trace of these macros. If more debugging code is needed
in future, then it can be added via standard kernel mechanisms at that
time.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_cmd.c        |  8 +-----
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  |  5 ----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 28 -------------------
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 14 ++--------
 drivers/staging/r8188eu/core/rtw_security.c   | 19 ++-----------
 drivers/staging/r8188eu/core/rtw_xmit.c       |  2 --
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  2 --
 8 files changed, 6 insertions(+), 73 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 8bfb01c2ebb5..297d59508a05 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -252,12 +252,8 @@ int rtw_cmd_thread(void *context)
 
 _next:
 		if (padapter->bDriverStopped ||
-		    padapter->bSurpriseRemoved) {
-			netdev_dbg(padapter->pnetdev,
-				   "DriverStopped(%d) SurpriseRemoved(%d) break\n",
-				   padapter->bDriverStopped, padapter->bSurpriseRemoved);
+		    padapter->bSurpriseRemoved)
 			break;
-		}
 
 		pcmd = rtw_dequeue_cmd(pcmdpriv);
 		if (!pcmd)
@@ -574,8 +570,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	else
 		padapter->pwrctrlpriv.smart_ps = padapter->registrypriv.smart_ps;
 
-	netdev_dbg(padapter->pnetdev, "smart_ps = %d\n", padapter->pwrctrlpriv.smart_ps);
-
 	pcmd->cmdsz = get_wlan_bssid_ex_sz(psecnetwork);/* get cmdsz before endian conversion */
 
 	INIT_LIST_HEAD(&pcmd->list);
diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index eadfbdb94dd5..82795be79a52 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -110,8 +110,6 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 	u32 cur_time = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	netdev_dbg(padapter->pnetdev, "set bssid:%pM\n", bssid);
-
 	if ((bssid[0] == 0x00 && bssid[1] == 0x00 && bssid[2] == 0x00 &&
 	     bssid[3] == 0x00 && bssid[4] == 0x00 && bssid[5] == 0x00) ||
 	    (bssid[0] == 0xFF && bssid[1] == 0xFF && bssid[2] == 0xFF &&
@@ -185,9 +183,6 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct wlan_network *pnetwork = &pmlmepriv->cur_network;
 
-	netdev_dbg(padapter->pnetdev, "set ssid [%s] fw_state=0x%08x\n",
-		   ssid->Ssid, get_fwstate(pmlmepriv));
-
 	if (!padapter->hw_init_completed) {
 		status = _FAIL;
 		goto exit;
diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index a9141ab1690e..f99c1bcff1e9 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -656,8 +656,6 @@ unsigned int OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
-					netdev_dbg(padapter->pnetdev,
-						   "ap has changed, disconnect now\n");
 					receive_disconnect(padapter,
 							   pmlmeinfo->network.MacAddress, 0);
 					return _SUCCESS;
@@ -934,7 +932,6 @@ unsigned int OnAuthClient(struct adapter *padapter, struct recv_frame *precv_fra
 	}
 
 	if (go2asoc) {
-		netdev_dbg(padapter->pnetdev, "auth success, start assoc\n");
 		start_clnt_assoc(padapter);
 		return _SUCCESS;
 	}
@@ -1506,10 +1503,6 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		netdev_dbg(padapter->pnetdev,
-			   "ap recv deauth reason code(%d) sta:%pM\n",
-			   reason, GetAddr2Ptr(pframe));
-
 		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 		if (psta) {
 			u8 updated = 0;
@@ -1544,10 +1537,6 @@ unsigned int OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 			}
 		}
 
-		netdev_dbg(padapter->pnetdev,
-			   "sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
-			   reason, GetAddr3Ptr(pframe), ignore_received_deauth);
-
 		if (!ignore_received_deauth)
 			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 	}
@@ -1581,10 +1570,6 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		netdev_dbg(padapter->pnetdev,
-			   "ap recv disassoc reason code(%d) sta:%pM\n",
-			   reason, GetAddr2Ptr(pframe));
-
 		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 		if (psta) {
 			u8 updated = 0;
@@ -1602,10 +1587,6 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 
 		return _SUCCESS;
 	} else {
-		netdev_dbg(padapter->pnetdev,
-			   "ap recv disassoc reason code(%d) sta:%pM\n",
-			   reason, GetAddr3Ptr(pframe));
-
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
@@ -6485,7 +6466,6 @@ void start_clnt_auth(struct adapter *padapter)
 	/*	For the Win8 P2P connection, it will be hard to have a successful connection if this Wi-Fi doesn't connect to it. */
 	issue_deauth(padapter, (&pmlmeinfo->network)->MacAddress, WLAN_REASON_DEAUTH_LEAVING);
 
-	netdev_dbg(padapter->pnetdev, "start auth\n");
 	issue_auth(padapter, NULL, 0);
 
 	set_link_timer(pmlmeext, REAUTH_TO);
@@ -7246,8 +7226,6 @@ void linked_status_chk(struct adapter *padapter)
 			if (rx_chk == _FAIL) {
 				pmlmeext->retry++;
 				if (pmlmeext->retry > rx_chk_limit) {
-					netdev_dbg(padapter->pnetdev,
-						   "disconnect or roaming\n");
 					receive_disconnect(padapter, pmlmeinfo->network.MacAddress,
 							   WLAN_REASON_EXPIRATION_CHK);
 					return;
@@ -7772,9 +7750,6 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 	/* write cam */
 	ctrl = BIT(15) | ((pparm->algorithm) << 2) | pparm->keyid;
 
-	netdev_dbg(padapter->pnetdev,
-		   "set group key to hw: alg:%d(WEP40-1 WEP104-5 TKIP-2 AES-4) keyid:%d\n",
-		   pparm->algorithm, pparm->keyid);
 	write_cam(padapter, pparm->keyid, ctrl, null_sta, pparm->key);
 
 	return H2C_SUCCESS;
@@ -7803,9 +7778,6 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 
 	cam_id = 4;
 
-	netdev_dbg(padapter->pnetdev,
-		   "set pairwise key to hw: alg:%d(WEP40-1 WEP104-5 TKIP-2 AES-4) camid:%d\n",
-		   pparm->algorithm, cam_id);
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 46e44aee587f..a0651015e97c 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -14,15 +14,8 @@ void ips_enter(struct adapter *padapter)
 	struct xmit_priv *pxmit_priv = &padapter->xmitpriv;
 
 	if (pxmit_priv->free_xmitbuf_cnt != NR_XMITBUFF ||
-	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
-		netdev_dbg(padapter->pnetdev,
-			   "There are some pkts to transmit\n");
-		netdev_dbg(padapter->pnetdev,
-			   "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
-			   pxmit_priv->free_xmitbuf_cnt,
-			   pxmit_priv->free_xmit_extbuf_cnt);
+	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF)
 		return;
-	}
 
 	mutex_lock(&pwrpriv->lock);
 
@@ -35,7 +28,6 @@ void ips_enter(struct adapter *padapter)
 	DBG_88E("==>ips_enter cnts:%d\n", pwrpriv->ips_enter_cnts);
 	if (rf_off == pwrpriv->change_rfpwrstate) {
 		pwrpriv->bpower_saving = true;
-		netdev_dbg(padapter->pnetdev, "nolinked power save enter\n");
 
 		if (pwrpriv->ips_mode == IPS_LEVEL_2)
 			pwrpriv->bkeepfwalive = true;
@@ -65,10 +57,8 @@ int ips_leave(struct adapter *padapter)
 		DBG_88E("==>ips_leave cnts:%d\n", pwrpriv->ips_leave_cnts);
 
 		result = rtw_ips_pwr_up(padapter);
-		if (result == _SUCCESS) {
+		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
-		}
-		netdev_dbg(padapter->pnetdev, "nolinked power save leave\n");
 
 		if ((_WEP40_ == psecuritypriv->dot11PrivacyAlgrthm) || (_WEP104_ == psecuritypriv->dot11PrivacyAlgrthm)) {
 			DBG_88E("==>%s, channel(%d), processing(%x)\n", __func__, padapter->mlmeextpriv.cur_channel, pwrpriv->bips_processing);
diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 4e93c720c1b6..b73aea8a7fb5 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -545,8 +545,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 			if (is_multicast_ether_addr(prxattrib->ra)) {
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					netdev_dbg(padapter->pnetdev,
-						   "rx bc/mc packets, but didn't install group key!\n");
 					goto exit;
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
@@ -1146,7 +1144,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	return res;
 }
 
-static int aes_decipher(struct adapter *padapter, u8 *key, uint hdrlen,
+static int aes_decipher(u8 *key, uint hdrlen,
 			u8 *pframe, uint plen)
 {
 	static u8	message[MAX_MSG_SIZE];
@@ -1329,13 +1327,8 @@ static int aes_decipher(struct adapter *padapter, u8 *key, uint hdrlen,
 
 	/* compare the mic */
 	for (i = 0; i < 8; i++) {
-		if (pframe[hdrlen + 8 + plen - 8 + i] != message[hdrlen + 8 + plen - 8 + i]) {
-			netdev_dbg(padapter->pnetdev,
-				   "mic check error mic[%d]: pframe(%x)!=message(%x)\n",
-				   i, pframe[hdrlen + 8 + plen - 8 + i],
-				   message[hdrlen + 8 + plen - 8 + i]);
+		if (pframe[hdrlen + 8 + plen - 8 + i] != message[hdrlen + 8 + plen - 8 + i])
 			res = _FAIL;
-		}
 	}
 
 	return res;
@@ -1361,16 +1354,10 @@ u32 rtw_aes_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 				/* in concurrent we should use sw descrypt in group key, so we remove this message */
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					netdev_dbg(padapter->pnetdev,
-						   "rx bc/mc packets, but didn't install group key!\n");
 					goto exit;
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
 				if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-					netdev_dbg(padapter->pnetdev,
-						   "not match packet_index=%d, install_index=%d\n",
-						   prxattrib->key_index,
-						   psecuritypriv->dot118021XGrpKeyid);
 					res = _FAIL;
 					goto exit;
 				}
@@ -1378,7 +1365,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 				prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 			}
 			length = precvframe->len - prxattrib->hdrlen - prxattrib->iv_len;
-			res = aes_decipher(padapter, prwskey, prxattrib->hdrlen, pframe, length);
+			res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
 		} else {
 			res = _FAIL;
 		}
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 8503059edc46..fc71884685bb 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -460,8 +460,6 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 				}
 			}
 		}
-	} else if (0x888e == pattrib->ether_type) {
-		netdev_dbg(padapter->pnetdev, "send eapol packet\n");
 	}
 
 	if ((pattrib->ether_type == 0x888e) || (pattrib->dhcp_pkt == 1))
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b818872e0d19..b2d1e8c50543 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -539,7 +539,6 @@ static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 	memcpy(pFirmware->szFwBuffer, fw->data, fw->size);
 	pFirmware->ulFwLength = fw->size;
 	release_firmware(fw);
-	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", pFirmware->ulFwLength);
 
 Exit:
 	return rtStatus;
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 41b457838a5b..b8ea599fd7cf 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -58,7 +58,6 @@ void rtw_indicate_wx_assoc_event(struct adapter *padapter)
 
 	memcpy(wrqu.ap_addr.sa_data, pmlmepriv->cur_network.network.MacAddress, ETH_ALEN);
 
-	netdev_dbg(padapter->pnetdev, "assoc success\n");
 	wireless_send_event(padapter->pnetdev, SIOCGIWAP, &wrqu, NULL);
 }
 
@@ -71,7 +70,6 @@ void rtw_indicate_wx_disassoc_event(struct adapter *padapter)
 	wrqu.ap_addr.sa_family = ARPHRD_ETHER;
 	memset(wrqu.ap_addr.sa_data, 0, ETH_ALEN);
 
-	netdev_dbg(padapter->pnetdev, "indicate disassoc\n");
 	wireless_send_event(padapter->pnetdev, SIOCGIWAP, &wrqu, NULL);
 }
 
-- 
2.34.1

