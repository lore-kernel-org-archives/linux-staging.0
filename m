Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63682F80
	for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 13:51:23 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id t21so14668062plo.2
        for <linux-staging@lists.linux.dev>; Mon, 24 May 2021 06:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YV3QWporRSMJ3f8RtEYw0j1RbTzpRz2DPRalTB4xuQE=;
        b=tf6SN8VnD7pKCXGSuMvJ+XMmrBk9KvhIyl7H8gB4sDx5fqQ+6f0i4aI9ApwIt5B12i
         enGTQIiWWR6EpaYz8LkHG9BY1sGR0ojlcNAY+9/AUnSRw+JtnOOp++qN1o2fBDNzAOlz
         AXS7oQarU1YPPAyW1mNbWqtJdh+VEVxsza038vBlIW/2nhTpMtj0SngS3f5Ba7BeN6F4
         Ui6LRCm3D5Tn+3PwwsMwN1Yx/Xjxi2Iax49zOLjX5JxI9tNar4R5KNgwbaNWqRcJ2Pjn
         tobqJ68ILTTGDcdgDN+rkp4cSabUGyggQXRgbnBCdJeb2p17xuWcKUwY0BTnNHRqmMT6
         SIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YV3QWporRSMJ3f8RtEYw0j1RbTzpRz2DPRalTB4xuQE=;
        b=ZE4YsYipwH9aH6d/CpTT+My40ozljB276NMo/0bcm8J0LBw9Gl7uz4H1rT4x71ZXKe
         1FAaz9rJKgeqeew3w9X1AtZJKuN8xfBl55gj41k82k7jxyuTp3U98noO7QVmKmFfQRc/
         Xbt32QTg2TBlZuVx1ciC+1gdGMoPs8RFe9G7cd3d2NWO06KuUGRUviBLZFYijSKrbuyO
         bd7uxQbjGehUGlkniOlZ/nbYpm3oT1DbrUAh7M7rGhkKS8Q8J9IQkeqJzk4n6PDQmTdb
         pFhaHuu7kBbz92RBgwtXkano7WrtyhtcPdyZZDgdH8YfIjAX5HWcB64vHOnvtJMeBsg1
         YzlA==
X-Gm-Message-State: AOAM5331k81wcQpN0/yrH98MH4vtWq4c270LCj9JaSpce3++5LnjuofI
	a/jU/oYBxSqqcWIIQKruzW3+lJpZxDLykg==
X-Google-Smtp-Source: ABdhPJwYDNhk5T10mJKLjmqf9RIdw4fPBpd8EbvHIbtw4OmJQu+0XCNsdxPs3GIIKfnK/lRTw/Y5rw==
X-Received: by 2002:a17:90a:4f01:: with SMTP id p1mr25073970pjh.28.1621864282485;
        Mon, 24 May 2021 06:51:22 -0700 (PDT)
