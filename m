Received: from mail.meizu.com (edge07.meizu.com [112.91.151.210])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF95D7E
	for <linux-staging@lists.linux.dev>; Fri, 11 Mar 2022 10:33:25 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail11.meizu.com
 (172.16.1.15) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 11 Mar
 2022 18:33:25 +0800
Received: from meizu.meizu.com (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 11 Mar
 2022 18:33:23 +0800
From: Haowen Bai <baihaowen@meizu.com>
To: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Haowen
 Bai" <baihaowen@meizu.com>
Subject: [PATCH] staging: r8188eu: simplify unnecessary NULL check
Date: Fri, 11 Mar 2022 18:33:21 +0800
Message-ID: <1646994801-26211-1-git-send-email-baihaowen@meizu.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-126.meizu.com (172.16.1.126) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

remove the optimisation of NULL checking it inline, kfree/rtw_free_netdev
will take care if that would ever be the case.

Signed-off-by: Haowen Bai <baihaowen@meizu.com>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 91792df..8d1ac48 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -425,10 +425,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 		rtw_handle_dualmac(padapter, 0);
 free_adapter:
 	if (status != _SUCCESS) {
-		if (pnetdev)
-			rtw_free_netdev(pnetdev);
-		else if (padapter)
-			vfree(padapter);
+		rtw_free_netdev(pnetdev);
+		vfree(padapter);
 		padapter = NULL;
 	}
 exit:
-- 
2.7.4

