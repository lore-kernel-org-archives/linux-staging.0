Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1392FAE
	for <linux-staging@lists.linux.dev>; Wed, 16 Jun 2021 08:08:56 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G4d493yCpzXgbv;
	Wed, 16 Jun 2021 16:03:53 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 16 Jun 2021 16:08:53 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 16 Jun
 2021 16:08:53 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>
Subject: [PATCH -next 3/3] staging: rtl8723bs: hal: use eth_broadcast_addr() to assign broadcast address
Date: Wed, 16 Jun 2021 16:12:43 +0800
Message-ID: <20210616081243.2511663-4-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616081243.2511663-1-yangyingliang@huawei.com>
References: <20210616081243.2511663-1-yangyingliang@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

Using eth_broadcast_addr() to assign broadcast address instead
of copying from an array that contains the all-ones broadcast
address.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index e2ec82915073..2b7077bb52df 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -114,14 +114,13 @@ static void ConstructBeacon(struct adapter *padapter, u8 *pframe, u32 *pLength)
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	pwlanhdr = (struct ieee80211_hdr *)pframe;
 
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	memcpy(pwlanhdr->addr1, bc_addr, ETH_ALEN);
+	eth_broadcast_addr(pwlanhdr->addr1);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
-- 
2.25.1

