Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629AA347FD1
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548504; cv=none; b=FJ7Gn2Q5epIOeok3L8OAClhUcHyLiYnonSSiMrEorDAAlfoSZHBcnfa+icYP2G+02c4hNZvgtr/GW21fOI2h8t/2Jv+OinsHo9oSilKqW57uV34jubdSf3uDnb551Gjgd/8tsapLcUgrKbHea5taSpUGTohVreDMHArNi+BMPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548504; c=relaxed/simple;
	bh=N8khu4ebeNVyn5aYyOOBo6CrD8cUIN10bo4atc44ywQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5IXuOxW3QITkddk8Dvm/gtj5A7dLaZWJk+rwWvtupmVV+l2Lnt4Jd8uYTVq0XJJwHtk9TxY4msm/kh/kByzpbHloaF+jomVMdleifi+3eMcXSNTf+dybM4GrSPgeRvuHeVfAOwxND84gJ96jbv4UEviJ1qatB2R8e79bByJwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sV05fkaV; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sV05fkaV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JH8x6eHNrUmno3toU2/nr6gLEP8ME+pH2Q0OsTQ/kPI=;
	b=sV05fkaVXw6NaosVhPFbKz2LaNeknMAeZ1FNGOIjH7Z0JLDSeMWtNmTu7WjAHBZwN0n2nC
	doi0GNRVn/buQYLdK3s8Z/7+lC1G/Xw7H7sQphUyYDzIwHuZxJG5I4HgT6JVWPjhl/oTxG
	GZPyPYBQbpYgzi3SXVPDu4CJRhlClYg=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 06/22] staging: rtl8723bs: remove NDIS type aliases
Date: Sun,  8 Feb 2026 12:00:55 +0100
Message-ID: <20260208110111.46642-7-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove Windows NDIS-style type aliases and replace with standard Linux
kernel types. This makes the code more readable and follows Linux kernel
coding style by using explicit types instead of Windows-style typedefs.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      |  2 +-
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h |  3 ---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h  |  2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 12 ++++--------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 ++--
 5 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..2fc966ac5d3f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -491,7 +491,7 @@ struct sta_info *rtw_get_stainfo(struct sta_priv *pstapriv, u8 *hwaddr)
 u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
 {
 	struct sta_info *psta;
-	NDIS_802_11_MAC_ADDRESS	bcast_addr = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
+	u8 bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	struct	sta_priv *pstapriv = &padapter->stapriv;
 	/* struct __queue	*pstapending = &padapter->xmitpriv.bm_pending; */
diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index ab349de733c8..d8dd4b6d7aca 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,9 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-
-typedef u8 NDIS_802_11_PMKID_VALUE[16];
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index afa5631a441a..77b50e72b065 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -253,7 +253,7 @@ struct FW_Sta_Info {
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	u8  SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 };
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index eb38594c8f5c..7071bd1a02fa 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -15,10 +15,6 @@
 #define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_MAC_ADDRESS[6];
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
-
 struct ndis_802_11_ssid {
 	u32  ssid_length;
 	u8  ssid[32];
@@ -64,10 +60,10 @@ struct ndis_80211_var_ie {
 };
 
 /* Length is the 4 bytes multiples of the sum of
- * sizeof (NDIS_802_11_MAC_ADDRESS) + 2 +
+ * 6 (mac_address) + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
  * sizeof (long) + sizeof (enum ndis_802_11_network_type) +
- * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
+ * sizeof (struct ndis_802_11_conf) + 16 (supported_rates) + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
  * define a macro to present the partial sum.
@@ -155,7 +151,7 @@ struct wlan_bcn_info {
 */
 struct wlan_bssid_ex {
 	u32  length;
-	NDIS_802_11_MAC_ADDRESS  mac_address;
+	u8  mac_address[ETH_ALEN];
 	u8  reserved[2];/* 0]: IS beacon frame */
 	struct ndis_802_11_ssid  ssid;
 	u32  privacy;
@@ -163,7 +159,7 @@ struct wlan_bssid_ex {
 	enum ndis_802_11_network_type  network_type_in_use;
 	struct ndis_802_11_conf  configuration;
 	enum ndis_802_11_network_infrastructure  infrastructure_mode;
-	NDIS_802_11_RATES_EX  supported_rates;
+	u8  supported_rates[NDIS_802_11_LENGTH_RATES_EX];
 	struct wlan_phy_info phy_info;
 	u32  ie_length;
 	u8  ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..51725c302458 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -381,7 +381,7 @@ void rtw_cfg80211_ibss_indicate_connect(struct adapter *padapter)
 				return;
 			}
 			if (!memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
-				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+				&& !memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			)
 				rtw_cfg80211_inform_bss(padapter, scanned);
 			else
@@ -422,7 +422,7 @@ void rtw_cfg80211_indicate_connect(struct adapter *padapter)
 			goto check_bss;
 		}
 
-		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, sizeof(NDIS_802_11_MAC_ADDRESS))
+		if (!memcmp(scanned->network.mac_address, pnetwork->mac_address, ETH_ALEN)
 			&& !memcmp(&(scanned->network.ssid), &(pnetwork->ssid), sizeof(struct ndis_802_11_ssid))
 		)
 			rtw_cfg80211_inform_bss(padapter, scanned);
-- 
2.52.0

