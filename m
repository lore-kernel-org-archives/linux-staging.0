Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D572
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 09:32:59 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Hg0ht4hjYz90Vh;
	Thu, 28 Oct 2021 17:32:46 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 28 Oct 2021 17:32:50 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 28 Oct
 2021 17:32:50 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH -next] staging: r8188eu: fix missing unlock in rtw_resume()
Date: Thu, 28 Oct 2021 17:40:38 +0800
Message-ID: <20211028094038.2877341-1-yangyingliang@huawei.com>
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
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

Add the missing unlock before return from rtw_resume().

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 2b42bd58b321 ("staging: r8188eu: introduce new os_dep dir for RTL8188eu driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 6b93830130e7..5a35d9fe3fc9 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -298,8 +298,10 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 		pwrpriv->bkeepfwalive = false;
 
 	DBG_88E("bkeepfwalive(%x)\n", pwrpriv->bkeepfwalive);
-	if (pm_netdev_open(pnetdev, true) != 0)
+	if (pm_netdev_open(pnetdev, true) != 0) {
+		mutex_unlock(&pwrpriv->lock);
 		goto exit;
+	}
 
 	netif_device_attach(pnetdev);
 	netif_carrier_on(pnetdev);
-- 
2.25.1

