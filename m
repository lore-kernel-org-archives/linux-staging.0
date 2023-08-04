Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B08825
	for <linux-staging@lists.linux.dev>; Fri,  4 Aug 2023 08:41:37 +0000 (UTC)
Received: from dggpemm100003.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RHJy83yd1ztRlb;
	Fri,  4 Aug 2023 16:38:08 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm100003.china.huawei.com (7.185.36.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 16:41:31 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 4 Aug
 2023 16:41:31 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <hdegoede@redhat.com>,
	<yangyingliang@huawei.com>
Subject: [PATCH -next 1/2] staging: rtl8723bs: use is_zero_ether_addr() instead of memcmp()
Date: Fri, 4 Aug 2023 16:38:40 +0800
Message-ID: <20230804083841.1321554-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected

Use is_zero_ether_addr() instead of memcmp to check
if the ethernet address is all zeros.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  3 +--
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 12 ++++++------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 +--
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7e2c61c75150..b59d510956b0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -226,9 +226,8 @@ struct wlan_network *_rtw_find_network(struct __queue *scanned_queue, u8 *addr)
 {
 	struct list_head	*phead, *plist;
 	struct	wlan_network *pnetwork = NULL;
-	u8 zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
 
-	if (!memcmp(zero_addr, addr, ETH_ALEN)) {
+	if (is_zero_ether_addr(addr)) {
 		pnetwork = NULL;
 		goto exit;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7c7b6495965f..7be11dc3d725 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -670,9 +670,9 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 			goto exit;
 		}
 
-		if (!memcmp(pattrib->bssid, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) ||
-		   !memcmp(mybssid, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) ||
-		   (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
+		if (is_zero_ether_addr(pattrib->bssid) ||
+		    is_zero_ether_addr(mybssid) ||
+		    (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
 			ret = _FAIL;
 			goto exit;
 		}
@@ -762,9 +762,9 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 
 
 		/*  check BSSID */
-		if (!memcmp(pattrib->bssid, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) ||
-		     !memcmp(mybssid, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) ||
-		     (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
+		if (is_zero_ether_addr(pattrib->bssid) ||
+		    is_zero_ether_addr(mybssid) ||
+		    (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
 
 			if (!bmcast)
 				issue_deauth(adapter, pattrib->bssid, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 292cba045023..af155fca39b8 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1850,9 +1850,8 @@ static int cfg80211_rtw_set_pmksa(struct wiphy *wiphy,
 	u8 index, blInserted = false;
 	struct adapter *padapter = rtw_netdev_priv(ndev);
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
-	u8 strZeroMacAddress[ETH_ALEN] = { 0x00 };
 
-	if (!memcmp((u8 *)pmksa->bssid, strZeroMacAddress, ETH_ALEN))
+	if (is_zero_ether_addr((u8 *)pmksa->bssid))
 		return -EINVAL;
 
 	blInserted = false;
-- 
2.25.1

