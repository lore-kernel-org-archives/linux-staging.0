Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BB82FBF
	for <linux-staging@lists.linux.dev>; Mon, 31 May 2021 07:58:18 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FtnBV6KGMz66cm;
	Mon, 31 May 2021 15:35:14 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 15:38:10 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 15:38:10 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <linux-staging@lists.linux.dev>
CC: Shaokun Zhang <zhangshaokun@hisilicon.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
Subject: [PATCH] staging: rtl8192u: remove the repeated declaration
Date: Mon, 31 May 2021 15:37:58 +0800
Message-ID: <1622446678-52652-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Functions 'ieee80211_stop_send_beacons' and 'notify_wx_assoc_event'
are declared twice in their header file, so remove the repeated
declaration.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
---
 drivers/staging/rtl8192u/ieee80211/ieee80211.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211.h b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
index 39f4ddd86796..7903c777a417 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211.h
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211.h
@@ -2249,10 +2249,8 @@ void ieee80211_wake_queue(struct ieee80211_device *ieee);
 void ieee80211_stop_queue(struct ieee80211_device *ieee);
 struct sk_buff *ieee80211_get_beacon(struct ieee80211_device *ieee);
 void ieee80211_start_send_beacons(struct ieee80211_device *ieee);
-void ieee80211_stop_send_beacons(struct ieee80211_device *ieee);
 int ieee80211_wpa_supplicant_ioctl(struct ieee80211_device *ieee,
 				   struct iw_point *p);
-void notify_wx_assoc_event(struct ieee80211_device *ieee);
 void ieee80211_ps_tx_ack(struct ieee80211_device *ieee, short success);
 
 void softmac_mgmt_xmit(struct sk_buff *skb, struct ieee80211_device *ieee);
-- 
2.7.4

