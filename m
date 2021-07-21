Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0712FB0
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:43 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id ga14so3299703ejc.6
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SMjuPxhinOa2feNA8CC5hEMDGs+6QzUFA+HdTbnhsDk=;
        b=IBHBLDkC9SXhRKFYeg9i1nJxQtOCOJtYpeb6wOTneByiF8GeUTHxCm1B30vNJnkvvF
         mvpNroxZ83v6G2G37Jo/hIVRWBDRWyd8jniGZsqUuIlOc82QhEzDkoIiDEzekjbl5zAz
         /HGyDSk3uMXAY6B4roPmGnP+QT0Tx1AFP4jYmhGxdjyCpEHL6DZfMXS2OoG7qgpHveal
         +98x8jYjp1aZH3RfVWp5Z56xHXTZk7IH0d+ScZitdjCOw9ARK6yHQ+6lLcAvwj6mgHwB
         zSgqJixx79yO4zplA42DnTT6bGOfPshteUWDmY7JLisMh++hIgJ7FxYxq28ye/IrZsNP
         Lidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SMjuPxhinOa2feNA8CC5hEMDGs+6QzUFA+HdTbnhsDk=;
        b=Do9wACNUYsTg2OkcHqzcXiDmnK7KMGw07obiEnCOmHh81FEoRvlV0sVLu7Fy3BCqyq
         PTJN6Yt0Un8PvUD7uF3P0rsQjR6gUAYyFEvtswIQaWeunEWQCPJWOdIz/VtWvs1uCC3k
         jMMoxodeJuafLcxWZW8vlsUYZZFf84cKtjwmVrXp3LKeW7D64q/RVP+A1ACENkHgWo2W
         5HI3j9o2JRZwVPBYsNXoJdsvIq041ujJyQIFn++fazib2BA35sHYjfk+zN2hxWgOmAjH
         T9TyuPio1hgzi0IeNyTLBIfnBNIGtfPFXcQ08y33uj4nAKodch0dwEx6sOVcLvXnI4K2
         aOvQ==
X-Gm-Message-State: AOAM531FICY1PM/qICcGSmq2cZiOWc5iK9AqpTFzvAbkaFkVMbAXf/Fx
	87F/Hc9jvJyLK65IaZgkBd15MNkGrNI=
X-Google-Smtp-Source: ABdhPJzhLyld393a04kENDgH2k5G0ICSJ/UT5tdH9GT+qq1PXXeBA88cpcZGN821RvIeVoT9OaBOHw==
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr37936233ejn.57.1626874661630;
        Wed, 21 Jul 2021 06:37:41 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id c17sm10677121edv.6.2021.07.21.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:41 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/16] staging: rtl8723bs: fix camel case in struct wlan_phy_info
Date: Wed, 21 Jul 2021 15:37:18 +0200
Message-Id: <caadcfc157d62b633fd757d5696c1abce5ef9ae9.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case in struct wlan_phy_info all over the driver.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 30 +++++++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  8 ++---
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  8 ++---
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  2 +-
 .../staging/rtl8723bs/os_dep/ioctl_linux.c    |  4 +--
 5 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index f9c3525ffb57..a0c19253095d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -452,7 +452,7 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 {
 	long rssi_ori = dst->rssi;
 
-	u8 sq_smp = src->phy_info.SignalQuality;
+	u8 sq_smp = src->phy_info.signal_quality;
 
 	u8 ss_final;
 	u8 sq_final;
@@ -470,13 +470,13 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 			rssi_final = rssi_ori;
 	} else {
 		if (sq_smp != 101) { /* from the right channel */
-			ss_final = ((u32)(src->phy_info.SignalStrength)+(u32)(dst->phy_info.SignalStrength)*4)/5;
-			sq_final = ((u32)(src->phy_info.SignalQuality)+(u32)(dst->phy_info.SignalQuality)*4)/5;
+			ss_final = ((u32)(src->phy_info.signal_strength)+(u32)(dst->phy_info.signal_strength)*4)/5;
+			sq_final = ((u32)(src->phy_info.signal_quality)+(u32)(dst->phy_info.signal_quality)*4)/5;
 			rssi_final = (src->rssi+dst->rssi*4)/5;
 		} else {
 			/* bss info not receiving from the right channel, use the original RX signal infos */
-			ss_final = dst->phy_info.SignalStrength;
-			sq_final = dst->phy_info.SignalQuality;
+			ss_final = dst->phy_info.signal_strength;
+			sq_final = dst->phy_info.signal_quality;
 			rssi_final = dst->rssi;
 		}
 
@@ -488,8 +488,8 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 		memcpy((u8 *)dst, (u8 *)src, get_wlan_bssid_ex_sz(src));
 	}
 
-	dst->phy_info.SignalStrength = ss_final;
-	dst->phy_info.SignalQuality = sq_final;
+	dst->phy_info.signal_strength = ss_final;
+	dst->phy_info.signal_quality = sq_final;
 	dst->rssi = rssi_final;
 }
 