Received: from fedora.. ([49.36.218.98])
        by smtp.googlemail.com with ESMTPSA id z9sm8638106pji.47.2021.05.24.06.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 06:51:22 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	straube.linux@gmail.com,
	fabioaiuto83@gmail.com
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: fix suspect indents
Date: Mon, 24 May 2021 19:21:05 +0530
Message-Id: <20210524135105.5550-4-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524135105.5550-1-chouhan.shreyansh630@gmail.com>
References: <20210524135105.5550-1-chouhan.shreyansh630@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed extra spaces and indents from core/rtw_wlan_util.c.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dd965c810967..afabb9d48021 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1254,34 +1254,34 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	/* parsing HT_CAP_IE */
 	p = rtw_get_ie(bssid->IEs + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->IELength - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
-			pht_cap = (struct ieee80211_ht_cap *)(p + 2);
-			ht_cap_info = le16_to_cpu(pht_cap->cap_info);
+		pht_cap = (struct ieee80211_ht_cap *)(p + 2);
+		ht_cap_info = le16_to_cpu(pht_cap->cap_info);
 	} else {
-			ht_cap_info = 0;
+		ht_cap_info = 0;
 	}
 	/* parsing HT_INFO_IE */
 	p = rtw_get_ie(bssid->IEs + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, bssid->IELength - _FIXED_IE_LENGTH_);
 	if (p && len > 0) {
-			pht_info = (struct HT_info_element *)(p + 2);
-			ht_info_infos_0 = pht_info->infos[0];
+		pht_info = (struct HT_info_element *)(p + 2);
+		ht_info_infos_0 = pht_info->infos[0];
 	} else {
-			ht_info_infos_0 = 0;
+		ht_info_infos_0 = 0;
 	}
 	if (ht_cap_info != cur_network->BcnInfo.ht_cap_info ||
-		((ht_info_infos_0&0x03) != (cur_network->BcnInfo.ht_info_infos_0&0x03))) {
-			{
-				/* bcn_info_update */
-				cur_network->BcnInfo.ht_cap_info = ht_cap_info;
-				cur_network->BcnInfo.ht_info_infos_0 = ht_info_infos_0;
-				/* to do : need to check that whether modify related register of BB or not */
-			}
-			/* goto _mismatch; */
+	    ((ht_info_infos_0&0x03) != (cur_network->BcnInfo.ht_info_infos_0&0x03))) {
+		{
+			/* bcn_info_update */
+			cur_network->BcnInfo.ht_cap_info = ht_cap_info;
+			cur_network->BcnInfo.ht_info_infos_0 = ht_info_infos_0;
+			/* to do : need to check that whether modify related register of BB or not */
+		}
+		/* goto _mismatch; */
 	}
 
 	/* Checking for channel */
 	p = rtw_get_ie(bssid->IEs + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS, &len, bssid->IELength - _FIXED_IE_LENGTH_);
 	if (p) {
-			bcn_channel = *(p + 2);
+		bcn_channel = *(p + 2);
 	} else {/* In 5G, some ap do not have DSSET IE checking HT info for channel */
 		rtw_get_ie(bssid->IEs + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION,
 			   &len, bssid->IELength - _FIXED_IE_LENGTH_);
@@ -1292,7 +1292,7 @@ int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
 	}
 
 	if (bcn_channel != Adapter->mlmeextpriv.cur_channel)
-			goto _mismatch;
+		goto _mismatch;
 
 	/* checking SSID */
 	ssid_len = 0;
@@ -1535,21 +1535,21 @@ unsigned char check_assoc_AP(u8 *pframe, uint len)
 			if ((!memcmp(pIE->data, ARTHEROS_OUI1, 3)) || (!memcmp(pIE->data, ARTHEROS_OUI2, 3)))
 				return HT_IOT_PEER_ATHEROS;
 			else if ((!memcmp(pIE->data, BROADCOM_OUI1, 3)) ||
-			         (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
-			         (!memcmp(pIE->data, BROADCOM_OUI3, 3)))
-			      return HT_IOT_PEER_BROADCOM;
+				 (!memcmp(pIE->data, BROADCOM_OUI2, 3)) ||
+				 (!memcmp(pIE->data, BROADCOM_OUI3, 3)))
+				return HT_IOT_PEER_BROADCOM;
 			else if (!memcmp(pIE->data, MARVELL_OUI, 3))
-			      return HT_IOT_PEER_MARVELL;
+				return HT_IOT_PEER_MARVELL;
 			else if (!memcmp(pIE->data, RALINK_OUI, 3))
-			      return HT_IOT_PEER_RALINK;
+				return HT_IOT_PEER_RALINK;
 			else if (!memcmp(pIE->data, CISCO_OUI, 3))
-			      return HT_IOT_PEER_CISCO;
+				return HT_IOT_PEER_CISCO;
 			else if (!memcmp(pIE->data, REALTEK_OUI, 3))
-			      return get_realtek_assoc_AP_vender(pIE);
+				return get_realtek_assoc_AP_vender(pIE);
 			else if (!memcmp(pIE->data, AIRGOCAP_OUI, 3))
-			      return HT_IOT_PEER_AIRGO;
+				return HT_IOT_PEER_AIRGO;
 			else
-			      break;
+				break;
 
 		default:
 			break;
-- 
2.31.1

