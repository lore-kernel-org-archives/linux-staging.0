Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1290C7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 09:43:03 +0000 (UTC)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MQPnb1XSHzmVCx;
	Sun, 11 Sep 2022 17:39:15 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:42:55 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <gregkh@linuxfoundation.org>, <aldas60@gmail.com>,
	<karllinuxtest.relton@ntlworld.com>, <cuigaosheng1@huawei.com>
CC: <linux-staging@lists.linux.dev>
Subject: [PATCH] staging: wlan-ng: remove unused p80211wext_handler_def declaration
Date: Sun, 11 Sep 2022 17:42:55 +0800
Message-ID: <20220911094255.3225461-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected

p80211wext_handler_def has been removed since
commit cb3126e60ffc ("Staging: wlan-ng: Switch from wext
to cfg80211"), so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/staging/wlan-ng/p80211netdev.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.h b/drivers/staging/wlan-ng/p80211netdev.h
index 5654dc54ae91..1cee51a1075e 100644
--- a/drivers/staging/wlan-ng/p80211netdev.h
+++ b/drivers/staging/wlan-ng/p80211netdev.h
@@ -137,8 +137,6 @@ struct p80211_frmrx {
 
 /* called by /proc/net/wireless */
 struct iw_statistics *p80211wext_get_wireless_stats(struct net_device *dev);
-/* wireless extensions' ioctls */
-extern struct iw_handler_def p80211wext_handler_def;
 
 /* WEP stuff */
 #define NUM_WEPKEYS 4
-- 
2.25.1