@@ -568,8 +568,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			pnetwork->join_res = 0;
 
 			/* bss info not receiving from the right channel */
-			if (pnetwork->network.phy_info.SignalQuality == 101)
-				pnetwork->network.phy_info.SignalQuality = 0;
+			if (pnetwork->network.phy_info.signal_quality == 101)
+				pnetwork->network.phy_info.signal_quality = 0;
 		} else {
 			/* Otherwise just pull from the free list */
 
@@ -585,8 +585,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			pnetwork->last_scanned = jiffies;
 
 			/* bss info not receiving from the right channel */
-			if (pnetwork->network.phy_info.SignalQuality == 101)
-				pnetwork->network.phy_info.SignalQuality = 0;
+			if (pnetwork->network.phy_info.signal_quality == 101)
+				pnetwork->network.phy_info.signal_quality = 0;
 
 			list_add_tail(&(pnetwork->list), &(queue->queue));
 
@@ -1120,10 +1120,10 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
-	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.SignalStrength;
-	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.SignalQuality;
-	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.SignalStrength instead (has scaled) */
-	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.SignalStrength);
+	padapter->recvpriv.signal_strength = ptarget_wlan->network.phy_info.signal_strength;
+	padapter->recvpriv.signal_qual = ptarget_wlan->network.phy_info.signal_quality;
+	/* the ptarget_wlan->network.rssi is raw data, we use ptarget_wlan->network.phy_info.signal_strength instead (has scaled) */
+	padapter->recvpriv.rssi = translate_percentage_to_dbm(ptarget_wlan->network.phy_info.signal_strength);
 
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 97d4c425b29b..5942e51b23b6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3995,8 +3995,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	/* get the signal strength */
 	bssid->rssi = precv_frame->u.hdr.attrib.phy_info.RecvSignalPower; /*  in dBM.raw data */
-	bssid->phy_info.SignalQuality = precv_frame->u.hdr.attrib.phy_info.SignalQuality;/* in percentage */
-	bssid->phy_info.SignalStrength = precv_frame->u.hdr.attrib.phy_info.SignalStrength;/* in percentage */
+	bssid->phy_info.signal_quality = precv_frame->u.hdr.attrib.phy_info.SignalQuality;/* in percentage */
+	bssid->phy_info.signal_strength = precv_frame->u.hdr.attrib.phy_info.SignalStrength;/* in percentage */
 
 	/*  checking SSID */
 	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len, bssid->ie_length - ie_offset);
@@ -4095,9 +4095,9 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 			pmlmepriv->num_sta_no_ht++;
 	}
 
-	/*  mark bss info receiving from nearby channel as SignalQuality 101 */
+	/*  mark bss info receiving from nearby channel as signal_quality 101 */
 	if (bssid->configuration.ds_config != rtw_get_oper_ch(padapter))
-		bssid->phy_info.SignalQuality = 101;
+		bssid->phy_info.signal_quality = 101;
 
 	return _SUCCESS;
 }
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 331578129644..4e6d0b8e17a6 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -143,10 +143,10 @@ struct ndis_802_11_wep {
 #endif
 
 struct wlan_phy_info {
-	u8 SignalStrength;/* in percentage) */
-	u8 SignalQuality;/* in percentage) */
-	u8 Optimum_antenna;  /* for Antenna diversity */
-	u8 Reserved_0;
+	u8 signal_strength;/* in percentage) */
+	u8 signal_quality;/* in percentage) */
+	u8 optimum_antenna;  /* for Antenna diversity */
+	u8 reserved_0;
 };
 
 struct wlan_bcn_info {
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 17628704d428..bcd8d03a35a0 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -290,7 +290,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		is_same_network(&pmlmepriv->cur_network.network, &pnetwork->network, 0)) {
 		notify_signal = 100*translate_percentage_to_dbm(padapter->recvpriv.signal_strength);/* dbm */
 	} else {
-		notify_signal = 100*translate_percentage_to_dbm(pnetwork->network.phy_info.SignalStrength);/* dbm */
+		notify_signal = 100*translate_percentage_to_dbm(pnetwork->network.phy_info.signal_strength);/* dbm */
 	}
 
 	buf = kzalloc(MAX_BSSINFO_LEN, GFP_ATOMIC);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 95aef62ecfb8..8c44db696b52 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -303,8 +303,8 @@ static char *translate_scan(struct adapter *padapter,
 		ss = padapter->recvpriv.signal_strength;
 		sq = padapter->recvpriv.signal_qual;
 	} else {
-		ss = pnetwork->network.phy_info.SignalStrength;
-		sq = pnetwork->network.phy_info.SignalQuality;
+		ss = pnetwork->network.phy_info.signal_strength;
+		sq = pnetwork->network.phy_info.signal_quality;
 	}
 
 
-- 
2.20.1

